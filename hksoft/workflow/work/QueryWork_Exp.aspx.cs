using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class QueryWork_Exp : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                string str;
                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT A.* FROM hk_Work A WHERE wID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (datar1.Read())
                {
                    string setfrom = null;
                    setfrom = hkdb.GetStrTeOut(datar1["wContent"].ToString());

                    str = "流水号:" + datar1["wSerialNo"].ToString() + "-" + datar1["wName"].ToString() + " - 当前步骤:" + datar1["NextNodeName"].ToString() + " - 状态:" + datar1["wStatus"].ToString() + "<br>";
                    str += "工作标题:" + datar1["wTitle"].ToString() + "<br>" + setfrom + "<br>";

                    int glTMP2 = 0;
                    int sta = 0;
                    string strAtt = "<table width=100% border=0 cellspacing=0 cellpadding=2><tr>";
                    SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT * FROM hk_AttUpload WHERE attClass='w01' AND attKey='" + datar1["wNo"].ToString() + "' ORDER BY attID DESC");
                    while (datar2.Read())
                    {
                        strAtt += " <td width=100% >·<a href=WorkAttDown.aspx?number=" + datar2["attNewName"].ToString() + "  target=_blank>" + datar2["attName"].ToString() + "</a></td>";

                        glTMP2 = glTMP2 + 1;
                        if (glTMP2 == 1)
                        {
                            strAtt += "</tr><tr>";
                            glTMP2 = 0;
                        }

                        sta = 1;
                    }
                    datar2.Close();
                    strAtt += " </table>";

                    int glTMP3 = 0;
                    int sta2 = 0;
                    string strAtt2 = "<table width=100% border=1 cellspacing=0 cellpadding=2><tr><td align=center><b>审批意见</b></td></tr><tr>";
                    SqlDataReader datar3 = SqlHelper.ExecuteReader("SELECT A.*,B.ui_desc FROM hk_WorkAppComm A LEFT OUTER JOIN yh B ON(A.FK_uid=B.ui_id) WHERE ac_wfID='" + datar1["wID"].ToString() + "' AND ac_Status='有效' ORDER BY acID");
                    while (datar3.Read())
                    {
                        strAtt2 += " <td width=100%><font color=red>" + datar3["acContent"].ToString() + "</font>&nbsp;&nbsp;" + datar3["ui_desc"].ToString() + "&nbsp;&nbsp;" + string.Format("{0:yyyy-MM-dd HH:mm}", datar3["AddTime"]) + "&nbsp;&nbsp;<a href=WorkAttDown.aspx?number=" + datar3["acAttNewName"].ToString() + " target=_blank class=gvlink>" + datar3["acAttName"].ToString() + "</a>&nbsp;&nbsp;步骤名称：" + datar3["ac_fName"].ToString() + "</td>";

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

                    if (sta == 1)
                    {
                        str = str + strAtt;
                    }

                    if (sta2 == 1)
                    {
                        str = str + strAtt2;
                    }

                    Response.Write(str);
                }
                datar1.Close();
               
                this.Response.Write("<script language=javascript>document.execCommand('saveas','true','工作导出.htm')</script>");
            }
        }
    }
}
