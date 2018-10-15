using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Bkpr_View_pfxm : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        BindData_HR bd_hr = new BindData_HR();

        protected void Page_Load(object Sender, EventArgs E)
        {
            hkdb.VeriSess("4");

            bid.Text = (string)Request.QueryString["id"].ToString();

            if (!IsPostBack)
            {
                hkdb.PassTo("81103", "0");

                DropDownListBind();

                if (string.IsNullOrEmpty(bid.Text))
                {
                    SaveBtn.Enabled = false;
                    DelBtn.Enabled = false;
                }
            }

            GridViewBind();
        }

        //dp绑定
        public void DropDownListBind()
        {
            bd_hr.Bind_DropDownList_pfxm(ssxmid, "", "", "");
        }

        //gv绑定 
        public void GridViewBind()
        {
            //岗位分
            lblgwf.Text = "岗位分：" + SqlHelper.ExecuteScalar("SELECT ISNULL(SUM(FZ),0) FROM HR_Kpdf_Bkpr02 WHERE SSBID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'").ToString();
            
            SqlDataSource1.SelectCommand = "";
            SqlDataSource1.SelectCommand = "SELECT A.*,B.XMMC FROM HR_Kpdf_Bkpr02 A LEFT OUTER JOIN HR_Kpdf_Pfxm B ON(A.SSXMID=B.XMID) WHERE SSBID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' ORDER BY B.PXH";
        }

        protected void Save_Click(object Sender, EventArgs E)
        {
            //评分等级必须为是
            if (bd.CheckRepeat("SELECT xmid FROM HR_Kpdf_Pfxm WHERE XMID='" + ssxmid.SelectedValue + "' AND PFDJ='否'") == "true")
            {
                mydb.Alert("保存失败,该项目未设置评分等级，不能参与评分！");
                return;
            }

            //评分项目判断（重复）
            if (bd.CheckRepeat("SELECT aid FROM HR_Kpdf_Bkpr02 WHERE SSBID='" + hkdb.GetStr(bid.Text) + "' AND SSXMID='" + ssxmid.SelectedValue + "'") == "true")
            {
                mydb.Alert("保存失败,该评分项目已存在！");
                return;
            }

            SqlHelper.ExecuteSql("INSERT INTO HR_Kpdf_Bkpr02(SSBID,SSXMID,FZ,KPXZ,PFDJ_Y,PFDJ_L,PFDJ_Z,PFDJ_C,CJR,CJSJ) VALUES"
                 + "('" + hkdb.GetStr(bid.Text) + "','" + ssxmid.SelectedValue + "', '" + hkdb.GetStr(fz.Text) + "', '" + hkdb.GetStr(kpxz.Text) + "', '" + hkdb.GetStr(pfdj_y.Text) + "', '" + hkdb.GetStr(pfdj_l.Text) + "', '" + hkdb.GetStr(pfdj_z.Text) + "', '" + hkdb.GetStr(pfdj_c.Text) + "','" + this.Session["UserID"] + "',GETDATE())");

            ssxmid.SelectedValue = "";
            fz.Text = "";
            pfdj_y.Text = "";
            pfdj_l.Text = "";
            pfdj_z.Text = "";
            pfdj_c.Text = "";
            kpxz.Text = "";

            mydb.Alert_Refresh("保存成功！", "Bkpr.aspx");

            GridViewBind();
        }

        //删除
        protected void Del_Click(object Sender, EventArgs E)
        {
            int i = 0;
            string Str1 = "";
            System.Web.UI.WebControls.CheckBox chk = default(System.Web.UI.WebControls.CheckBox);
            System.Web.UI.WebControls.Label Lab = default(System.Web.UI.WebControls.Label);
            i = 0;
            foreach (GridViewRow oDataGridItem in GridView1.Rows)
            {
                chk = (CheckBox)oDataGridItem.FindControl("chk");
                if (chk.Checked)
                {
                    i = 1;
                    Lab = (Label)oDataGridItem.FindControl("dp_id");
                    if (string.IsNullOrEmpty(Str1))
                    {
                        Str1 = ((Label)oDataGridItem.FindControl("dp_id")).Text;
                    }
                    else
                    {
                        Str1 = Str1 + "','" + Lab.Text.Trim();
                    }
                }
            }
            if (i == 0)
            {
                mydb.Alert("删除失败,请先选中记录！");
                return;
            }
            else
            {
                SqlHelper.ExecuteSql("Delete FROM HR_Kpdf_Bkpr02 where aid in ('" + Str1 + "')");

                mydb.Alert_Refresh("删除成功！", "Bkpr.aspx");

                GridViewBind();
            }
        }

        //gv行处理 
        public void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }

        protected void ssxmid_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ssxmid.SelectedValue))
            {
                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HR_Kpdf_Pfxm WHERE XMID='" + ssxmid.SelectedValue + "'");
                if (datar.Read())
                {
                    fz.Text = datar["FZ"].ToString();
                    kpxz.Text = datar["KPXZ"].ToString();
                    pfdj_y.Text = datar["PFDJ_Y"].ToString();
                    pfdj_l.Text = datar["PFDJ_L"].ToString();
                    pfdj_z.Text = datar["PFDJ_Z"].ToString();
                    pfdj_c.Text = datar["PFDJ_C"].ToString();
                }
                datar.Close();
            }
        }
    }
}
