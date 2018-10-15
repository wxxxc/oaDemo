using System;
using System.Data.SqlClient;
using haoke365;
using InfoSoftGlobal;

namespace hkpro.portal.grbg
{
    public partial class MyReport : System.Web.UI.Page
    {
        BindData bd = new BindData();
        mydb hkdb = new mydb();

        public string sdate, edate, strColor;
        protected void page_load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            sdate = string.Format("{0:yyyy}", DateTime.Now) + "-01-01";
            edate = string.Format("{0:yyyy-MM-dd HH:mm:ss}", DateTime.Now);

            strColor = "AFD8F8,F6BD0F,8BBA00,FF8E46,008E8E,D64646,8E468E,588526,B3AA00,008ED6,9D080D,A186BE";

            if (!IsPostBack)
            {
                hkdb.PassTo("10123", "10123");

                //物业
                if (bd.CheckRepeat("SELECT Xh FROM hk_Init WHERE ProduID='F' AND ChildVersion='0'") == "true")
                {
                    lblpms.Text = "0";
                }
                else
                {
                    lblpms.Text = "1";
                }

                //资产
                if (bd.CheckRepeat("SELECT Xh FROM hk_Init WHERE ProduID='E' AND ChildVersion='0'") == "true")
                {
                    lbleam.Text = "0";
                }
                else
                {
                    lbleam.Text = "1";
                }

                GridViewBind();
            }
        }

        public void GridViewBind()
        {
            SqlDataReader datarTB = SqlHelper.ExecuteReader("SELECT A.*,B.NAME,B.ID AS BID,B.PATH FROM HK_MYDASH A LEFT OUTER JOIN HK_DASHBOARD B ON (A.SSDBID=B.ID) WHERE USERNAME='" + this.Session["userid"] + "' ORDER BY ORDERID ASC");
            while (datarTB.Read())
            {
                switch (datarTB["bid"].ToString())
                {
                    case "1":
                        title1.Text = datarTB["NAME"].ToString();
                        lbl1.Text = datarTB["TOPNUM"].ToString();
                        hl1.NavigateUrl = datarTB["PATH"].ToString();
                        panel1.Visible = true;
                        FCLiteral1.Text = CreateChart1();
                        break;
                    case "2":
                        title2.Text = datarTB["NAME"].ToString();
                        lbl2.Text = datarTB["TOPNUM"].ToString();

                        if (lbleam.Text == "0")
                        {
                            hl2.NavigateUrl = "../../eam/" + datarTB["PATH"].ToString();
                        }
                        else
                        {
                            hl2.NavigateUrl = "../../eam2/" + datarTB["PATH"].ToString();
                        }

                        panel2.Visible = true;
                        FCLiteral2.Text = CreateChart2();
                        break;
                    case "3":
                        title3.Text = datarTB["name"].ToString();
                        lbl3.Text = datarTB["topnum"].ToString();
                        hl3.NavigateUrl = datarTB["path"].ToString();
                        panel3.Visible = true;
                        FCLiteral3.Text = CreateChart3();
                        break;
                    case "4":
                        title4.Text = datarTB["name"].ToString();
                        lbl4.Text = datarTB["topnum"].ToString();
                        hl4.NavigateUrl = datarTB["path"].ToString();
                        panel4.Visible = true;
                        FCLiteral4.Text = CreateChart4();
                        break;
                    case "5":
                        title5.Text = datarTB["name"].ToString();
                        lbl5.Text = datarTB["topnum"].ToString();

                        if (lblpms.Text == "0")
                        {
                            hl5.NavigateUrl = "../../pms/" + datarTB["path"].ToString();
                        }
                        else
                        {
                            hl5.NavigateUrl = "../../pms2/" + datarTB["path"].ToString();
                        }

                        panel5.Visible = true;
                        FCLiteral5.Text = CreateChart5();
                        break;
                    default:
                        break;
                }
            }
            datarTB.Close();
        }

        //1.图形生成
        public string CreateChart1()
        {
            int i = 0;
            string strXML = null;
            strXML = "<graph decimalPrecision='0' formatNumberScale='0' showNames='1' baseFontSize='12' showValues='0' baseFontColor='333333' useRoundEdges='1' showAlternateHGridColor='1' rotateNames='1'>";
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM (SELECT TOP " + lbl1.Text + " MODU_MC,COUNT(*)AS FWCS FROM HK_DLRZ A LEFT OUTER JOIN HK_MODU B ON (A.OPEN_MK=B.MODU_ID) WHERE DL_ZT IS NULL AND DL_ID='" + this.Session["userid"] + "' AND DL_RQ BETWEEN '" + sdate + "' AND '" + edate + "' GROUP BY MODU_MC)Z ORDER BY FWCS DESC");
            while (dr.Read())
            {
                strXML = strXML + "<set name='" + dr["modu_mc"].ToString() + "' value='" + dr["fwcs"].ToString() + "' color='" + strColor.Split(',')[i] + "' />";
                i = i + 1;
            }
            dr.Close();
            strXML = strXML + "</graph>";
            return FusionCharts.RenderChart("../../Charts/" + ChangeChart1.SelectedValue + "", "", strXML, "MyReport1", "500", "250", false, false);
        }

        protected void ChangeChart1_SelectedIndexChanged(object sender, EventArgs e)
        {
            FCLiteral1.Text = CreateChart1();
        }

        //2.图形生成
        public string CreateChart2()
        {
            int i = 0;
            string strXML = null;
            strXML = "<graph decimalPrecision='0' formatNumberScale='0' showNames='1' baseFontSize='12' showValues='0' baseFontColor='333333' useRoundEdges='1' showAlternateHGridColor='1' rotateNames='1'>";
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT TOP 10 D.FL_MC,SUM(A.KCJE)AS KCJE FROM AS_KC A LEFT OUTER JOIN AS_WP C ON (A.SSWPID=C.WPID) LEFT OUTER JOIN  AS_WPFL D ON (C.SSFL=D.FL_ID) WHERE YN_GDZC='否' GROUP BY FL_MC");
            while (dr.Read())
            {
                strXML = strXML + "<set name='" + dr["fl_mc"].ToString() + "' value='" + dr["kcje"].ToString() + "' color='" + strColor.Split(',')[i] + "' />";
                i = i + 1;
            }
            dr.Close();
            strXML = strXML + "</graph>";
            return FusionCharts.RenderChart("../../Charts/" + ChangeChart2.SelectedValue + "", "", strXML, "MyReport2", "500", "250", false, false);
        }

        protected void ChangeChart2_SelectedIndexChanged(object sender, EventArgs e)
        {
            FCLiteral2.Text = CreateChart2();
        }

        //3.图形生成
        public string CreateChart3()
        {
            int i = 0;
            string strXML = null;
            strXML = "<graph decimalPrecision='0' formatNumberScale='0' showNames='1' baseFontSize='12' showValues='0' baseFontColor='333333' useRoundEdges='1' showAlternateHGridColor='1' rotateNames='1'>";
            //SqlDataReader dr = SqlHelper.ExecuteReader("SELECT TOP 10 CS_MC,SUM(RXS_XSJE)AS RXS_XSJE FROM SCRXS A LEFT OUTER JOIN CS B ON (A.RXS_GYSID=B.CS_ID)WHERE RXS_DATE BETWEEN '" + sdate + "' AND '" + edate + "' GROUP BY CS_MC");
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT TOP 10 CS_MC,SUM(RXS_XSJE)AS RXS_XSJE FROM SCRXS A LEFT OUTER JOIN CS B ON (A.RXS_GYSID=B.CS_ID)WHERE RXS_DATE BETWEEN '2001-1-1' AND '" + edate + "' GROUP BY CS_MC");
            while (dr.Read())
            {
                strXML = strXML + "<set name='" + dr["cs_mc"].ToString() + "' value='" + dr["rxs_xsje"].ToString() + "' color='" + strColor.Split(',')[i] + "' />";
                i = i + 1;
            }
            dr.Close();
            strXML = strXML + "</graph>";
            return FusionCharts.RenderChart("../../Charts/" + ChangeChart3.SelectedValue + "", "", strXML, "MyReport3", "500", "250", false, false);
        }

        protected void ChangeChart3_SelectedIndexChanged(object sender, EventArgs e)
        {
            FCLiteral3.Text = CreateChart3();
        }

        //4.图形生成
        public string CreateChart4()
        {
            int i = 0;
            string strXML = null;
            strXML = "<graph decimalPrecision='0' formatNumberScale='0' showNames='1' baseFontSize='12' showValues='0' baseFontColor='333333' useRoundEdges='1' showAlternateHGridColor='1' rotateNames='1'>";
            //SqlDataReader dr = SqlHelper.ExecuteReader("SELECT TOP 10 CS_MC,SUM(RXS_XSJE)AS RXS_XSJE FROM SCRXS A LEFT OUTER JOIN CS B ON (A.RXS_GYSID=B.CS_ID)WHERE RXS_DATE BETWEEN '" + sdate + "' AND '" + edate + "' GROUP BY CS_MC");
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT TOP 10 HYMC,SUM(XSJE)AS XSJE FROM VI_HYXFMX A LEFT OUTER JOIN VI_HYDA B ON (A.HYID=B.HYID) WHERE XSRQ  BETWEEN '" + sdate + "' AND '" + edate + "' GROUP BY HYMC");
            while (dr.Read())
            {
                strXML = strXML + "<set name='" + dr["hymc"].ToString() + "' value='" + dr["xsje"].ToString() + "' color='" + strColor.Split(',')[i] + "' />";
                i = i + 1;
            }
            dr.Close();
            strXML = strXML + "</graph>";
            return FusionCharts.RenderChart("../../Charts/" + ChangeChart4.SelectedValue + "", "", strXML, "MyReport4", "500", "250", false, false);
        }

        protected void ChangeChart4_SelectedIndexChanged(object sender, EventArgs e)
        {
            FCLiteral4.Text = CreateChart4();
        }

        //5.图形生成
        public string CreateChart5()
        {
            int i = 0;
            string strXML = null;
            strXML = "<graph decimalPrecision='0' formatNumberScale='0' showNames='1' baseFontSize='12' showValues='0' baseFontColor='333333' useRoundEdges='1' showAlternateHGridColor='1' rotateNames='1'>";
            SqlDataReader dr = SqlHelper.ExecuteReader("EXEC sp_WY_FYJS_Chart '" + Request.Cookies["haoke"].Values["sdate"].ToString() + "','" + System.DateTime.Now.AddDays(1).ToString("yyyy-MM-dd") + "'");
            while (dr.Read())
            {
                strXML = strXML + "<set name='" + dr["fxmc"].ToString() + "' value='" + dr["fyje"].ToString() + "' color='" + strColor.Split(',')[i] + "' />";
                i = i + 1;
            }
            dr.Close();
            strXML = strXML + "</graph>";
            return FusionCharts.RenderChart("../../Charts/" + ChangeChart5.SelectedValue + "", "", strXML, "MyReport4", "500", "250", false, false);
        }

        protected void ChangeChart5_SelectedIndexChanged(object sender, EventArgs e)
        {
            FCLiteral5.Text = CreateChart5();
        }
    }
}
