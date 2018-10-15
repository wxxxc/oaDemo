using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.rcgl
{
    public partial class Wdjsb_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        private int scheid = 0;
        private static string reurl = "";
        private static DateTime date = new DateTime();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            reurl = Request.QueryString["reurl"];
            if ((Request.QueryString["day"] != null))
            {
                date = DateTime.Parse(Request.QueryString["day"]);
            }

            if ((Request.QueryString["id"] != null))
            {
                scheid = Int32.Parse(Request.QueryString["id"]);
            }

            if (!IsPostBack)
            {
                hkdb.PassTo("10113,1005", "0");

                BindAttr();

                //短信
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                if ((Request.QueryString["id"] != null))
                {
                    scheid = Int32.Parse(Request.QueryString["id"]);
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HK_JSB WHERE SchID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        zt.Text = datar["Subject"].ToString();
                        lx.SelectedValue = datar["SchType"].ToString();
                        dd.Text = datar["Place"].ToString();
                        nr.Text = datar["Content"].ToString();
                        srq.Text = string.Format("{0:d}", datar["fdate"]);
                        erq.Text = string.Format("{0:d}", datar["tdate"]);
                        sxs.SelectedValue = string.Format("{0:HH:}", datar["fdate"]);
                        exs.SelectedValue = string.Format("{0:HH:}", datar["tdate"]);
                        sfz.SelectedValue = string.Format("{0:mm:ss}", datar["fdate"]);
                        efz.SelectedValue = string.Format("{0:mm:ss}", datar["tdate"]);

                        //提醒 
                        if ((bool)datar["RemindFlag"] == true)
                        {
                            tx.Checked = true;
                            txts.Text = datar["RemindDay"].ToString();
                        }

                        //私人性质 
                        if ((bool)datar["PrivFlag"] == true)
                        {
                            srxz.Checked = true;
                        }

                        //重复 
                        if ((bool)datar["RepeatFlag"] == true)
                        {
                            cf.Checked = true;
                            cfzq.SelectedValue = datar["RequenCate"].ToString();
                            jzrq.Text = string.Format("{0:d}", datar["UpToDate"]);
                        }

                        //预约人员 
                        UserID.Text = datar["yyry"].ToString();
                        if (!string.IsNullOrEmpty(UserID.Text))
                        {
                            UserName.Text = Convert.ToString(SqlHelper.ExecuteScalar("EXEC sp_IdToName '" + hkdb.GetStr(UserID.Text) + "','1'"));
                        }

                        cjrq.Text = string.Format("{0:d}", datar["Cdate"]);
                        datar.Close();
                    }

                    DelBtn.Visible = true;
                }
                else
                {
                    srq.Text = date.ToString("d");
                    erq.Text = date.ToString("d");
                }

                //Init 
                txts.Enabled = tx.Checked;
                jzrq.Enabled = cf.Checked;
                cfzq.Enabled = cf.Checked;
                cjr.Text = this.Session["username"].ToString();
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;

            int srxzStr = hkdb.GetValueChk_Int(srxz.Checked);
            int cfStr = hkdb.GetValueChk_Int(cf.Checked);
            int txStr = hkdb.GetValueChk_Int(tx.Checked);
            string sdateStr = null;
            string edateStr = null;
            sdateStr = hkdb.GetStr(srq.Text) + " " + sxs.SelectedValue + sfz.SelectedValue;
            edateStr = hkdb.GetStr(erq.Text) + " " + exs.SelectedValue + efz.SelectedValue;

            if (Convert.ToDateTime(edateStr) < Convert.ToDateTime(sdateStr))
            {
                mydb.Alert("开始时间必须小于结束时间！");
                return;
            }

            if (scheid == 0)
            {
                SqlHelper.ExecuteSql("INSERT INTO HK_JSB (EMPID,SUBJECT,SCHTYPE,PLACE,CONTENT,PRIVFLAG,REPEATFLAG,REQUENCATE,UPTODATE,REMINDFLAG,REMINDDAY,FDATE,TDATE,CDATE,YYRY) VALUES('" + this.Session["userid"] + "','" + hkdb.GetStr(zt.Text) + "','" + lx.SelectedValue + "','" + hkdb.GetStr(dd.Text) + "','" + hkdb.GetStr(nr.Text) + "'," + srxzStr + "," + cfStr + ",'" + cfzq.SelectedValue + "','" + hkdb.GetStr(jzrq.Text) + "'," + txStr + ",'" + hkdb.GetStr(txts.Text) + "','" + hkdb.GetStr(sdateStr) + "','" + hkdb.GetStr(edateStr) + "',GETDATE(),'" + hkdb.GetStr(UserID.Text).TrimEnd(',') + "')");
            }
            else
            {
                SqlHelper.ExecuteSql("UPDATE HK_JSB SET Subject='" + hkdb.GetStr(zt.Text) + "',SchType='" + lx.SelectedValue + "',Place='" + hkdb.GetStr(dd.Text) + "',Content='" + hkdb.GetStr(nr.Text) + "',PrivFlag=" + srxzStr + ",RepeatFlag=" + cfStr + ",RequenCate='" + cfzq.SelectedValue + "',UpToDate='" + hkdb.GetStr(jzrq.Text) + "',RemindFlag=" + txStr + ",RemindDay='" + hkdb.GetStr(txts.Text) + "',FDate='" + hkdb.GetStr(sdateStr) + "',TDate='" + hkdb.GetStr(edateStr) + "',yyry='" + hkdb.GetStr(UserID.Text).TrimEnd(',') + "' WHERE SchID=" + scheid + "");
            }

            //Msg 
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                string message = this.Session["username"].ToString() + "就[" + hkdb.GetStr(zt.Text) + "]事情在" + sdateStr + "至" + edateStr + "向您预约时间!";
                hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), UserID.Text, message);
            }

            //判断btn 
            if (s == "SaveAddBtn")
            {
                zt.Text = "";
                lx.SelectedValue = "";
                dd.Text = "";
                sxs.SelectedValue = "";
                sfz.SelectedValue = "";
                exs.SelectedValue = "";
                efz.SelectedValue = "";
                txts.Text = "";
                tx.Checked = false;
                nr.Text = "";
                srxz.Checked = false;
                cfzq.SelectedValue = "0";
                jzrq.Text = "";
                cf.Checked = false;
                UserName.Text = "";
                UserID.Text = "";
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Wdjsb.aspx");
            }
            else
            {
                Server.Transfer((reurl + "?i=2&date=" + date));
            }
        }

        //清空 
        protected void Clear_Click(object sender, EventArgs e)
        {
            zt.Text = "";
            lx.SelectedValue = "";
            dd.Text = "";
            sxs.SelectedValue = "";
            sfz.SelectedValue = "";
            exs.SelectedValue = "";
            efz.SelectedValue = "";
            txts.Text = "";
            tx.Checked = false;
            nr.Text = "";
            srxz.Checked = false;
            cfzq.SelectedValue = "0";
            jzrq.Text = "";
            cf.Checked = false;
            UserName.Text = "";
            UserID.Text = "";
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("DELETE FROM HK_JSB WHERE SCHID=" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "");
            Server.Transfer((reurl + "?i=2&date=" + date));
        }

        //返回 
        protected void Back_Click(object sender, EventArgs e)
        {
            Server.Transfer((reurl + "?i=2&date=" + date));
        }

        //重复 
        protected void cf_CheckedChanged(object sender, System.EventArgs e)
        {
            cfzq.Enabled = cf.Checked;
            jzrq.Enabled = cf.Checked;
        }

        //提醒
        protected void tx_CheckedChanged(object sender, System.EventArgs e)
        {
            txts.Enabled = tx.Checked;
        }
    }
}
