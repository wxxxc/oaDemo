using System;
using System.Collections;
using System.Data.SqlClient;
using System.Text;
using haoke365;

namespace hkpro.portal.dxgl
{
    public partial class Xdx : System.Web.UI.Page
    {
        BindData bd = new BindData();
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10103", "0");

                if (this.Session["systype"].ToString() == "A")     //主登录页
                {
                    SqlDataReader dr_pms = SqlHelper.ExecuteReader("SELECT xh FROM hk_Init WHERE produID='F'");
                    if (dr_pms.Read())
                    {
                        p_dxlx_pms.Visible = true;
                    }
                    dr_pms.Close();

                    SqlDataReader dr_kms = SqlHelper.ExecuteReader("SELECT xh FROM hk_Init WHERE produID='K'");
                    if (dr_kms.Read())
                    {
                        p_dxlx_kms.Visible = true;
                    }
                    dr_kms.Close();
                }
                else  //子登录页
                {
                    if (this.Session["systype"].ToString() == "F")
                    {
                        p_dxlx_pms.Visible = true;
                    }

                    if (this.Session["systype"].ToString() == "K")
                    {
                        p_dxlx_kms.Visible = true;
                    }
                }

                if (bd.CheckRepeat("SELECT Xh FROM hk_Init WHERE ProduID='F' AND ChildVersion='0'") == "true")
                {
                    imgBtn_zh.OnClientClick = "javascript:openAddressList('../../choose/pms/yddhview_zh.aspx');";
                    imgBtn_yz.OnClientClick = "javascript:openAddressList('../../choose/pms/yddhview_yz.aspx');";
                }
                else
                {
                    imgBtn_zh.OnClientClick = "javascript:openAddressList('../../choose/pms2/yddhview_zh.aspx');";
                    imgBtn_yz.OnClientClick = "javascript:openAddressList('../../choose/pms2/yddhview_yz.aspx');";
                }

                ds.Visible = false;
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
            
            mydb.Alert_Close("短信发送完成！");
        }

        //定时
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

        //短信类型PMS
        protected void dxlx_pms_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (dxlx_pms.SelectedValue)
            {
                case "1":
                    imgBtn_yh.Visible = false;
                    imgBtn_yz.Visible = true;
                    imgBtn_zh.Visible = false;
                    jsr.Text = "";
                    nr.Text = "";
                    break;
                case "2":
                    imgBtn_yh.Visible = false;
                    imgBtn_yz.Visible = false;
                    imgBtn_zh.Visible = true;
                    jsr.Text = "";
                    nr.Text = "";
                    break;
                default:
                    imgBtn_yh.Visible = true;
                    imgBtn_yz.Visible = false;
                    imgBtn_zh.Visible = false;
                    jsr.Text = "";
                    nr.Text = "";
                    break;
            }
        }

        //短信类型KMS
        protected void dxlx_kms_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (dxlx_kms.SelectedValue)
            {
                case "1":
                    imgBtn_yh.Visible = false;
                    imgBtn_ye.Visible = true;
                    jsr.Text = "";
                    nr.Text = "";
                    break;
                default:
                    imgBtn_yh.Visible = true;
                    imgBtn_ye.Visible = false;
                    jsr.Text = "";
                    nr.Text = "";
                    break;
            }
        }
    }
}
