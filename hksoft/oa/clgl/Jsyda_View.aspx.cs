using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.clgl
{
    public partial class Jsyda_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10802", "0");

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SqlDataReader datar = SqlHelper.ExecuteReader("select a.*,b.ui_desc from OA_JSYDA a left outer join yh b on (a.jdr=b.ui_id) where id='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                    if (datar.Read())
                    {
                        xm.Text = datar["xm"].ToString();
                        xb.SelectedValue = datar["xb"].ToString();
                        nl.Text = datar["nl"].ToString();
                        jrrq.Text = string.Format("{0:d}", datar["jrrq"]);
                        bz.Text = datar["bz"].ToString();
                        jdr.Text = datar["ui_desc"].ToString();
                        jdsj.Text = string.Format("{0:d}", datar["jdsj"]);
                        jdr_label.Text = "建档：";
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

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            if (lbltitle.Text == "新增")
            {
                SqlHelper.ExecuteSql("insert into OA_JSYDA(xm,xb,nl,jrrq,bz,jdr,jdsj) values('" + hkdb.GetStr(xm.Text) + "','" + xb.SelectedValue + "','" + hkdb.GetStr(nl.Text) + "','" + hkdb.GetStr(jrrq.Text) + "','" + hkdb.GetStr(bz.Text) + "','" + this.Session["userid"] + "',GETDATE())");
            }
            else
            {
                SqlHelper.ExecuteSql("update OA_JSYDA set xm='" + hkdb.GetStr(xm.Text) + "',xb='" + xb.SelectedValue + "',nl='" + hkdb.GetStr(nl.Text) + "',jrrq='" + hkdb.GetStr(jrrq.Text) + "',bz='" + hkdb.GetStr(bz.Text) + "' where id='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            }

            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Jsyda.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！", "Jsyda.aspx");
            }
        }

        //清空 
        protected void Clear_Click()
        {
            xm.Text = "";
            nl.Text = "";
            nl.Text = "";
            jrrq.Text = "";
            bz.Text = "";
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            int j = 0;
            j = (int)SqlHelper.ExecuteScalar("select count(*) from oa_clsq where jsy = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            if (j > 0)
            {
                mydb.Alert("删除失败,要删除的驾驶员已存在记录！");
            }
            else
            {
                SqlHelper.ExecuteSql("delete from OA_JSYDA where id = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                mydb.Alert_Refresh_Close("删除成功！", "Jsyda.aspx");
            }
        }
    }
}
