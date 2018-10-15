using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zygl
{
    public partial class Zydj_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10501", "0");

                DropDownListBind();

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_ZYDJ where djid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        zymc.Text = datar["zymc"].ToString();
                        bz.Text = datar["bz"].ToString();
                        szbm.SelectedValue = datar["szbm"].ToString();
                        zyfl.SelectedValue = datar["zyfl"].ToString();
                        zt.Text = datar["zt"].ToString();
                        datar.Close();
                        //Init 
                        DelBtn.Visible = true;
                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert_Close("此记录不存在,可能已被删除！");
                    }
                }
                else
                {
                    lbltitle.Text = "新增";
                    SaveAddBtn.Visible = true;
                }
            }
        }

        //dp绑定 
        public void DropDownListBind()
        {
            string sql_zyfl = "select flmc,flid from OA_ZYFL order by flid";
            bd.Bind_DropDownList(zyfl, sql_zyfl, "flid", "flmc", "", "");
            //绑定部门
            bd.Bind_DropDownList_bm(szbm, "", "", "");

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (lbltitle.Text == "新增")
            {
                SqlHelper.ExecuteSql("insert into OA_ZYDJ(zymc,szbm,zyfl,zt,bz,djr,djsj) values('" + hkdb.GetStr(zymc.Text) + "','" + szbm.SelectedValue + "','" + zyfl.SelectedValue + "','" + hkdb.GetStr(zt.Text) + "','" + hkdb.GetStr(bz.Text) + "','" + this.Session["userid"] + "',GETDATE())");
            }
            else
            {
                SqlHelper.ExecuteSql("update OA_ZYDJ set zymc='" + hkdb.GetStr(zymc.Text) + "',szbm='" + szbm.SelectedValue + "',zyfl='" + zyfl.SelectedValue + "',zt='" + hkdb.GetStr(zt.Text) + "',bz='" + hkdb.GetStr(bz.Text) + "' where djid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            }

            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Zydj.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！", "Zydj.aspx");
            }
        }

        //清空 
        protected void Clear_Click()
        {
            zymc.Text = "";
            szbm.SelectedValue = "";
            zyfl.SelectedValue = "";
            zt.Text = "";
            bz.Text = "";
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            int j = 0;
            j = (int)SqlHelper.ExecuteScalar("select count(*) from oa_zysq where sqzy = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            if (j > 0)
            {
                mydb.Alert("删除失败,要删除的资源已存在申请记录！");
            }
            else
            {
                SqlHelper.ExecuteSql("delete from OA_ZYDJ where djid = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                mydb.Alert_Refresh_Close("删除成功！", "Zydj.aspx");
            }
        }
    }
}