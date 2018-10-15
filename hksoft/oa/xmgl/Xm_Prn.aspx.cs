using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.xmgl
{
    public partial class Xm_Prn : System.Web.UI.Page
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

                string xmmcstr = Request.QueryString["i1"];
                string sssfstr = Request.QueryString["i2"];
                string sscsstr = Request.QueryString["i3"];
                string xmjdstr = Request.QueryString["i4"];

                string str1 = "where 1=1 ";

                if (!string.IsNullOrEmpty(xmmcstr))
                {
                    str1 = str1 + " and xmmc like '%" + xmmcstr + "%'";
                }
                if (!string.IsNullOrEmpty(sssfstr))
                {
                    str1 = str1 + " and sssf like '%" + sssfstr + "%'";
                }
                if (!string.IsNullOrEmpty(sscsstr))
                {
                    str1 = str1 + " and sscs like '%" + sscsstr + "%'";
                }
                if (!string.IsNullOrEmpty(xmjdstr))
                {
                    str1 = str1 + " and xmjd like '%" + xmjdstr + "%'";
                }

                SqlDataSource1.SelectCommand = "select * from OA_XMGL " + str1 + " order by cjsj desc";

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
