using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.csxx
{
    public partial class Cs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("60102", "60102");
            }

            //Demo
            mydb.IsDemo_Stop();

            //绑定数据 
            GridViewBind();
        }

        public void GridViewBind()
        {
            string Sql = " WHERE PARAMT NOT LIKE 'screen%'";

            if (this.Session["systype"].ToString() == "A")     //主登录页
            {
                string str = null;
                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT ProduID FROM hk_Init");
                while (datar1.Read())
                {
                    str = str + "','" + datar1["ProduID"].ToString();
                }
                datar1.Close();

                Sql = Sql + " AND ProduID IN('" + str + "')";
            }
            else  //子登录页
            {
                Sql = Sql + " AND (ProduID='" + this.Session["systype"] + "' OR ProduID='P')";
            }

            SqlDataSource1.SelectCommand = "";
            SqlDataSource1.SelectCommand = "SELECT * FROM hk_CSDA " + Sql + " ORDER BY P_ID";
            SqlDataSource1.UpdateCommand = "";
            SqlDataSource1.UpdateCommand = "UPDATE hk_CSDA SET P_string = @P_string WHERE Paramt = @Paramt";
        }

        public void RowDataBound(object sender, GridViewRowEventArgs e)
        {
            ListItemType itemType = default(ListItemType);
            itemType = (ListItemType)e.Row.RowType;
            if ((itemType != ListItemType.Header) & (itemType != ListItemType.Footer) & (itemType != ListItemType.Separator))
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}
