using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Transactions;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Kqsmsp : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11717", "11717");

                //短信
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                DropDownListBind();

                //判断是否分管领导或中心领导，如果是则默认选中为“转给考勤管理员”
                SqlDataReader dr0 = SqlHelper.ExecuteReader("SELECT * FROM OA_KQ_QX WHERE YHID='" + this.Session["UserID"] + "' AND (KQSPRY2='是' OR KQSPRY3='是')");
                if (dr0.Read())
                {
                    jsr.SelectedValue = "jdqr";

                    kqry.Visible = true;
                    kqry.Items.Clear();

                    string Str = " WHERE Z.KQGLRY='是'";

                    //考勤管理人员
                    string sql_kqry = "SELECT UI_ID,UI_DESC+'('+B.BM_MC+'-'+C.ZWMC+')' AS UI_DESC FROM OA_KQ_QX Z LEFT OUTER JOIN YH A ON(Z.YHID=A.UI_ID) LEFT OUTER JOIN BM B ON (A.UI_SSBM=B.BM_ID) LEFT OUTER JOIN ZW C ON(A.UI_ZW=C.ZWID) " + Str + " ORDER BY UI_DESC";
                    bd.Bind_DropDownList_NoBlank(kqry, sql_kqry, "UI_ID", "UI_DESC", "", "");
                }
                dr0.Close();

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                GridViewBind();
            }
        }

        public void DropDownListBind()
        {
            string Str = " WHERE (Z.KQSPRY1='是' OR Z.KQSPRY2='是')";
            SqlDataReader dr_sp = SqlHelper.ExecuteReader("SELECT qzcyid FROM hk_QZDA WHERE CJR='" + this.Session["UserID"] + "' AND QZLX='OA考勤说明审批专用群组'");
            if (dr_sp.Read())
            {
                Str += " AND CHARINDEX(UI_ID,'" + dr_sp["qzcyid"].ToString() + "')>0";
            }
            dr_sp.Close();

            //下一步审批人
            string sql_jsr = "SELECT UI_ID,UI_DESC+'('+B.BM_MC+'-'+C.ZWMC+')' AS UI_DESC FROM OA_KQ_QX Z LEFT OUTER JOIN YH A ON(Z.YHID=A.UI_ID) LEFT OUTER JOIN BM B ON (A.UI_SSBM=B.BM_ID) LEFT OUTER JOIN ZW C ON(A.UI_ZW=C.ZWID) " + Str + " ORDER BY UI_DESC";
            bd.Bind_DropDownList(jsr, sql_jsr, "ui_id", "ui_desc", "", "选择下一步审批人员");

            ListItem theItem1 = new ListItem();
            theItem1.Text = "----------------";
            theItem1.Value = "";
            jsr.Items.Add(theItem1);

            ListItem theItem2 = new ListItem();
            theItem2.Text = "转给考勤管理员";
            theItem2.Value = "jdqr";
            jsr.Items.Add(theItem2);
        }

        //刷新 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        public void GridViewBind()
        {
            string Str1 = " WHERE CHARINDEX('" + this.Session["userid"] + "',jsrIDs)>0 AND SMZT='送审中'";

            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + " AND " + query_tj.SelectedItem.Value + " LIKE '%" + hkdb.GetStr(query_content.Text) + "%'";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM OA_KQ_SM01 A" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.* FROM OA_KQ_SM01 A " + Str1 + " ORDER BY SSSJ DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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
            }
        }

        protected void jsr_Changed(object sender, EventArgs e)
        {
            if (jsr.SelectedValue == "jdqr")
            {
                kqry.Visible = true;
                kqry.Items.Clear();

                //ListItem theItem3 = new ListItem();
                //theItem3.Text = "选择考勤管理人员";
                //theItem3.Value = "";
                //kqry.Items.Add(theItem3);

                string Str = " WHERE Z.KQGLRY='是'";
                //SqlDataReader dr_sp = SqlHelper.ExecuteReader("SELECT qzcyid FROM hk_QZDA WHERE CJR='" + this.Session["UserID"] + "' AND QZLX='OA考勤说明审批专用群组'");
                //if (dr_sp.Read())
                //{
                //    Str += " AND CHARINDEX(UI_ID,'" + dr_sp["qzcyid"].ToString() + "')>0";
                //}
                //dr_sp.Close();

                //考勤管理人员
                string sql_kqry = "SELECT UI_ID,UI_DESC+'('+B.BM_MC+'-'+C.ZWMC+')' AS UI_DESC FROM OA_KQ_QX Z LEFT OUTER JOIN YH A ON(Z.YHID=A.UI_ID) LEFT OUTER JOIN BM B ON (A.UI_SSBM=B.BM_ID) LEFT OUTER JOIN ZW C ON(A.UI_ZW=C.ZWID) " + Str + " ORDER BY UI_DESC";
                bd.Bind_DropDownList_NoBlank(kqry, sql_kqry, "UI_ID", "UI_DESC", "", "");
            }
            else
            {
                kqry.Visible = false;
            }
        }

        //审批通过
        protected void Pass_Click(object sender, EventArgs e)
        {
            string strSpzt, strSqzt;
            string srjsrIDs = null;
            string strjsrNames = null;

            if (jsr.SelectedValue == "jdqr")
            {
                strSpzt = "等待确认";   //审批状态
                strSqzt = "已审批";     //查询状态
                srjsrIDs = kqry.SelectedValue;        //下一步接收人ID
                strjsrNames = kqry.SelectedItem.Text; //下一步接收人名称
            }
            else
            {
                strSpzt = "审批通过";
                strSqzt = "送审中";
                srjsrIDs = jsr.SelectedValue;
                strjsrNames = jsr.SelectedItem.Text;
            }

            //获取审批记录
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
                //事务执行
                using (TransactionScope scope = new TransactionScope())
                {
                    SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["haokeConnectionString"].ConnectionString);
                    sqlConn.Open();
                    SqlCommand sqlComm;

                    SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.SID,A.SSSJ FROM OA_KQ_SM01 A WHERE SID IN('" + cal + "')");
                    while (dr.Read())
                    {
                        sqlComm = new SqlCommand("INSERT INTO OA_KQ_SM02(SSSID,JSSJ,SPRID,SPRMC,SPSJ,SPYJ,BS,SPZT) values('" + dr["sid"].ToString() + "','" + dr["sssj"].ToString() + "','" + this.Session["userid"] + "','" + this.Session["username"] + "',getdate(),'" + hkdb.GetStr(spyj.Text) + "','1','" + strSpzt + "')", sqlConn);
                        sqlComm.CommandType = System.Data.CommandType.Text;
                        sqlComm.ExecuteNonQuery();

                        sqlComm = new SqlCommand("UPDATE OA_KQ_SM01 SET SMZT='" + strSqzt + "',jsrIDs='" + srjsrIDs + "',jsrNames='" + strjsrNames + "',SSSJ=GETDATE() WHERE SID='" + dr["sid"].ToString() + "'", sqlConn);
                        sqlComm.CommandType = System.Data.CommandType.Text;
                        sqlComm.ExecuteNonQuery();
                    }
                    dr.Close();

                    sqlConn.Close();
                    scope.Complete();
                }
                Console.ReadLine();

                SendMsg();

                //PassBtn.Enabled = false;
                //BackBtn.Enabled = false;
                //PrnLbl.Visible = true;
                //Image3.Visible = true;
                mydb.Alert_Goto("审批通过成功！", "Kqsmsp.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('请先选中记录再执行审批！');<" + "/script>");
            }
        }

        //消息通知
        public void SendMsg()
        {
            //Msg 
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                if (jsr.SelectedValue == "jdqr")
                {
                    string message = this.Session["username"].ToString() + "批量审批通过了一份考勤说明,请确认!";
                    hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), kqry.SelectedValue, message);
                }
                else
                {
                    string message = this.Session["username"].ToString() + "批量审批通过了一份考勤说明,请继续审批!";
                    hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), jsr.SelectedValue, message);
                }
            }
        }
    }
}
