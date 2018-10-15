using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.rzcx
{
    public partial class Rzcx_Cz : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("60309", "60309");

                OperQx();

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //txtSdate.Text = System.DateTime.Now.AddDays(0).ToString("yyyy-MM-dd");
                txtSdate.Text = Request.Cookies["haoke"].Values["sdate"].ToString();
                txtEdate.Text = System.DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
                GridViewBind();
            }
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(ExpBtn, "60309e", Session["roleqx"].ToString());
        }

        public void GridViewBind()
        {
            string str1 = " WHERE 1=1";

            //个人权限
            if (hkdb.StrIx("603091", Session["roleqx"].ToString()))
            {
                str1 = str1 + " AND UserID='" + this.Session["userid"] + "'";
            }

            //部门权限
            if (hkdb.StrIx("603092", Session["roleqx"].ToString()))
            {
                if (this.Session["bmglqx"].ToString() == "Y")
                {
                    string cal = "";
                    SqlDataReader dr_bm = SqlHelper.ExecuteReader("EXEC sp_RECUR_BM '" + this.Session["deptid"].ToString() + "'");
                    while (dr_bm.Read())
                    {
                        if (string.IsNullOrEmpty(cal))
                        {
                            cal = dr_bm["bm_id"].ToString();
                        }
                        else
                        {
                            cal = cal + "','" + dr_bm["bm_id"].ToString();
                        }
                    }
                    dr_bm.Close();

                    str1 = str1 + " AND DeptID IN('" + cal + "')";
                }
                else
                {
                    str1 = str1 + " AND DeptID='" + this.Session["deptid"] + "'";
                }
            }

            if (!string.IsNullOrEmpty(txtSdate.Text))
            {
                str1 = str1 + " AND NowTime>='" + hkdb.GetStr(txtSdate.Text) + "'";
            }

            if (!string.IsNullOrEmpty(txtEdate.Text))
            {
                str1 = str1 + " AND NowTime<='" + hkdb.GetStr(txtEdate.Text) + "'";
            }

            if (!string.IsNullOrEmpty(UserName.Text))
            {
                str1 = str1 + " AND UserName LIKE '%" + hkdb.GetStr(UserName.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(IPAddress.Text))
            {
                str1 = str1 + " AND IPAddress='" + hkdb.GetStr(IPAddress.Text) + "'";
            }

            if (!string.IsNullOrEmpty(LogContent.Text))
            {
                str1 = str1 + " AND LogContent LIKE '%" + hkdb.GetStr(LogContent.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(ModuName.Text))
            {
                if (ModuName.Text == "00000")
                {
                    str1 = str1 + " AND MODUID='00000'";
                }
                else
                {
                    str1 = str1 + " AND (MODUID LIKE '%" + hkdb.GetStr(ModuName.Text) + "%' OR MODU_MC LIKE '%" + hkdb.GetStr(ModuName.Text) + "%')";
                }
            }
            else
            {
                str1 = str1 + " AND MODUID<>'00000'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM HK_SYSTEMLOG A LEFT OUTER JOIN HK_MODU B ON(A.MODUID=B.MODU_ID) " + str1 + "");
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,B.MODU_MC FROM HK_SYSTEMLOG A LEFT OUTER JOIN HK_MODU B ON(A.MODUID=B.MODU_ID) " + str1 + " ORDER BY NOWTIME DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void Query_Click(object sender, EventArgs e)
        {
            //gv绑定 
            GridViewBind();
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            UserName.Text = "";
            IPAddress.Text = "";
            LogContent.Text = "";
            ModuName.Text = "";
        }

        //导出
        protected void Exp_Click(object sender, EventArgs e)
        {
            string str1 = " WHERE 1=1";

            //个人权限
            if (hkdb.StrIx("603091", Session["roleqx"].ToString()))
            {
                str1 = str1 + " AND UserID='" + this.Session["userid"] + "'";
            }

            //部门权限
            if (hkdb.StrIx("603092", Session["roleqx"].ToString()))
            {
                if (this.Session["bmglqx"].ToString() == "Y")
                {
                    string cal = "";
                    SqlDataReader dr_bm = SqlHelper.ExecuteReader("EXEC sp_RECUR_BM '" + this.Session["deptid"].ToString() + "'");
                    while (dr_bm.Read())
                    {
                        if (string.IsNullOrEmpty(cal))
                        {
                            cal = dr_bm["bm_id"].ToString();
                        }
                        else
                        {
                            cal = cal + "','" + dr_bm["bm_id"].ToString();
                        }
                    }
                    dr_bm.Close();

                    str1 = str1 + " AND DeptID IN('" + cal + "')";
                }
                else
                {
                    str1 = str1 + " AND DeptID='" + this.Session["deptid"] + "'";
                }
            }

            if (!string.IsNullOrEmpty(txtSdate.Text))
            {
                str1 = str1 + " AND NowTime>='" + hkdb.GetStr(txtSdate.Text) + "'";
            }

            if (!string.IsNullOrEmpty(txtEdate.Text))
            {
                str1 = str1 + " AND NowTime<='" + hkdb.GetStr(txtEdate.Text) + "'";
            }

            if (!string.IsNullOrEmpty(UserName.Text))
            {
                str1 = str1 + " AND UserName LIKE '%" + hkdb.GetStr(UserName.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(IPAddress.Text))
            {
                str1 = str1 + " AND IPAddress='" + hkdb.GetStr(IPAddress.Text) + "'";
            }

            if (!string.IsNullOrEmpty(LogContent.Text))
            {
                str1 = str1 + " AND LogContent LIKE '%" + hkdb.GetStr(LogContent.Text) + "%'";
            }

            if (!string.IsNullOrEmpty(ModuName.Text))
            {
                if (ModuName.Text == "00000")
                {
                    str1 = str1 + " AND MODUID='00000'";
                }
                else
                {
                    str1 = str1 + " AND (MODUID LIKE '%" + hkdb.GetStr(ModuName.Text) + "%' OR MODU_MC LIKE '%" + hkdb.GetStr(ModuName.Text) + "%')";
                }
            }
            else
            {
                str1 = str1 + " AND MODUID<>'00000'";
            }

            DataSet ds = SqlHelper.ExecuteDs("SELECT A.NOWTIME AS '操作日期',A.USERNAME AS '操作人',A.IPADDRESS AS 'IP地址',B.MODU_MC AS '模块名称',A.LOGCONTENT AS '日志内容' FROM HK_SYSTEMLOG A LEFT OUTER JOIN HK_MODU B ON(A.MODUID=B.MODU_ID) " + str1 + " ORDER BY NOWTIME DESC");

            string fileName = "czrzcx.xls";
            ExcelHelper.ExportDataSetToExcel(ds, fileName, "操作日志查询");
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}