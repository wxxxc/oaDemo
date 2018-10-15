using System;
using System.Collections;
using System.Data.SqlClient;
using System.Text;
using haoke365;

namespace hkpro.portal.dxgl
{
    public partial class Mini_Xdx_B : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("40103", "40103");

                ds.Visible = false;

                switch (Request.QueryString["lx"])
                {
                    case "hy":
                        //会员调用 
                        string str1 = "";
                        if (!string.IsNullOrEmpty(Request.QueryString["tj"]))
                        {
                            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT QTJ FROM VI_Query WHERE QID=" + hkdb.GetStr(Request.QueryString["tj"].ToString()));
                            if (dr.Read())
                            {
                                str1 = str1 + dr["qtj"].ToString();
                            }
                            dr.Close();
                        }

                        SqlDataReader datar = SqlHelper.ExecuteReader("SELECT TOP 1000 YDDH FROM VI_HYDA A LEFT OUTER JOIN HK_ZDYLX B ON(A.HYLX=B.ID) WHERE YDDH<>'' AND YNDX='是' " + str1);
                        while (datar.Read())
                        {
                            if (string.IsNullOrEmpty(jsr.Text))
                            {
                                jsr.Text = datar["yddh"].ToString();
                            }
                            else
                            {
                                jsr.Text = jsr.Text + "," + datar["yddh"].ToString();
                            }
                        }

                        datar.Close();
                        break;
                    case "si":
                        //单独的手机号 
                        if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                        {
                            jsr.Text =Request.QueryString["id"].ToString();
                        }

                        break;
                    case "sr":
                        //会员生日
                        if (!string.IsNullOrEmpty(Request.QueryString["tj"]))
                        {
                            SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT YDDH FROM VI_HYDA WHERE YDDH<>'' AND YNDX='是' AND DATEADD(YEAR,YEAR(GETDATE())-YEAR(CSRQ),CSRQ) BETWEEN CONVERT(VARCHAR(10),GETDATE(),120) AND CONVERT(VARCHAR(10),GETDATE()+" + hkdb.GetStr(Request.QueryString["tj"].ToString()) + ",120)");
                            while (datar2.Read())
                            {
                                if (string.IsNullOrEmpty(jsr.Text))
                                {
                                    jsr.Text = datar2["yddh"].ToString();
                                }
                                else
                                {
                                    jsr.Text = jsr.Text + "," + datar2["yddh"].ToString();
                                }
                            }
                            datar2.Close();

                            //短讯标题 
                            nr.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT QY_JC FROM QY WHERE QY_ID='001'")) + "全体员工预祝您生日快乐，万事如意！";
                        }

                        break;
                }
            }
        }

        //发送
        protected void Send_Click(object sender, EventArgs e)
        {
            //定时发送
            int dsfsStr = 0;
            DateTime dsfssj = default(DateTime);
            if (dsfs.Checked == true)
            {
                dsfsStr = 1;
                dsfssj = Convert.ToDateTime(txtSdate.Text + " " + xs.SelectedValue + fz.SelectedValue + "00");
            }
            else
            {
                dsfsStr = 0;
                dsfssj = DateTime.Now;
            }

            //短信内容
            string upstr = nr.Text.Replace("'", "''");

            //分割号码
            ArrayList arr = new ArrayList();
            string[] mystr = hkdb.GetStr(jsr.Text).Split(',');
            for (int s = 0; s < mystr.Length; s++)
            {
                int length = Encoding.Default.GetBytes(mystr[s]).Length;
                if (length == 11)
                {
                    //正常发送
                    SqlHelper.ExecuteSql("INSERT INTO TSMSSENDLOG(SSENDER,DBEGINTIME,NTIMINGTAG,DTIMINGTIME,SEXNO,SSENDNO,SSMSMESSAGE,SRECEIVE) VALUES('" + this.Session["userid"] + "',getdate(),'" + dsfsStr + "','" + dsfssj + "','','" + mystr[s] + "','" + upstr + "','群发短信')");
                }
                else
                {
                    //失败发送
                    SqlHelper.ExecuteSql("INSERT INTO TSMSSENDLOG(SSENDER,DBEGINTIME,NTIMINGTAG,DTIMINGTIME,SEXNO,SSENDNO,SSMSMESSAGE,SRECEIVE,nIsSend) VALUES('" + this.Session["userid"] + "',getdate(),'" + dsfsStr + "','" + dsfssj + "','','" + mystr[s] + "','" + upstr + "','群发短信','2')");
                }
            }
            
            mydb.Alert("短信发送完成！");
        }

        //复选框
        protected void Dsfs_Click(object sender, EventArgs e)
        {
            if (dsfs.Checked == true)
            {
                ds.Visible = true;
                txtSdate.Text = DateTime.Now.AddDays(0).ToString("yyyy-MM-dd");
            }
            else
            {
                ds.Visible = false;
            }
        }
    }
}
