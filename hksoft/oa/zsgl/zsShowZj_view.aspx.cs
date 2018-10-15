using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class zsShowZj_view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KlChap where id='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                    if (datar.Read())
                    {
                        Name.Text = datar["Name"].ToString();
                        lblnr.Text = datar["Content"].ToString();
                        Number.Text = datar["Number"].ToString();

                        SqlDataReader datar1 = SqlHelper.ExecuteReader("select  * from OA_KlChapAtt where KeyField='" + hkdb.GetStr(Number.Text) + "' order by id desc");

                        this.fjlb.Text = null;
                        int i = 0;
                        this.fjlb.Text += "<table width=100% border=0 cellspacing=0 cellpadding=4>";
                        this.fjlb.Text += "<tr>";

                        while (datar1.Read())
                        {
                            this.fjlb.Text += " <td width=100% >·<a href=zszj_down.aspx?number=" + datar1["NewName"].ToString() + "  target=_blank>" + datar1["Name"].ToString() + "</a></td>";

                            i = i + 1;
                            if (i == 1)
                            {
                                fjlb.Text += "</tr><TR>";
                                i = 0;
                            }
                        }
                        datar1.Close();

                        this.fjlb.Text += " </table>";
                    }
                    datar.Close();
                }
            }
        }
    }
}
