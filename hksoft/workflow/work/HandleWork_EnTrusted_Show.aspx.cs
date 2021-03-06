﻿using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class HandleWork_EnTrusted_Show : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public static string FlowNumber, strfName, strfnName, strwSerialNo, Name;
        public static int a;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.*,B.fName,C.ui_desc,D.fnName FROM hk_WorkEnTrust A LEFT OUTER JOIN hk_Form B ON(A.FK_fid=B.fID) LEFT OUTER JOIN yh C ON(A.etUserID=C.ui_id) LEFT OUTER JOIN hk_WorkFlowNode D ON(A.FK_fnno=D.fnNo) WHERE etID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (dr.Read())
                {
                    strwSerialNo = dr["etSerialNo"].ToString();
                    Number.Text = dr["etNo"].ToString();
                    Name = dr["etName"].ToString();
                    FlowNumber = dr["FK_wfno"].ToString();

                    string setfrom = null;
                    setfrom = hkdb.GetStrTeOut(dr["etContent"].ToString().Replace("BACKGROUND-COLOR:", "").Replace("id=Text1", "readonly").Replace("id=\"Text1\"", "readonly").Replace("id=Text2", "readonly").Replace("id=\"Text2\"", "readonly").Replace("id=Text3", "readonly").Replace("id=\"Text3\"", "readonly"));
                    ContractContent.Text = setfrom;
                    lbltx.Text = setfrom;
                    strfName = dr["fName"].ToString();
                    lbluName.Text = dr["ui_desc"].ToString();

                    lblwTitle.Text = dr["etTitle"].ToString();
                    strfnName = dr["fnName"].ToString();
                }
                dr.Close();
            }

            BindDroList();
        }

        public void BindDroList()
        {
            this.lblattach.Text = null;
            int glTMP2 = 0;
            this.lblattach.Text += "<table width=100% border=0 cellspacing=0 cellpadding=4>";
            this.lblattach.Text += "<tr>";

            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_AttUpload WHERE attKey='" + hkdb.GetStr(Number.Text) + "' AND attClass='w01' ORDER BY attID DESC");
            while (dr.Read())
            {
                this.lblattach.Text += " <td width=100% >·<a href=WorkAttDown.aspx?number=" + dr["attNewName"].ToString() + "  target=_blank>" + dr["attName"].ToString() + "</a></td>";
                glTMP2 = glTMP2 + 1;
                if (glTMP2 == 1)
                {
                    lblattach.Text += "</tr><TR>";
                    glTMP2 = 0;
                }
            }
            dr.Close();
            this.lblattach.Text += " </table>";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("HandleWork_EnTrusted.aspx");
        }
    }
}
