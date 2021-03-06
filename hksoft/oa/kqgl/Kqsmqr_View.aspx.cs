﻿using System;
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
    public partial class Kqsmqr_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11718", "0");

                //短信
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.* FROM OA_KQ_SM01 A WHERE SID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' AND CHARINDEX('" + this.Session["userid"] + "',jsrIDs)>0 AND SMZT='已审批'");
                    if (dr.Read())
                    {
                        lblqdsj.Text = hkdb.GetDate(dr["qdsj"].ToString());
                        ynqd1.Checked = hkdb.GetValueChk_Checked(dr["ynqd1"].ToString());
                        ynqt1.Checked = hkdb.GetValueChk_Checked(dr["ynqt1"].ToString());
                        ynqd2.Checked = hkdb.GetValueChk_Checked(dr["ynqd2"].ToString());
                        ynqt2.Checked = hkdb.GetValueChk_Checked(dr["ynqt2"].ToString());
                        ynqd3.Checked = hkdb.GetValueChk_Checked(dr["ynqd3"].ToString());
                        ynqt3.Checked = hkdb.GetValueChk_Checked(dr["ynqt3"].ToString());
                        lblkqqksm.Text = dr["kqqksm"].ToString();
                        lblsqr.Text = dr["sqrmc"].ToString();
                        sssj.Text = dr["sssj"].ToString();
                        lblspr.Text = dr["jsrNames"].ToString();
                        sqrid.Text = dr["sqrid"].ToString();
                        lblsqbmmc.Text = dr["sqbmmc"].ToString();
                        lblsqsj.Text = dr["sqsj"].ToString();
                        Number.Text = dr["smfj"].ToString();
                        lblsscs.Text = dr["sscs"].ToString();
                        dr.Close();

                        bd.GetAtt(Number.Text, "o3", "oa/kqsm", fujian);

                        GridViewBind();
                    }
                    else
                    {
                        dr.Close();
                        mydb.Alert_Close("该记录已确认完成，无需重复确认！");
                    }
                }
                else
                {
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
            }
        }

        public void GridViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM OA_KQ_SM02 WHERE SSSID='" + hkdb.GetStr(Request.QueryString["id"]) + "' ORDER BY SPSJ DESC");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //审批通过
        protected void Pass_Click(object sender, EventArgs e)
        {
            //事务执行
            using (TransactionScope scope = new TransactionScope())
            {
                SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["haokeConnectionString"].ConnectionString);
                sqlConn.Open();
                SqlCommand sqlComm;

                sqlComm = new SqlCommand("INSERT INTO OA_KQ_SM02(SSSID,JSSJ,SPRID,SPRMC,SPSJ,SPYJ,BS,SPZT) VALUES('" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "','" + hkdb.GetStr(sssj.Text) + "','" + this.Session["userid"] + "','" + this.Session["username"] + "',getdate(),'" + hkdb.GetStr(spyj.Text) + "','1','确认完成')", sqlConn);
                sqlComm.CommandType = System.Data.CommandType.Text;
                sqlComm.ExecuteNonQuery();

                sqlComm = new SqlCommand("UPDATE OA_KQ_SM01 SET SMZT='已确认',JSRIDS='结束',JSRNAMES='结束',SSSJ=GETDATE() WHERE SID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'", sqlConn);
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
            mydb.Alert_Refresh_Close("审批通过成功！","Kqsmqr.aspx");
        }

        //审批退回
        protected void Back_Click(object sender, EventArgs e)
        {
            using (TransactionScope scope = new TransactionScope())
            {
                SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["haokeConnectionString"].ConnectionString);
                sqlConn.Open();
                SqlCommand sqlComm;

                int n = Convert.ToInt32(SqlHelper.ExecuteScalar("SELECT COUNT(*)AS NUMS FROM OA_KQ_SM02 WHERE SSSID='" + Request.QueryString["id"].ToString() + "' AND BS='1'"));
                //退给录入人
                if (n < 1)
                {
                    sqlComm = new SqlCommand("UPDATE OA_KQ_SM01 SET SMZT='已退回' WHERE SID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'", sqlConn);
                    sqlComm.CommandType = System.Data.CommandType.Text;
                    sqlComm.ExecuteNonQuery();
                }
                else
                {
                    string spridStr = null;
                    string sprmcStr = null;
                    SqlDataReader dr = SqlHelper.ExecuteReader("SELECT TOP 1 SPID,SPRID,SPRMC FROM OA_KQ_SM02 WHERE SSSID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' AND BS='1' ORDER BY SPSJ DESC");
                    if (dr.Read())
                    {
                        spridStr = dr["sprid"].ToString();
                        sprmcStr = dr["sprmc"].ToString();
                        sqlComm = new SqlCommand("UPDATE OA_KQ_SM02 SET BS='0' WHERE SPID='" + dr["spid"] + "'", sqlConn);
                        sqlComm.CommandType = System.Data.CommandType.Text;
                        sqlComm.ExecuteNonQuery();
                        dr.Close();
                    }
                    else
                    {
                        dr.Close();
                        mydb.Alert("操作失败,审批历史记录有误！");
                    }

                    sqlComm = new SqlCommand("UPDATE OA_KQ_SM01 SET SMZT='送审中',jsrIDs='" + spridStr + "',jsrNames='" + sprmcStr + "' WHERE SID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'", sqlConn);
                    sqlComm.CommandType = System.Data.CommandType.Text;
                    sqlComm.ExecuteNonQuery();
                }

                sqlComm = new SqlCommand("INSERT INTO OA_KQ_SM02(SSSID,JSSJ,SPRID,SPRMC,SPSJ,SPYJ,BS,SPZT) VALUES('" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "','" + hkdb.GetStr(sssj.Text) + "','" + this.Session["userid"] + "','" + this.Session["username"] + "',getdate(),'" + hkdb.GetStr(spyj.Text) + "','0','审批退回')", sqlConn);
                sqlComm.CommandType = System.Data.CommandType.Text;
                sqlComm.ExecuteNonQuery();

                sqlConn.Close();
                scope.Complete();
            }
            Console.ReadLine();

            mydb.Alert_Refresh_Close("确认退回完成！","Kqsmqr.aspx");
        }

        //消息通知
        public void SendMsg()
        {
            //Msg 
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                string message = this.Session["username"].ToString() + "已经最终确认通过了您的考勤申请!";
                hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), sqrid.Text, message);
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
    }
}
