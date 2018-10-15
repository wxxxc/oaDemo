using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Kqspsm_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11727", "0");

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";

                    SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KQ_SPSM a where smid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        smmc.Text = datar["smmc"].ToString();
                        smlx.SelectedValue = datar["smlx"].ToString();
                        syry.SelectedValue = datar["syry"].ToString();
                        editor.Value = datar["smnr"].ToString();
                        datar.Close();

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

        protected void Save_Click(object sender, EventArgs e)
        {
            if (lbltitle.Text == "新增")
            {
                //判断重复
                string sql = "SELECT smid FROM OA_KQ_SPSM WHERE SMLX='" + smlx.SelectedValue + "' AND SYRY='" + syry.SelectedValue + "'";
                if (bd.CheckRepeat(sql) == "true")
                {
                    mydb.Alert("此【类型+适用人员】下已存在记录，不能重复！");
                    return;
                }

                SqlHelper.ExecuteSql("insert into OA_KQ_SPSM(smmc,smlx,syry,smnr,cjr,cjsj) values('" + hkdb.GetStr(smmc.Text) + "','" + smlx.SelectedValue + "','" + syry.SelectedValue + "','" + editor.Value + "','" + this.Session["userid"] + "',GETDATE())");
            }
            else
            {
                //判断重复
                string sql = "SELECT smid FROM OA_KQ_SPSM WHERE SMLX='" + smlx.SelectedValue + "' AND SYRY='" + syry.SelectedValue + "' AND SMID<>'" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'";
                if (bd.CheckRepeat(sql) == "true")
                {
                    mydb.Alert("此【类型+适用人员】下已存在记录，不能重复！");
                    return;
                }

                SqlHelper.ExecuteSql("update OA_KQ_SPSM set smmc='" + hkdb.GetStr(smmc.Text) + "',smlx='" + smlx.SelectedValue + "',syry='" + syry.SelectedValue + "',smnr='" + editor.Value + "' where smid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            }

            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Kqspsm.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！","Kqspsm.aspx");
            }
        }

        protected void Clear_Click()
        {
            smmc.Text = "";
            smlx.SelectedValue = "请假单";
            syry.SelectedValue = "";
            editor.Value = "";
        }

        protected void Del_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            SqlHelper.ExecuteSql("delete from OA_KQ_SPSM where smid ='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            mydb.Alert_Refresh_Close("删除成功！","Kqspsm.aspx");
        }
    }
}
