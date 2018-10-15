using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.yhgl
{
    public partial class Dbsxfz_Fp : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        string gid, gname;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("60306", "0");

                gname = Request.QueryString["gname"];
                ViewState["gname"] = gname;
                gid = hkdb.GetStr(Request.QueryString["id"]);
                ViewState["gid"] = gid;

                lbltid.Text = Request.QueryString["tid"];

                DataTable dt = new DataTable();
                dt = DropDownListBind();
                Displaydg(dt);
                lblgname.Text = gname;
            }
        }

        public DataTable DropDownListBind()
        {
            string Sql = " WHERE Status='正常'";
            if (lbltid.Text == "G")
            {
                Sql = Sql + " AND ProduID='G'";
            }
            else
            {
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
                    switch (this.Session["systype"].ToString())
                    {
                        case "G":
                            Sql = Sql + " AND ProduID='M'";   //SCM
                            break;
                        default:
                            Sql = Sql + " AND ProduID='" + this.Session["systype"] + "'";
                            break;
                    }
                }
            }

            DataSet ds = SqlHelper.ExecuteDs("SELECT ID,NAME,STATUS FROM HK_TODO " + Sql);
            return ds.Tables[0];
        }

        //绑定
        public void Displaydg(DataTable table)
        {
            dg.DataSource = table;
            dg.DataBind();
        }

        protected void dg_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Footer & e.Item.ItemType != ListItemType.Header)
            {
                e.Item.Attributes["onclick"] = "javascript:changeBg(this)";
                CheckBox CkboxRole = new CheckBox();
                CkboxRole = (CheckBox)e.Item.FindControl("CkboxRole");
                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT COUNT(*) AS NUMS FROM HK_GROUPS_TODO WHERE SSGID ='" + ViewState["gid"] + "' AND SSTDID='" + hkdb.GetStr(e.Item.Cells[0].Text) + "'");
                if (datar.Read())
                {
                    if (datar["nums"].ToString() == "0")
                    {
                        CkboxRole.Checked = false;
                    }
                    else
                    {
                        CkboxRole.Checked = true;
                    }
                }
                datar.Close();
            }
        }

        //复选框 
        protected void CkboxRole_CheckedChanged(object sender, System.EventArgs e)
        {
            CheckBox CkboxRole = new CheckBox();
            CkboxRole = (CheckBox)sender;
            TableRow tr = new TableRow();
            tr = (TableRow)CkboxRole.Parent.Parent;
            string modelid = tr.Cells[0].Text;
            bool power = CkboxRole.Checked;

            Set_rolepermission(modelid, power);
        }

        public void Set_rolepermission(string CurrentModelID, bool power)
        {
            string strsql = null;
            if (power)
            {
                strsql = "INSERT INTO HK_GROUPS_TODO(SSGID,SSTDID) VALUES('" + ViewState["gid"] + "','" + CurrentModelID + "')";
            }
            else
            {
                strsql = "DELETE FROM HK_GROUPS_TODO WHERE SSTDID='" + CurrentModelID + "' AND SSGID='" + ViewState["gid"] + "'";
            }

            SqlHelper.ExecuteSql(strsql);
        }
    }
}
