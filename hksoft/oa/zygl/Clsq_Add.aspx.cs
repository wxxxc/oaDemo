using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zygl
{
    public partial class Clsq_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10108", "0");

                //短信
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                DropDownListBind();

                sqbm.SelectedValue = this.Session["deptid"].ToString();
            }
        }

        //dp绑定 
        public void DropDownListBind()
        {
            // SqlDataReader datar = SqlHelper.ExecuteReader("select id,clmc from oa_clda where id not in (select xycl from oa_clsq where zt in ('审批中','已同意') and (getdate() between xssj_s and xssj_e))");
            string sql_xycl = "select id,clmc from oa_clda where clzt='未借出'";
            bd.Bind_DropDownList(xycl, sql_xycl, "id", "clmc", "", "");

            string sql_jsy = "select xm,id from OA_JSYDA order by id";
            bd.Bind_DropDownList(jsy, sql_jsy, "id", "xm", "", "");

            bd.Bind_DropDownList_bm(sqbm, "", "", "");
        }


        protected void Save_Click(object sender, EventArgs e)
        {
            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            DateTime sdateStr = default(DateTime);
            DateTime edateStr = default(DateTime);
            sdateStr = Convert.ToDateTime(xssj_s.Text + " " + sxs.SelectedValue + sfz.SelectedValue + "00");
            edateStr = Convert.ToDateTime(xssj_e.Text + " " + exs.SelectedValue + efz.SelectedValue + "00");

            string sql = null;
            if (s == "SaveBtn")
            {
                sql = "insert into oa_clsq(sqbm,ccxs,fcdd,dddd,czrs,xssj_s,xssj_e,ccsy,xycl,jsy,bz,zt,sqr,sqsj) values('" + sqbm.SelectedValue + "','" + ccxs.SelectedValue + "','" + hkdb.GetStr(fcdd.Text) + "','" + hkdb.GetStr(dddd.Text) + "','" + hkdb.GetStr(czrs.Text) + "','" + sdateStr + "','" + edateStr + "','" + hkdb.GetStr(ccsy.Text) + "','" + xycl.SelectedValue + "','" + jsy.SelectedValue + "','" + hkdb.GetStr(bz.Text) + "','审批中','" + this.Session["userid"] + "',GETDATE())";
            }

            SqlHelper.ExecuteSql(sql);

            //Msg 
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                SqlDataReader datar = SqlHelper.ExecuteReader("select glry from oa_clda where id='" + xycl.SelectedValue + "'");
                if (datar.Read())
                {
                    ycxx.Text = datar["glry"].ToString();
                    datar.Close();

                    string message = this.Session["username"].ToString() + "申请从" + sdateStr + "到" + edateStr + "使用[" + xycl.SelectedItem.Text + "]!";
                    hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), ycxx.Text, message);
                }
                else
                {
                    datar.Close();
                }
            }
            //判断btn 
            if (s == "SaveBtn")
            {
                mydb.Alert_Refresh_Close("保存成功并已送审！", "Zysq.aspx");
            }
        }

        //清空 
        protected void Clear_Click(object sender, EventArgs e)
        {
            //sqbm.SelectedValue = "";
            ccxs.SelectedValue = "";
            fcdd.Text = "";
            dddd.Text = "";
            czrs.Text = "";
            xssj_s.Text = "";
            xssj_e.Text = "";
            ccsy.Text = "";
            xycl.SelectedValue = "";
            jsy.SelectedValue = "";
            bz.Text = "";
            sxs.SelectedValue = "";
            sfz.SelectedValue = "";
            exs.SelectedValue = "";
            efz.SelectedValue = "";
        }
    }
}
