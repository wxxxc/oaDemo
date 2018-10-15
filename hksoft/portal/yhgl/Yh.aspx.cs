using haoke365;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hkpro.portal.yhgl
{
    public partial class Yh : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("60305", "60305");

                OperQx();

                DropDownListBind();

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                GridViewBind();
            }
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(AddBtn, "60305a", Session["roleqx"].ToString());
            hkdb.QxValid(ExpBtn, "60305e", Session["roleqx"].ToString());
        }

        //dp绑定 
        public void DropDownListBind()
        {
            //绑定部门
            bd.Bind_DropDownList_bm(ssbm, "", "", "");
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " WHERE UI_LX='企业'";

            if (!string.IsNullOrEmpty(ssbm.SelectedValue))
            {
                //Str1 = Str1 + " AND UI_SSBM= '" + ssbm.SelectedValue + "'";

                //递归部门
                string cal = "";
                SqlDataReader dr = SqlHelper.ExecuteReader("EXEC sp_RECUR_BM '" + ssbm.SelectedValue + "'");
                while (dr.Read())
                {
                    if (string.IsNullOrEmpty(cal))
                    {
                        cal = dr["bm_id"].ToString();
                    }
                    else
                    {
                        cal = cal + "','" + dr["bm_id"].ToString();
                    }
                }
                dr.Close();

                Str1 = Str1 + " and UI_SSBM in('" + cal + "')";
            }

            if (!string.IsNullOrEmpty(query_content.Text))
            {
                if (query_tj.SelectedItem.Value == "a.ui_yddh")
                {
                    Str1 = Str1 + " AND a.ui_yddh LIKE '%" + query_content.Text + "%'";
                }
                else
                {
                    Str1 = Str1 + " AND " + query_tj.SelectedItem.Value + " LIKE '%" + hkdb.GetStr(query_content.Text) + "%'";
                }
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM YH A LEFT OUTER JOIN ZW B ON (A.UI_ZW=B.ZWID) LEFT OUTER JOIN JS C ON (A.UI_ROLE=C.ROLE_ID) LEFT OUTER JOIN QY E ON(A.UI_SSGS=E.QY_ID)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.UI_ID,A.UI_DESC,A.UI_YDDH,A.UI_SEX,A.UI_BGDH,A.UI_STATUS,A.CJSJ,B.ZWMC,C.ROLE_NAME,D.BM_MC,E.QY_QC,(SELECT COUNT(*) FROM YH_JS WHERE UI_ID=A.UI_ID)AS JSSL,(SELECT COUNT(*) FROM YH_BM WHERE UI_ID=A.UI_ID)AS BMSL FROM YH A LEFT OUTER JOIN ZW B ON(A.UI_ZW=B.ZWID) LEFT OUTER JOIN JS C ON (A.UI_ROLE=C.ROLE_ID) LEFT OUTER JOIN BM D ON (A.UI_SSBM=D.BM_ID) LEFT OUTER JOIN QY E ON(A.UI_SSGS=E.QY_ID)" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
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

                string strzt = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "ui_status")).Trim();

                if (strzt == "禁用")
                {
                    e.Row.ForeColor = Color.Red;
                }

                if (strzt == "建档")
                {
                    e.Row.ForeColor = Color.Blue;
                }
            }
        }

        //导出
        protected void Exp_Click(object sender, EventArgs e)
        {
            string Str1 = " WHERE UI_LX='企业'";

            if (!string.IsNullOrEmpty(ssbm.SelectedValue))
            {
                //Str1 = Str1 + " AND UI_SSBM= '" + ssbm.SelectedValue + "'";

                //递归部门
                string cal = "";
                SqlDataReader dr = SqlHelper.ExecuteReader("EXEC sp_RECUR_BM '" + ssbm.SelectedValue + "'");
                while (dr.Read())
                {
                    if (string.IsNullOrEmpty(cal))
                    {
                        cal = dr["bm_id"].ToString();
                    }
                    else
                    {
                        cal = cal + "','" + dr["bm_id"].ToString();
                    }
                }
                dr.Close();

                Str1 = Str1 + " and UI_SSBM in('" + cal + "')";
            }

            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + " AND " + query_tj.SelectedItem.Value + " LIKE '%" + hkdb.GetStr(query_content.Text) + "%' ";
            }

            DataSet ds = SqlHelper.ExecuteDs("SELECT A.UI_ID AS '编码',A.UI_DESC AS '姓名',A.UI_SEX AS '性别',B.ZWMC AS '职位',C.ROLE_NAME AS '角色',D.BM_MC AS '部门',A.UI_YDDH AS '移动电话',A.UI_STATUS AS '状态',A.UI_EDATE AS '帐号到期日',E.QY_QC AS '所属公司',A.CJSJ AS '建档日期' FROM YH A LEFT OUTER JOIN ZW B ON (A.UI_ZW=B.ZWID) LEFT OUTER JOIN JS C ON (A.UI_ROLE=C.ROLE_ID) LEFT OUTER JOIN BM D ON (A.UI_SSBM=D.BM_ID) LEFT OUTER JOIN QY E ON(A.UI_SSGS=E.QY_ID)" + Str1);
            string fileName = "yhcx.xls";
            ExcelHelper.ExportDataSetToExcel(ds, fileName, "用户查询");
        }
    }
}
