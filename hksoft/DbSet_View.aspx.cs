using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro
{
    public partial class DbSet_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static int orderidAdd;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("1");

            if (!IsPostBack)
            {
                DropDownListBind();

                topnum.Text = "10";
            }
        }

        public void DropDownListBind()
        {
            string Sql = "";

            if (this.Session["systype"].ToString() == "A")     //主登录页
            {
                string str = null;
                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT ProduID FROM hk_Init");
                while (datar1.Read())
                {
                    str = str + "','" + datar1["ProduID"].ToString();
                }
                datar1.Close();

                Sql = Sql + " and ProduID in ('" + str + "')";
            }
            else  //子登录页
            {
                Sql = Sql + " and (ProduID='" + this.Session["systype"] + "' OR ProduID='P')";
            }

            string sql_Name = "select * from hk_Dashboard where Status='正常' and id not in (select a.id from hk_Dashboard a left outer join hk_MyDash b on (a.id=b.ssdbid) where Status='正常' and  ssdbid is not  null and Username='" + this.Session["userid"] + "')" + Sql + " order by id asc";
            bd.Bind_DropDownList_NoBlank(Name, sql_Name, "id", "Name", "", "");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            SqlDataReader datar = SqlHelper.ExecuteReader("select top 1 orderid from hk_MyDash order by orderid desc");
            if (datar.Read())
            {
                orderidAdd = int.Parse(datar["orderid"].ToString());
            }
            else
            {
                orderidAdd = 0;
            }
            datar.Close();

            int orderidAdd_1 = orderidAdd + 1;

            SqlHelper.ExecuteSql("insert into hk_MyDash(ssdbid,orderid,Username,topnum) values ('" + Name.SelectedValue + "','" + orderidAdd_1 + "','" + this.Session["userid"] + "','" + hkdb.GetStr(topnum.Text) + "')");
            mydb.Alert_Refresh_Close("保存成功！", "dbset.aspx");
        }
    }
}
