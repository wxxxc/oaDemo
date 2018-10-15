using haoke365;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hksoft.app.task
{
    public partial class nr : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                string Sql = "select rwnr from OA_Rwd01 where rwid='" + hkdb.GetStr(Request.QueryString["rwid"].ToString()) + "'";
                rwnr.Text = SqlHelper.ExecuteScalar(Sql).ToString();
            }
        }
    }
}