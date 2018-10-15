using System;
using System.Data;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.app.portal
{
    public partial class Notice_Show : System.Web.UI.Page
    {
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"].ToString()))
                {

                    //qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id = '001'"));
                    //绑定数据 
                    ListViewBind();

                    //附件
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT GGFJ  FROM HK_QYGG WHERE GGID='" + Request.QueryString["id"].ToString() + "'");
                    if (datar.Read())
                    {
                             bd.GetAttFj(datar["ggfj"].ToString(), "p02", "portal/gg", fujian);
                    }
                    datar.Close();
                }
            }
        }

        public void ListViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.*,B.MC AS GGFL_MC,C.UI_DESC AS LRRMC FROM hk_QYGG A LEFT OUTER JOIN hk_ZDYLX B ON(A.GGFL = B.ID) LEFT OUTER JOIN YH C ON(A.LRR = C.UI_ID) WHERE LX = '企业' AND GGID = '" + Request.QueryString["id"].ToString() + "'");
            ListView1.DataSource = ds;
            ListView1.DataBind();
        }

        //预览
        public string isshowfj(string path)
        {
            string display = "";
            if (path == "../.." || path == "")
            {
                display = "display:none";
            }
            else
            {
                display = "display:block";
            }
            return display;
        }


    }
}
