using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class OfficeEdit : System.Web.UI.Page
    {
        BindData bd = new BindData();

        public static string extfilename, usname;
        public static string adname, adfile, number;
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            usname = this.Session["username"].ToString();
            this.SaveBtn.Attributes.Add("onclick", "javascript: SaveFile();");

            if (!IsPostBack)
            {
                adfile = Request.QueryString["file"].ToString();
                number = Request.QueryString["number"].ToString();

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT attName FROM hk_AttUpload WHERE attNewName='" + hkdb.GetStr(Request.QueryString["file"]) + "' AND attClass='w01'");
                if (dr.Read())
                {
                    adname = dr["attName"].ToString();
                }
                dr.Close();

                if (Request.QueryString["filetype"].ToString() == ".doc" || Request.QueryString["filetype"].ToString() == ".DOC")
                {
                    prnBtn.Visible = true;
                    clrTrkBtn.Visible = true;
                    TrkBtn.Visible = true;
                    unTrkBtn.Visible = true;
                    dp_admindoc.Visible = true;
                    Button3.Visible = true;
                }

                if (Request.QueryString["filetype"].ToString() == ".xls" || Request.QueryString["filetype"].ToString() == ".XLS")
                {
                    prnBtn.Visible = false;
                    clrTrkBtn.Visible = false;
                    TrkBtn.Visible = false;
                    unTrkBtn.Visible = false;
                    dp_admindoc.Visible = false;
                    Button3.Visible = false;
                }

                if (Request.QueryString["filetype"].ToString() == ".ppt" || Request.QueryString["filetype"].ToString() == ".PPT")
                {
                    prnBtn.Visible = true;
                    clrTrkBtn.Visible = false;
                    TrkBtn.Visible = false;
                    unTrkBtn.Visible = false;
                    dp_admindoc.Visible = false;
                    Button3.Visible = false;
                }

                string sql_admindoc = "SELECT * FROM hk_AdminDoc WHERE adType='" + hkdb.GetStr(Request.QueryString["filetype"].ToString()) + "' AND (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+adUserIDs+',') > 0)";
                bd.Bind_DropDownList(dp_admindoc, sql_admindoc, "adNewName", "adName", "请选择", "请选择");
            }

            string fileName = System.IO.Path.GetFileName(Request.QueryString["file"].ToString());
            extfilename = System.IO.Path.GetExtension(fileName);
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            mydb.Alert_Close("保存成功！");
        }
    }
}
