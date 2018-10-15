using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.clgl
{
    public partial class Clck : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10805", "10805");

                //页面绑定
                GridViewBind();
            }
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            switch (query_tj.SelectedItem.Value)
            {
                case "y":
                    DataSet ds = SqlHelper.ExecuteDs("select a.*,c.ui_desc from oa_clda a  left outer join yh c on (a.glry=c.ui_id)  where clzt='已借出'");
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    break;
                case "w":
                    DataSet ds1 = SqlHelper.ExecuteDs("select a.*,c.ui_desc from oa_clda a  left outer join yh c on (a.glry=c.ui_id)  where clzt='未借出'");
                    GridView1.DataSource = ds1;
                    GridView1.DataBind();
                    break;
            }
        }


        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}
