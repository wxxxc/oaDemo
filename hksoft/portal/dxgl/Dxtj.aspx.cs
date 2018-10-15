using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.dxgl
{
    public partial class Dxtj : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public string Data1;
        public string Data2;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11002", "11002");

                OperQx();

                //txtSdate.Text = hkdb.SetDate("D", -30);
                txtSdate.Text = hkdb.SetDate("auto",0);
                txtEdate.Text = hkdb.SetDate("D", 1);

                GridViewBind();
            }
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(OutBtn, "11002e", Session["roleqx"].ToString());
        }

        public void GridViewBind()
        {
            Data1 = txtSdate.Text;
            Data2 = txtEdate.Text;

            string str1 = " WHERE dTimingTime>='" + txtSdate.Text + "' AND dTimingTime<='" + txtEdate.Text + "'";

            if (tjfs.SelectedValue == "bm")
            {
                GridView1.Visible = true;
                GridView2.Visible = false;

                if (!string.IsNullOrEmpty(user.Text))
                {
                    str1 = str1 + " AND BM_MC LIKE '%" + hkdb.GetStr(user.Text) + "%'";
                }

                if (!string.IsNullOrEmpty(fsjg.SelectedValue))
                {
                    str1 = str1 + " AND A.nIsSend='" + fsjg.SelectedValue + "'";
                }

                DataSet ds = SqlHelper.ExecuteDs("SELECT D.BM_BM,D.BM_MC,COUNT(*)AS NUMS FROM TSMSSENDLOG A LEFT OUTER JOIN YH B ON (A.SSENDER=B.UI_ID) LEFT OUTER JOIN BM D ON (B.UI_SSBM=D.BM_ID) " + str1 + " GROUP BY D.BM_BM,D.BM_MC ORDER BY NUMS DESC");
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                GridView1.Visible = false;
                GridView2.Visible = true;

                if (!string.IsNullOrEmpty(user.Text))
                {
                    str1 = str1 + " AND (UI_ID LIKE '%" + hkdb.GetStr(user.Text) + "%' OR UI_DESC LIKE '%" + hkdb.GetStr(user.Text) + "%')";
                }

                if (!string.IsNullOrEmpty(fsjg.SelectedValue))
                {
                    str1 = str1 + " AND A.nIsSend='" + fsjg.SelectedValue + "'";
                }

                DataSet ds = SqlHelper.ExecuteDs("SELECT SSENDER,UI_DESC,COUNT(*)AS NUMS,BM_MC FROM TSMSSENDLOG A LEFT OUTER JOIN YH B ON (A.SSENDER=B.UI_ID) LEFT OUTER JOIN BM C ON(B.UI_SSBM=C.BM_ID) " + str1 + " GROUP BY SSENDER,UI_DESC,BM_MC ORDER BY NUMS DESC");
                GridView2.DataSource = ds;
                GridView2.DataBind();
            }
        }

        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //gv行处理 
        protected void OnRow_Bound1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }

        //gv行处理 
        protected void OnRow_Bound2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }

        protected void tjfs_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tjfs.SelectedValue == "bm")
            {
                lbltitle.Text = "部门名:";
            }
            else
            {
                lbltitle.Text = "员工号或姓名:";
            }

            GridViewBind();
        }

        //导出
        protected void Out_Click(object sender, EventArgs e)
        {
            Data1 = txtSdate.Text;
            Data2 = txtEdate.Text;

            string str1 = " WHERE dTimingTime>='" + txtSdate.Text + "' AND dTimingTime<='" + txtEdate.Text + "'";

            if (tjfs.SelectedValue == "bm")
            {
                if (!string.IsNullOrEmpty(user.Text))
                {
                    str1 = str1 + " AND BM_MC LIKE '%" + hkdb.GetStr(user.Text) + "%' ";
                }

                if (!string.IsNullOrEmpty(fsjg.SelectedValue))
                {
                    str1 = str1 + " AND A.nIsSend='" + fsjg.SelectedValue + "'";
                }

                DataSet ds = SqlHelper.ExecuteDs("SELECT D.BM_BM AS '部门编码',D.BM_MC AS '部门名称',COUNT(*)AS '发送短信条数' FROM TSMSSENDLOG A LEFT OUTER JOIN YH B ON (A.SSENDER=B.UI_ID) LEFT OUTER JOIN BM D ON (B.UI_SSBM=D.BM_ID) " + str1 + " GROUP BY D.BM_BM,D.BM_MC");
                string fileName = "dxtj.xls";
                ExcelHelper.ExportDataSetToExcel(ds, fileName, "短信统计");
            }
            else
            {
                if (!string.IsNullOrEmpty(user.Text))
                {
                    str1 = str1 + " AND (UI_ID LIKE '%" + hkdb.GetStr(user.Text) + "%' OR UI_DESC LIKE '%" + hkdb.GetStr(user.Text) + "%')";
                }

                if (!string.IsNullOrEmpty(fsjg.SelectedValue))
                {
                    str1 = str1 + " AND A.nIsSend='" + fsjg.SelectedValue + "'";
                }

                DataSet ds = SqlHelper.ExecuteDs("SELECT SSENDER AS '编码',UI_DESC AS '用户姓名',BM_MC AS '部门',COUNT(*)AS '发送短信条数' FROM TSMSSENDLOG A LEFT OUTER JOIN YH B ON (A.SSENDER=B.UI_ID) LEFT OUTER JOIN BM C ON(B.UI_SSBM=C.BM_ID)" + str1 + " GROUP BY SSENDER,UI_DESC,BM_MC");
                string fileName = "dxtj.xls";
                ExcelHelper.ExportDataSetToExcel(ds, fileName, "短信统计");
            }
        }
    }
}
