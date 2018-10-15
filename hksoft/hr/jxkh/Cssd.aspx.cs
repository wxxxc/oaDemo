using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Cssd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("81101", "81101");
            }

            //Demo
            //if (hkdb.IsDemo("Y") == "true")
            //{
            //    return;
            //}

            //绑定数据 
            GridViewBind();
        }

        public void GridViewBind()
        {
            SqlDataSource1.SelectCommand = "";
            SqlDataSource1.SelectCommand = "SELECT * FROM HR_Kpdf_Paramt ORDER BY P_Order";
            SqlDataSource1.UpdateCommand = "";
            SqlDataSource1.UpdateCommand = "UPDATE HR_Kpdf_Paramt SET P_Value = @P_Value WHERE P_Code = @P_Code";
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
