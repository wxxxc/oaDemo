using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.app.flow
{
    public partial class HandleWork_Finished_Show : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string FlowNumber, strfName, strfnName, strwSerialNo, Name;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.*,B.fName FROM hk_Work A LEFT OUTER JOIN hk_Form B ON(A.FK_fid=B.fID) WHERE wID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (dr.Read())
                {
                    strfnName = dr["NextNodeName"].ToString();
                    strwSerialNo = dr["wSerialNo"].ToString();
                    Number.Text = dr["wNo"].ToString();
                    Name = dr["wName"].ToString();
                    FlowNumber = dr["FK_wfno"].ToString();

                    string setfrom = null;
                    setfrom = hkdb.GetStrTeOut(dr["wContent"].ToString().Replace("BACKGROUND-COLOR:", "").Replace("id=Text1", "readonly").Replace("id=\"Text1\"", "readonly").Replace("id=Text2", "readonly").Replace("id=\"Text2\"", "readonly").Replace("id=Text3", "readonly").Replace("id=\"Text3\"", "readonly"));
                    lblhtm.Text = setfrom;
                    strfName = dr["fName"].ToString();

                    lblwTitle.Text = dr["wTitle"].ToString();
                    lblwStatus.Text = dr["wStatus"].ToString();
                }
                dr.Close();

                //附件
                bd.GetAtt(Number.Text, "wk", "flow/work", fujian);
            }
        }
    }
}
