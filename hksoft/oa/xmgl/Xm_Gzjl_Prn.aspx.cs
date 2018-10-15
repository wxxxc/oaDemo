using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.xmgl
{
    public partial class Xm_Gzjl_Prn : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11505,11506", "0");

                DropDownListBind_lx();
                //dp绑定 

                string xmidstr = Request.QueryString["i1"];

                string str1 = "";

                if (!string.IsNullOrEmpty(xmidstr))
                {
                    str1 = " where xmid='" + xmidstr + "'";
                }

                SqlDataSource1.SelectCommand = "select * from OA_XMGL_GZJL " + str1 + " order by gzrq desc";

                panel1.Width = int.Parse(papersize.SelectedValue);
            }
        }

        //dp绑定 
        public void DropDownListBind_lx()
        {
            //打印尺寸
            string sql_size = "select dymc,dyz from hk_DYSZ where dyzt='正常'";
            bd.Bind_DropDownList_NoBlank(papersize, sql_size, "dyz", "dymc", "", "");

        }

        protected void ChangeSize_Selected(object sender, EventArgs e)
        {
            panel1.Width = int.Parse(papersize.SelectedValue);
        }
    }
}
