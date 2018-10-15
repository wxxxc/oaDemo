using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class QueryWork_Show : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public static string FlowNumber, strfName, strfnName, lshid, Name;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT A.*,B.fName FROM hk_Work A LEFT OUTER JOIN hk_Form B ON(A.FK_fid=B.fID) WHERE wID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (datar1.Read())
                {
                    strfnName = datar1["NextNodeName"].ToString();
                    lshid = datar1["wSerialNo"].ToString();
                    Number.Text = datar1["wNo"].ToString();
                    Name = datar1["wName"].ToString();
                    FlowNumber = datar1["FK_wfno"].ToString();
                    string setfrom = null;
                    setfrom = hkdb.GetStrTeOut(datar1["wContent"].ToString().Replace("BACKGROUND-COLOR:", "").Replace("id=Text1", "readonly").Replace("id=\"Text1\"", "readonly").Replace("id=Text2", "readonly").Replace("id=\"Text2\"", "readonly").Replace("id=Text3", "readonly").Replace("id=\"Text3\"", "readonly"));
                    ContractContent.Text = setfrom;
                    lbltx.Text = setfrom;
                    strfName = datar1["fName"].ToString();
                    lblwTitle.Text = datar1["wTitle"].ToString();
                    lblwStatus.Text = datar1["wStatus"].ToString();
                }
                datar1.Close();

                //审批意见
                int glTMP3 = 0;
                int sta2 = 0;
                string strAtt2 = "<table width=100% border=1 cellspacing=0 cellpadding=0 class=form><tr><td align=center><b>审批意见</b></td></tr><tr>";
                SqlDataReader datar3 = SqlHelper.ExecuteReader("SELECT A.*,B.ui_desc FROM hk_WorkAppComm A LEFT OUTER JOIN yh B ON(A.FK_uid=B.ui_id) WHERE ac_wfID='" + hkdb.GetStr(Request.QueryString["id"]) + "' AND ac_Status='有效' ORDER BY acID");
                while (datar3.Read())
                {
                    strAtt2 += " <td width=100%><font color=red>" + datar3["acContent"].ToString() + "</font>&nbsp;&nbsp;" + datar3["ui_desc"].ToString() + "&nbsp;&nbsp;" + string.Format("{0:yyyy-MM-dd HH:mm}", datar3["AddTime"]) + "&nbsp;&nbsp;<a href=WorkAttDown.aspx?number=" + datar3["acAttNewName"].ToString() + " target=_blank class=gvlink>" + datar3["acAttName"].ToString() + "</a></td>";

                    glTMP3 = glTMP3 + 1;
                    if (glTMP3 == 1)
                    {
                        strAtt2 += "</tr><tr>";
                        glTMP3 = 0;
                    }

                    sta2 = 1;
                }
                datar3.Close();
                strAtt2 += " </table>";
                if (sta2 == 1)
                {
                    lblspyj.Text = strAtt2;
                }
            }

            BindDplist();
        }

        public void BindDplist()
        {
            this.lblattach.Text = null;
            int glTMP2 = 0;
            this.lblattach.Text += "<table width=100% border=0 cellspacing=0 cellpadding=4>";
            this.lblattach.Text += "<tr>";

            SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT * FROM hk_AttUpload WHERE attClass='w01' AND attKey='" + hkdb.GetStr(Number.Text) + "' ORDER BY attID DESC");
            while (datar1.Read())
            {
                this.lblattach.Text += " <td width=100% >·<a href=WorkAttDown.aspx?number=" + datar1["attNewName"].ToString() + "  target=_blank>" + datar1["attName"].ToString() + "</a></td>";

                glTMP2 = glTMP2 + 1;
                if (glTMP2 == 1)
                {
                    lblattach.Text += "</tr><TR>";
                    glTMP2 = 0;
                }
            }
            datar1.Close();
            this.lblattach.Text += " </table>";
        }
    }
}
