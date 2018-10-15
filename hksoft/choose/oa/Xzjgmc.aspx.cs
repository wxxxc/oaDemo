using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hksoft.choose.oa
{
    public partial class Xzjgmc : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                jigou.Attributes.Add("readonly", "readonly");

                SqlDataReader dr = SqlHelper.ExecuteReader("select * from BM where bm_id='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (dr.Read())
                {
                    jigou.Text = dr["bm_mc"].ToString();
                    GzdwId.Text = dr["bm_id"].ToString();
                }
                dr.Close();
            }
        }
    }
}