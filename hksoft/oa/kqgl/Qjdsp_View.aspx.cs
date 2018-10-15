using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Transactions;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Qjdsp_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11715", "0");

                //短信
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.* FROM OA_KQ_QJD01 A WHERE QID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' AND CHARINDEX('" + this.Session["userid"] + "',jsrIDs)>0 AND QJZT='送审中'");
                    if (dr.Read())
                    {
                        lblqjlx.Text = dr["qjlx"].ToString();
                        lblgjlb.Text = dr["gjlb"].ToString();
                        lblqjkssj.Text = hkdb.GetDate(dr["qjkssj"].ToString());
                        lblqjkssd.Text = dr["qjkssd"].ToString();
                        lblqjjssj.Text = hkdb.GetDate(dr["qjjssj"].ToString());
                        lblqjjssd.Text = dr["qjjssd"].ToString();
                        lblqjts.Text = dr["qjts"].ToString();
                        qjzt.Text = dr["qjzt"].ToString();
                        lblqjly.Text = dr["qjly"].ToString();
                        lblgztzqk.Text = dr["gztzqk"].ToString();
                        lblsqr.Text = dr["sqrmc"].ToString();
                        sssj.Text = dr["sssj"].ToString();
                        lblspr.Text = dr["jsrNames"].ToString();
                        lblsqbmid.Text = dr["sqbmid"].ToString();
                        lblsqbmmc.Text = dr["sqbmmc"].ToString();
                        lblsqsj.Text = dr["sqsj"].ToString();
                        Number.Text = dr["qjfj"].ToString();
                        dr.Close();

                        DropDownListBind();

                        //考勤审批说明
                        Kqspsm();

                        bd.GetAtt(Number.Text, "o2", "oa/qjd", fujian);

                        GridViewBind();

                        //判断是否中心领导，如果是则默认选中为“转给考勤管理员”
                        SqlDataReader dr0 = SqlHelper.ExecuteReader("SELECT * FROM OA_KQ_QX WHERE YHID='" + this.Session["UserID"] + "' AND KQSPRY3='是'");
                        if (dr0.Read())
                        {
                            jsr.SelectedValue = "jdqr";

                            kqry.Visible = true;
                            kqry.Items.Clear();

                            string Str = " WHERE Z.KQGLRY='是'";

                            //考勤管理人员
                            string sql_kqry = "SELECT UI_ID,UI_DESC+'('+B.BM_MC+'-'+C.ZWMC+')' AS UI_DESC FROM OA_KQ_QX Z LEFT OUTER JOIN YH A ON(Z.YHID=A.UI_ID) LEFT OUTER JOIN BM B ON (A.UI_SSBM=B.BM_ID) LEFT OUTER JOIN ZW C ON(A.UI_ZW=C.ZWID) " + Str + " ORDER BY UI_DESC";
                            bd.Bind_DropDownList_NoBlank(kqry, sql_kqry, "ui_id", "ui_desc", "", "");
                        }
                        dr0.Close();

                        //PrnLbl.Attributes.Add("onclick", "Javascript:popPrn('Xydcx_View_Prn.aspx?xydid=" + xydidstr.Text + "');");
                    }
                    else
                    {
                        dr.Close();
                        mydb.Alert_Close("此记录已审批完成，无需再审！");
                    }
                }
                else
                {
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
            }
        }

        public void DropDownListBind()
        {
            string Str = " WHERE (Z.KQSPRY1='是' OR Z.KQSPRY2='是')";
            SqlDataReader dr_sp = SqlHelper.ExecuteReader("SELECT qzcyid FROM hk_QZDA WHERE CJR='" + this.Session["UserID"] + "' AND QZLX='OA考勤请假审批专用群组'");
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
                //SqlDataReader dr_sp = SqlHelper.ExecuteReader("SELECT qzcyid FROM hk_QZDA WHERE CJR='" + this.Session["UserID"] + "' AND QZLX='OA考勤请假审批专用群组'");
                //if (dr_sp.Read())
                //{
                //    Str += " AND CHARINDEX(UI_ID,'" + dr_sp["qzcyid"].ToString() + "')>0";
                //}
                //dr_sp.Close();

                //考勤管理人员
                string sql_kqry = "SELECT UI_ID,UI_DESC+'('+B.BM_MC+'-'+C.ZWMC+')' AS UI_DESC FROM OA_KQ_QX Z LEFT OUTER JOIN YH A ON(Z.YHID=A.UI_ID) LEFT OUTER JOIN BM B ON (A.UI_SSBM=B.BM_ID) LEFT OUTER JOIN ZW C ON(A.UI_ZW=C.ZWID) " + Str + " ORDER BY UI_DESC";
                bd.Bind_DropDownList_NoBlank(kqry, sql_kqry, "ui_id", "ui_desc", "", "");
            }
            else
            {
                kqry.Visible = false;
            }
        }

        public void GridViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM OA_KQ_QJD02 WHERE SSQID='" + hkdb.GetStr(Request.QueryString["id"]) + "' ORDER BY SPSJ DESC");
            GridView1.DataSource = ds;
            GridView1.DataBind();
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

            //事务执行
            using (TransactionScope scope = new TransactionScope())
            {
                SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["haokeConnectionString"].ConnectionString);
                sqlConn.Open();
                SqlCommand sqlComm;

                sqlComm = new SqlCommand("INSERT INTO OA_KQ_QJD02(SSQID,JSSJ,SPRID,SPRMC,SPSJ,SPYJ,BS,SPZT) values('" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "','" + hkdb.GetStr(sssj.Text) + "','" + this.Session["userid"] + "','" + this.Session["username"] + "',getdate(),'" + hkdb.GetStr(spyj.Text) + "','1','" + strSpzt + "')", sqlConn);
                sqlComm.CommandType = System.Data.CommandType.Text;
                sqlComm.ExecuteNonQuery();

                sqlComm = new SqlCommand("UPDATE OA_KQ_QJD01 SET QJZT='" + strSqzt + "',jsrIDs='" + srjsrIDs + "',jsrNames='" + strjsrNames + "',SSSJ=GETDATE() WHERE QID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'", sqlConn);
                sqlComm.CommandType = System.Data.CommandType.Text;
                sqlComm.ExecuteNonQuery();

                sqlConn.Close();
                scope.Complete();
            }
            Console.ReadLine();

            SendMsg();

            //PassBtn.Enabled = false;
            //BackBtn.Enabled = false;
            //PrnLbl.Visible = true;
            //Image3.Visible = true;
            mydb.Alert_Refresh_Close("审批通过成功！","Qjdsp.aspx");
        }

        //审批退回
        protected void Back_Click(object sender, EventArgs e)
        {
            using (TransactionScope scope = new TransactionScope())
            {
                SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["haokeConnectionString"].ConnectionString);
                sqlConn.Open();
                SqlCommand sqlComm;

                int n = Convert.ToInt32(SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM OA_KQ_QJD02 WHERE SSQID='" + Request.QueryString["id"].ToString() + "' AND BS='1'"));
                //退给录入人
                if (n < 1)
                {
                    sqlComm = new SqlCommand("UPDATE OA_KQ_QJD01 SET QJZT='已退回' WHERE QID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'", sqlConn);
                    sqlComm.CommandType = System.Data.CommandType.Text;
                    sqlComm.ExecuteNonQuery();
                }
                else
                {
                    string spridStr = null;
                    string sprmcStr = null;
                    SqlDataReader dr = SqlHelper.ExecuteReader("SELECT TOP 1 SPID,SPRID,SPRMC FROM OA_KQ_QJD02 WHERE SSQID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' AND BS='1' ORDER BY SPSJ DESC");
                    if (dr.Read())
                    {
                        spridStr = dr["sprid"].ToString();
                        sprmcStr = dr["sprmc"].ToString();
                        sqlComm = new SqlCommand("UPDATE OA_KQ_QJD02 SET BS='0' WHERE SPID='" + dr["spid"] + "'", sqlConn);
                        sqlComm.CommandType = System.Data.CommandType.Text;
                        sqlComm.ExecuteNonQuery();
                        dr.Close();
                    }
                    else
                    {
                        dr.Close();
                        mydb.Alert("操作失败,审批历史记录有误！");
                    }

                    sqlComm = new SqlCommand("UPDATE OA_KQ_QJD01 SET QJZT='送审中',jsrIDs='" + spridStr + "',jsrNames='" + sprmcStr + "' WHERE QID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'", sqlConn);
                    sqlComm.CommandType = System.Data.CommandType.Text;
                    sqlComm.ExecuteNonQuery();
                }

                sqlComm = new SqlCommand("INSERT INTO OA_KQ_QJD02(SSQID,JSSJ,SPRID,SPRMC,SPSJ,SPYJ,BS,SPZT) VALUES('" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "','" + hkdb.GetStr(sssj.Text) + "','" + this.Session["userid"] + "','" + this.Session["username"] + "',GETDATE(),'" + hkdb.GetStr(spyj.Text) + "','0','审批退回')", sqlConn);
                sqlComm.CommandType = System.Data.CommandType.Text;
                sqlComm.ExecuteNonQuery();

                sqlConn.Close();
                scope.Complete();
            }
            Console.ReadLine();

            //PassBtn.Enabled = false;
            //BackBtn.Enabled = false;
            //PrnLbl.Visible = true;
            //Image3.Visible = true;

            mydb.Alert_Refresh_Close("审批退回完成！","Qjdsp.aspx");
        }

        //消息通知
        public void SendMsg()
        {
            //Msg 
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                if (jsr.SelectedValue == "jdqr")
                {
                    string message = this.Session["username"].ToString() + "审批通过了一份请假单,请确认!";
                    hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), kqry.SelectedValue, message);
                }
                else
                {
                    string message = this.Session["username"].ToString() + "审批通过了一份请假单,请继续审批!";
                    hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), jsr.SelectedValue, message);
                }
            }
        }

        //gv行处理
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";

                string spzt = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "spzt")).Trim();

                if (spzt == "审批退回")
                {
                    e.Row.ForeColor = Color.Red;
                }
            }
        }

        //考勤审批说明
        protected void Kqspsm()
        {
            SqlDataReader dr0 = SqlHelper.ExecuteReader("SELECT * FROM OA_KQ_QX WHERE YHID='" + this.Session["UserID"] + "'");
            if (dr0.Read())
            {
                if (dr0["Kqspry2"].ToString() == "是")
                {
                    SqlDataReader dr = SqlHelper.ExecuteReader("SELECT SMID FROM OA_KQ_SPSM WHERE SMLX='请假单' AND SYRY='考勤审批分管领导'");
                    if (dr.Read())
                    {
                        lcsm.Visible = true;
                        lcsm.Attributes.Add("onclick", "Javascript:popPrn('Kqspsm_Show.aspx?id=" + dr["SMID"].ToString() + "');");
                    }
                    dr.Close();
                }
                else
                {
                    if (dr0["Kqspry1"].ToString() == "是")
                    {
                        SqlDataReader dr = SqlHelper.ExecuteReader("SELECT SMID FROM OA_KQ_SPSM WHERE SMLX='请假单' AND SYRY='部门考勤审批人员'");
                        if (dr.Read())
                        {
                            lcsm.Visible = true;
                            lcsm.Attributes.Add("onclick", "Javascript:popPrn('Kqspsm_Show.aspx?id=" + dr["SMID"].ToString() + "');");
                        }
                        dr.Close();
                    }
                }
            }
            dr0.Close();
        }
    }
}
