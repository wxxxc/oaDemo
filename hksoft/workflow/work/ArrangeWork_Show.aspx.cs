using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class ArrangeWork_Show : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public static string strwfno, strwfid, strfName, strserid, Name;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT A.*,B.ui_desc,C.fName FROM hk_WorkFolder A LEFT OUTER JOIN yh B ON(A.fdPromoterID=B.ui_id) LEFT OUTER JOIN hk_Form C ON(A.FK_fid=C.fID) WHERE fdID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (datar1.Read())
                {
                    strserid = datar1["fdSerialNo"].ToString();
                    Number.Text = datar1["fdNo"].ToString();
                    Name = datar1["fdName"].ToString();
                    strwfno = datar1["FK_wfno"].ToString();

                    string setfrom = null;
                    setfrom = hkdb.GetStrTeOut(datar1["fdContent"].ToString().Replace("BACKGROUND-COLOR:", "").Replace("id=Text1", "readonly").Replace("id=\"Text1\"", "readonly").Replace("id=Text2", "readonly").Replace("id=\"Text2\"", "readonly").Replace("id=Text3", "readonly").Replace("id=\"Text3\"", "readonly"));
                    ContractContent.Text = setfrom;
                    lbltx.Text = setfrom;
                    strfName = datar1["fName"].ToString();
                    lblFcname.Text = datar1["ui_desc"].ToString();
                    lblwTitle.Text = datar1["fdTitle"].ToString();
                }
                datar1.Close();

                SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT * FROM hk_Work WHERE wNo='" + hkdb.GetStr(Number.Text) + "'");
                if (datar2.Read())
                {
                    strwfid = datar2["wID"].ToString();
                }
                datar2.Close();
            }

            BindDplist();
        }

        public void BindDplist()
        {
            this.lblattach.Text = null;
            int itp = 0;
            this.lblattach.Text += "<table width=100% border=0 cellspacing=0 cellpadding=4>";
            this.lblattach.Text += "<tr>";

            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_AttUpload WHERE attClass='w01' AND attKey='" + hkdb.GetStr(Number.Text) + "' ORDER BY attID DESC");
            while (dr.Read())
            {
                this.lblattach.Text += " <td width=100% >·<a href=WorkAttDown.aspx?number=" + dr["attNewName"].ToString() + " target=_blank>" + dr["attName"].ToString() + "</a></td>";

                itp = itp + 1;
                if (itp == 1)
                {
                    lblattach.Text += "</tr><TR>";
                    itp = 0;
                }
            }
            dr.Close();

            this.lblattach.Text += " </table>";
        }
    }
}
