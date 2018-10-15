using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.rzcx
{
    public partial class Rzcx_Mx1 : System.Web.UI.Page
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

                txtSdate.Text = System.DateTime.Now.AddDays(0).ToString("yyyy-MM-dd");
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
            string str1 = " WHERE B.UI_LX='企业' AND DL_RQ BETWEEN '" + hkdb.GetStr(txtSdate.Text) + "' AND '" + hkdb.GetStr(txtEdate.Text) + "'";

            //个人权限
            if (hkdb.StrIx("603091", Session["roleqx"].ToString()))
            {
                str1 = str1 + " AND DL_ID='" + this.Session["userid"] + "'";
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

                    str1 = str1 + " AND DL_ID IN(SELECT UI_ID FROM YH WHERE UI_SSBM IN('" + cal + "'))";
                }
                else
                {
                    str1 = str1 + " AND DL_ID IN(SELECT UI_ID FROM YH WHERE UI_SSBM='" + this.Session["deptid"] + "')";
                }
            }

            if (!string.IsNullOrEmpty(rysq.Text))
            {
                str1 = str1 + " AND (DL_ID LIKE '%" + hkdb.GetStr(rysq.Text) + "%' OR UI_DESC LIKE '%" + hkdb.GetStr(rysq.Text) + "%')";
            }

            if (!string.IsNullOrEmpty(ipdz.Text))
            {
                str1 = str1 + " AND DL_IP='" + hkdb.GetStr(ipdz.Text) + "'";
            }

            if (!string.IsNullOrEmpty(dlzt.SelectedValue))
            {
                str1 = str1 + " AND DL_ZT='" + dlzt.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(jrmk.Text))
            {
                str1 = str1 + " AND OPEN_MK='" + hkdb.GetStr(jrmk.Text) + "'";
            }

            if (!string.IsNullOrEmpty(dl_rk.SelectedValue))
            {
                str1 = str1 + " AND dl_rk='" + dl_rk.SelectedValue + "'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM HK_DLRZ A LEFT OUTER JOIN YH B ON (A.DL_ID=B.UI_ID) " + str1 + "");
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,B.UI_DESC,C.MODU_MC FROM HK_DLRZ A LEFT OUTER JOIN YH B ON (A.DL_ID=B.UI_ID) LEFT OUTER JOIN HK_MODU C ON (A.OPEN_MK=C.MODU_ID) " + str1 + " ORDER BY DL_RQ DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            rysq.Text = "";
            dlzt.SelectedValue = "";
            jrmk.Text = "";
            ipdz.Text = "";
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

        //导出
        protected void Exp_Click(object sender, EventArgs e)
        {
            string str1 = " WHERE B.UI_LX='企业' AND DL_RQ BETWEEN '" + hkdb.GetStr(txtSdate.Text) + "' AND '" + hkdb.GetStr(txtEdate.Text) + "'";

            //个人权限
            if (hkdb.StrIx("603091", Session["roleqx"].ToString()))
            {
                str1 = str1 + " AND DL_ID='" + this.Session["userid"] + "'";
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

                    str1 = str1 + " AND DL_ID IN(SELECT UI_ID FROM YH WHERE UI_SSBM IN('" + cal + "'))";
                }
                else
                {
                    str1 = str1 + " AND DL_ID IN(SELECT UI_ID FROM YH WHERE UI_SSBM='" + this.Session["deptid"] + "')";
                }
            }

            if (!string.IsNullOrEmpty(rysq.Text))
            {
                str1 = str1 + " AND (DL_ID LIKE '%" + hkdb.GetStr(rysq.Text) + "%' OR UI_DESC LIKE '%" + hkdb.GetStr(rysq.Text) + "%')";
            }

            if (!string.IsNullOrEmpty(ipdz.Text))
            {
                str1 = str1 + " AND DL_IP='" + hkdb.GetStr(ipdz.Text) + "'";
            }

            if (!string.IsNullOrEmpty(dlzt.SelectedValue))
            {
                str1 = str1 + " AND DL_ZT='" + dlzt.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(jrmk.Text))
            {
                str1 = str1 + " AND OPEN_MK='" + hkdb.GetStr(jrmk.Text) + "'";
            }

            if (!string.IsNullOrEmpty(dl_rk.SelectedValue))
            {
                str1 = str1 + " AND dl_rk='" + dl_rk.SelectedValue + "'";
            }

            DataSet ds = SqlHelper.ExecuteDs("SELECT A.DL_RQ AS '操作日期',A.DL_ID AS '用户编码',B.UI_DESC AS '用户名称',A.DL_IP AS 'IP地址',A.DL_ZT AS '登录状态',A.OPEN_MK AS '模块编码',C.MODU_MC AS '模块名称',A.DL_PORT AS '端口号',A.DL_RK AS '登录入口' FROM HK_DLRZ A LEFT OUTER JOIN YH B ON (A.DL_ID=B.UI_ID) LEFT OUTER JOIN HK_MODU C ON (A.OPEN_MK=C.MODU_ID) " + str1 + " ORDER BY DL_RQ DESC");
            string fileName = "rzcx_mx.xls";
            ExcelHelper.ExportDataSetToExcel(ds, fileName, "登录日志查询");
        }
    }
}
