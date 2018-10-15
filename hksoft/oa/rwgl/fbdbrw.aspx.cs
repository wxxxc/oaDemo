using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.rwgl
{
    public partial class fbdbrw : System.Web.UI.Page
    {
        public mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10301", "10301");

                //AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //����
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                //ҳ��� 
                GridViewBind();
            }
        }

        //��ѯ 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv�� 
        public void GridViewBind()
        {
            string Str1 = " where rwzt='¼��' and fbr='" + this.Session["userid"] + "' ";
            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + "and " + query_tj.SelectedItem.Value + " like '%" + hkdb.GetStr(query_content.Text) + "%' ";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_RWD01 a left outer join yh b on (a.fbr=b.ui_id) left outer JOIN hk_ZDYLX c on (a.rwxz=c.id)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select fblx,'���û�' as fblxmc,source,((select y.ui_desc+'��' from yh y where ui_id=(select SUBSTRING(convert(varchar(500), z.jsdx)+',',1,CHARINDEX(',',convert(varchar(500), z.jsdx)+',')-1) from OA_RWD01 z  where fblx='3' and a.rwid=z.rwid)))as jsdxmc,rwid,rwdh,rwbt,rwnr,(case when jjcd='��' then '��' when jjcd='��' then '��' else '��' end)as jjcd,rwxz,(case when ynxs='��' then 'ch' else 'noch' end)as ynxs,rwzt,fbr,fbsj,wcsj,b.ui_desc,c.mc,case when( fjmc=''or fjmc is null) then null else 'y' end as fjmc,case when ksrq='1900-01-01' then null else ksrq end as ksrq,case when jzrq='1900-01-01' then null else jzrq end as jzrq from OA_RWD01 a left outer join yh b on (a.fbr=b.ui_id) left outer JOIN hk_ZDYLX c on (a.rwxz=c.id)" + Str1 + "order by fbsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //gv�д��� 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }

        protected void Del_Click(object sender, EventArgs e)
        {
            string cal = "";
            int i = 0;
            for (i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Rows[i].Cells[1].FindControl("del");
                if (cb.Checked == true)
                {
                    if (string.IsNullOrEmpty(cal))
                    {
                        cal = GridView1.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        cal = cal + "','" + GridView1.DataKeys[i].Value.ToString();
                    }
                }
            }

            if (!string.IsNullOrEmpty(cal))
            {
                SqlHelper.ExecuteSql("delete from OA_RWD02 where ssrwid in ('" + cal + "')");
                SqlHelper.ExecuteSql("delete from OA_RWD01 where rwid in ('" + cal + "')");
                mydb.Alert("ɾ���ɹ���");
                GridViewBind();
            }
            else
            {
                mydb.Alert("ɾ��ʧ��,����ѡ�м�¼��");
            }
        }

        //���� 
        protected void Use_Click(object sender, EventArgs e)
        {
            string cal = "";
            string call = "";
            int i = 0;
            for (i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Rows[i].Cells[1].FindControl("del");
                if (cb.Checked == true)
                {
                    if (string.IsNullOrEmpty(cal))
                    {
                        cal = GridView1.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        cal = cal + "','" + GridView1.DataKeys[i].Value.ToString();
                    }

                    if (string.IsNullOrEmpty(call))
                    {
                        call = GridView1.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        call = call + "," + GridView1.DataKeys[i].Value.ToString();
                    }

                }
            }

            if (!string.IsNullOrEmpty(cal))
            {
                int j = 0;
                for (j = 0; j < (call.Split(',')).Length; j++)
                {
                    string mestr = "";
                    string rwdhstr = "";
                    string rwstr = "";

                    SqlDataReader datar = SqlHelper.ExecuteReader("select jsid,jsr from OA_RWD02 where ssrwid='" + call.Split(',')[j] + "'");
                    while (datar.Read())
                    {
                        mestr = mestr + "," + datar["jsr"].ToString();
                    }
                    datar.Close();

                    SqlDataReader datar1 = SqlHelper.ExecuteReader("select rwdh,rwbt from OA_RWD01 where rwid='" + call.Split(',')[j] + "'");
                    if (datar1.Read())
                    {
                        rwdhstr = rwdhstr + "," + "[" + datar1["rwdh"].ToString() + "]" + datar1["rwbt"].ToString();
                        rwstr= rwstr + "," + datar1["rwbt"].ToString();
                    }
                    datar1.Close();

                    //Msg 
                    if (xxtz.Checked == true | dxtz.Checked == true)
                    {
                        string message = "�����������" + rwdhstr.Substring(1) + "����!" + this.Session["username"].ToString();
                        string templateParam = "{\"name\":\""+ rwstr.Substring(1) + "\",\"status\":"+"\"������\""+"}";
                        if (!string.IsNullOrEmpty(mestr))
                        {
                            //hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), mestr.Substring(1), message);
                            hkdb.SendAliSMS(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), mestr.Substring(1), message,templateParam);
                        }
                        else
                        {
                            hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), mestr, message);
                        }
                    }
                    else
                    {
                        mydb.Alert("����ʧ��,��ѡ��վ����Ϣ���ֻ���������һ�֣�");
                        return;
                    }
                }

                SqlHelper.ExecuteSql("update OA_RWD01 set rwzt='�ѷ���' where rwid in ('" + cal + "')");
                mydb.Alert("�����ɹ���");
                GridViewBind();
            }
            else
            {
                mydb.Alert("����ʧ��,����ѡ�м�¼��");
            }

        }
    }
}
