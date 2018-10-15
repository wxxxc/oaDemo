using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class zsdt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("12104", "12104");
            }

            lbldt.Text = null;
            int glTMP1 = 0, glTMP2 = 0;
            this.lbldt.Text += "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
            this.lbldt.Text += "";
            SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KlClass order by id desc");
            while (datar.Read())
            {
                this.lbldt.Text += "<tr><td><table align=\"center\" border=\"0\" cellpadding=\"0\"  cellspacing=\"0\" width=\"100%\"><tr> <td  height=\"26px\"><table  height=\"26\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" > <tr><td  height=\"26px\" width=\"17px\" ></td> <td valign=\"bottom\" ><font color=\"black\">" + datar["Name"] + "</font>&nbsp;</td></tr></table></td></tr></table></tr></td>";
                glTMP2 = 0;
                SqlDataReader dr = SqlHelper.ExecuteReader("select * from OA_KlClassSub where BigId='" + datar["id"] + "' and ((CHARINDEX('," + this.Session["userid"].ToString() + ",',','+SyUsername+',') > 0 ) or SyUsername='全部用户' ) order by id desc");
                this.lbldt.Text += "<tr><td><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\"> <tr align=\"left\"> ";
                while (dr.Read())
                {
                    this.lbldt.Text += "<td width=\"25%\"><a href=zsdtlb.aspx?LittleId=" + dr["id"] + "><img src=\"../../images/oa/zsk.gif\" width=\"16\" height=\"16\" border=0/><font color=\"#3366ff\">" + dr["Name"] + "</font></td>";
                    glTMP2 = glTMP2 + 1;
                    if (glTMP2 == 4)
                    {
                        lbldt.Text += "</tr><tr align=\"left\"> ";
                        glTMP2 = 0;
                    }

                }
                dr.Close();
                lbldt.Text += " </table>";

                this.lbldt.Text += "<table align=\"center\" background=\"../../images/bg_l.gif\" border=\"0\" cellpadding=\"0\"  cellspacing=\"0\" width=\"100%\"><tr> <td  height=\"5px\"></td></tr></table>";

                this.lbldt.Text += "</td>";
                glTMP1 = glTMP1 + 1;
                if (glTMP1 == 1)
                {
                    lbldt.Text += "</tr>";
                    glTMP1 = 0;
                }
            }
            this.lbldt.Text += " </table>";
            datar.Close();
        }
    }
}
