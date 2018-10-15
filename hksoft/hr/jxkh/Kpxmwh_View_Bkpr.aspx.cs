using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Kpxmwh_View_Bkpr : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object Sender, EventArgs E)
        {
            hkdb.VeriSess("4");

            kpid.Text = (string)Request.QueryString["id"].ToString();

            if (!IsPostBack)
            {
                hkdb.PassTo("81105", "0");

                DropDownListBind();

                if (!string.IsNullOrEmpty(kpid.Text))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HR_Kpdf_Kpxm01 WHERE KPID='" + kpid.Text+ "'");
                    if (datar.Read())
                    {
                        if (datar["kpzt"].ToString() == "未生效")
                        {
                            SaveBtn.Visible = true;
                            DelBtn.Visible = true;
                            SaveAddBtn.Visible = true;
                        }
                    }
                    datar.Close();
                }
            }

            GridViewBind();
        }

        //dp绑定
        public void DropDownListBind()
        {
            string sql = "SELECT BID,XM+'('+BS+')'as bs FROM HR_Kpdf_Bkpr01 ORDER BY BID";
            bd.Bind_DropDownList(ssbid, sql, "BID", "bs", "", "");

        }

        //gv绑定 
        public void GridViewBind()
        {
            SqlDataSource1.SelectCommand = "";
            SqlDataSource1.SelectCommand = "SELECT DISTINCT B.*,(SELECT SUM(FZ) FROM HR_Kpdf_Kpxm02 WHERE SSKPID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' AND SSBID=B.BID)AS GWF FROM HR_Kpdf_Kpxm02 A LEFT OUTER JOIN HR_Kpdf_Bkpr01 B ON(A.SSBID=B.BID) WHERE A.SSKPID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' ORDER BY B.BID";
        }

        //单个添加
        protected void Save_Click(object Sender, EventArgs E)
        {
            //被考评人明细（重复）
            if (bd.CheckRepeat("SELECT mxid FROM HR_Kpdf_Kpxm02 WHERE SSKPID='" + hkdb.GetStr(kpid.Text) + "' AND SSBID='" + ssbid.SelectedValue + "'") == "true")
            {
                mydb.Alert("保存失败，该被考评人已在当前项目中存在！");
                return;
            }

            SqlHelper.ExecuteSql("INSERT INTO HR_Kpdf_Kpxm02(sskpid,ssbid,ssxmid,ssxmmc,sjxmid,sjxmmc,Fz,Kpxz,Pfdj_y,Pfdj_l,Pfdj_z,PFDJ_C) SELECT '" + hkdb.GetStr(kpid.Text) + "',A.ssbid,A.ssxmid,B.XMMC,B.UPID,(SELECT XMMC FROM HR_Kpdf_Pfxm WHERE xmid=B.upid)AS sjxmmc,A.Fz,A.Kpxz,A.Pfdj_y,A.Pfdj_l,A.Pfdj_z,A.PFDJ_C FROM HR_Kpdf_Bkpr02 A LEFT OUTER JOIN HR_Kpdf_Pfxm B ON(A.SSXMID=B.XMID) WHERE A.ssbid='" + ssbid.SelectedValue + "'");
            ssbid.SelectedValue = "";

            mydb.Alert_Refresh("保存成功！", "Kpxmwh.aspx");

            GridViewBind();
        }

        //批量添加
        protected void SaveAdd_Click(object Sender, EventArgs E)
        {
            SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HR_Kpdf_Bkpr01");
            while (datar.Read())
            {
                if (bd.CheckRepeat("SELECT mxid FROM HR_Kpdf_Kpxm02 WHERE SSKPID='" + hkdb.GetStr(kpid.Text) + "' AND SSBID='" + datar["bid"].ToString() + "'") == "false")
                {
                    SqlHelper.ExecuteSql("INSERT INTO HR_Kpdf_Kpxm02(sskpid,ssbid,ssxmid,ssxmmc,sjxmid,sjxmmc,Fz,Kpxz,Pfdj_y,Pfdj_l,Pfdj_z,PFDJ_C) SELECT '" + hkdb.GetStr(kpid.Text) + "',A.ssbid,A.ssxmid,B.XMMC,B.UPID,(SELECT XMMC FROM HR_Kpdf_Pfxm WHERE xmid=B.upid)AS sjxmmc,A.Fz,A.Kpxz,A.Pfdj_y,A.Pfdj_l,A.Pfdj_z,A.PFDJ_C FROM HR_Kpdf_Bkpr02 A LEFT OUTER JOIN HR_Kpdf_Pfxm B ON(A.SSXMID=B.XMID) WHERE A.ssbid='" + datar["bid"].ToString() + "'");
                }
            }
            datar.Close();

            ssbid.SelectedValue = "";

            mydb.Alert_Refresh("批量保存成功！", "Kpxmwh.aspx");

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
                SqlHelper.ExecuteSql("Delete FROM HR_Kpdf_Kpxm02 where sskpid='" + hkdb.GetStr(kpid.Text) + "' and ssbid in ('" + Str1 + "')");

                mydb.Alert_Refresh("删除成功！", "Kpxmwh.aspx");

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
    }
}
