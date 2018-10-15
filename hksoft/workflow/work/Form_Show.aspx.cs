using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class Form_Show : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.*,B.fcName FROM hk_Form A LEFT OUTER JOIN hk_FormClass B ON(A.FK_fcid=B.fcID) WHERE fID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (dr.Read())
                {
                    fClass.Text = dr["fcName"].ToString();
                    fName.Text = dr["fName"].ToString();
                    fContent.Text = hkdb.GetStrTeOut(dr["fContent"].ToString().Replace("id=\"Text1\"", "id=\"Text1\"   readonly ").Replace("id=Text1", "id=Text1   readonly ").Replace("id=\"TextArea1\"", "id=\"TextArea1\"   readonly ").Replace("id=TextArea1", "id=TextArea1   readonly ").Replace("id=\"Checkbox1\"", "id=\"Checkbox1\"    disabled=true ").Replace("id=Checkbox1", "id=Checkbox1    disabled=true "));
                }
                dr.Close();
            }
        }
    }
}
