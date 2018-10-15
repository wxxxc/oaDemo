using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.dagl
{
    public partial class FilesManageBook_add_online : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public static string updatefilname, realname;
        public static string forname, forfile, number;
        protected void Page_Load(object sender, EventArgs e)
        {
            realname = this.Session["username"].ToString();
            this.Button1.Attributes.Add("onclick", "javascript: SaveToWeb();");

            if (!IsPostBack)
            {
                forfile = Request.QueryString["file"].ToString();
                number = Request.QueryString["number"].ToString();

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT attName FROM hk_AttUpload WHERE attNewName='" + hkdb.GetStr(Request.QueryString["file"]) + "' AND attClass='o01'");
                if (dr.Read())
                {
                    forname = dr["attName"].ToString();
                }
                dr.Close();

                if (Request.QueryString["filetype"].ToString() == ".doc" || Request.QueryString["filetype"].ToString() == ".DOC")
                {
                    Button6.Visible = true;
                    Button7.Visible = true;
                    Button8.Visible = true;
                    Button9.Visible = true;
                }

                if (Request.QueryString["filetype"].ToString() == ".xls" || Request.QueryString["filetype"].ToString() == ".XLS")
                {
                    Button6.Visible = false;
                    Button7.Visible = false;
                    Button8.Visible = false;
                    Button9.Visible = false;
                }


                if (Request.QueryString["filetype"].ToString() == ".ppt" || Request.QueryString["filetype"].ToString() == ".PPT")
                {
                    Button6.Visible = true;
                    Button7.Visible = false;
                    Button8.Visible = false;
                    Button9.Visible = false;
                }
            }

            string fileName = System.IO.Path.GetFileName(Request.QueryString["file"].ToString());

            //获得扩展名
            updatefilname = System.IO.Path.GetExtension(fileName);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            mydb.Alert_Close("提交成功！");
        }
    }
}
