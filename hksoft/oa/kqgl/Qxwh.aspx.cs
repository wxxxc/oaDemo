using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Qxwh : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            //加载提示
            mydb.PageWait();

            if (!IsPostBack)
            {
                hkdb.PassTo("11712", "11712");

                BindAttr();

                DropDownListBind();

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                GridViewBind();
            }
        }

        public void BindAttr()
        {
            UserName1.Attributes.Add("readonly", "readonly");
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
                Str1 = Str1 + " AND UI_SSBM= '" + ssbm.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + " AND " + query_tj.SelectedItem.Value + " LIKE '%" + hkdb.GetStr(query_content.Text) + "%'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM ZW B RIGHT OUTER JOIN YH A ON (A.UI_ZW=B.ZWID) LEFT OUTER JOIN OA_KQ_QX C ON (A.UI_ID=C.YHID) LEFT OUTER JOIN QY E ON(A.UI_SSGS=E.QY_ID)" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.UI_ID,A.UI_DESC,A.UI_SEX,A.UI_STATUS,A.UI_RZRQ,B.ZWMC,C.*,D.BM_MC,E.QY_QC FROM ZW B RIGHT OUTER JOIN YH A ON (A.UI_ZW=B.ZWID) LEFT OUTER JOIN OA_KQ_QX C ON (A.UI_ID=C.YHID) LEFT OUTER JOIN BM D ON (A.UI_SSBM=D.BM_ID) LEFT OUTER JOIN QY E ON(A.UI_SSGS=E.QY_ID)" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            //每次执行不能超过30天
            DateTime sdate = Convert.ToDateTime(ksrq.Text);
            DateTime edate = Convert.ToDateTime(jsrq.Text);
            TimeSpan span = edate - sdate;
            if (int.Parse(String.Format("{0}", span.TotalDays)) > 100)
            {
                mydb.Alert("为避免给服务器带来过大压力，每次执行日期范围不能超过100天！");
                return;
            }

            //判断当前参照人员是否有考勤信息
            string sql = "SELECT * FROM OA_KQ_WorkDate WHERE YHID='" + hkdb.GetStr(UserID1.Text) + "' AND RQ BETWEEN '" + hkdb.GetStr(ksrq.Text) + "' AND '" + hkdb.GetStr(jsrq.Text) + "'";
            if (bd.CheckRepeat(sql) == "false")
            {
                mydb.Alert("提交失败，当前参照人员在选定日期范围内未检索到工作日设置记录！");
                return;
            }
            
            //1.获取当前选中的人员信息
            string str = "";
            if (yhfw.SelectedValue == "1")
            {
                string cal = "";
                int i = 0;
                for (i = 0; i <= GridView1.Rows.Count - 1; i++)
                {
                    CheckBox cb = (CheckBox)GridView1.Rows[i].Cells[1].FindControl("del");
                    if (cb.Checked == true)
                    {
                        if (string.IsNullOrEmpty(cal))
                        {
                            cal = GridView1.DataKeys[i].Value.ToString();
                        }
                        else
                        {
                            cal = cal + "','" + GridView1.DataKeys[i].Value.ToString();
                        }
                    }
                }

                if (!string.IsNullOrEmpty(cal))
                {
                    str = " WHERE UI_ID IN('" + cal + "')";
                }
                else
                {
                    mydb.Alert("请先选中记录再点击确定！");
                    return;
                }
            }

            //2.获取当前参照人员的考勤信息
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT RQ,YNSB FROM OA_KQ_WorkDate WHERE YHID='" + hkdb.GetStr(UserID1.Text) + "' AND RQ BETWEEN '" + hkdb.GetStr(ksrq.Text) + "' AND '" + hkdb.GetStr(jsrq.Text) + "'");
            while (dr.Read())
            {
                SqlDataReader dr2 = SqlHelper.ExecuteReader("SELECT UI_ID FROM YH" + str);
                while (dr2.Read())
                {
                    SqlDataReader dr3 = SqlHelper.ExecuteReader("SELECT wdID FROM OA_KQ_WorkDate WHERE YHID='" + dr2["UI_ID"].ToString() + "' AND RQ='" + dr["RQ"].ToString() + "'");
                    if (dr3.Read())
                    {
                        int id = Convert.ToInt32(dr3["wdID"].ToString());
                        dr3.Close();
                        //更新
                        //SqlHelper.ExecuteSql("UPDATE OA_KQ_WorkDate SET YNSB='" + dr["YNSB"].ToString() + "' WHERE YHID='" + dr2["UI_ID"].ToString() + "' AND RQ='" + dr["RQ"].ToString() + "'");
                        SqlHelper.ExecuteSql("UPDATE OA_KQ_WorkDate SET YNSB='" + dr["YNSB"].ToString() + "' WHERE wdID=" + id + "");
                    }
                    else
                    {
                        dr3.Close();
                        //新增
                        SqlHelper.ExecuteSql("INSERT INTO OA_KQ_WorkDate(RQ,YNSB,YHID) VALUES('" + dr["RQ"].ToString() + "','" + dr["YNSB"].ToString() + "','" + dr2["UI_ID"].ToString() + "')");
                    }
                }
                dr2.Close();
            }
            dr.Close();

            GridViewBind();

            mydb.Alert("批量更新成功！");
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
    }
}
