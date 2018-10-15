using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class OfficeEdit : System.Web.UI.Page
    {
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

                SqlDataReader dr = SqlHelper.ExecuteReader("select * from OA_KlChapAtt  where Newname='" + hkdb.GetStr(Request.QueryString["file"]) + "'");
                if (dr.Read())
                {
                    adname = dr["Name"].ToString();
                }
                dr.Close();

                if (Request.QueryString["filetype"].ToString() == ".doc" || Request.QueryString["filetype"].ToString() == ".DOC")
                {
                    prnBtn.Visible = true;
                    clrTrkBtn.Visible = true;
                    TrkBtn.Visible = true;
                    unTrkBtn.Visible = true;
                }

                if (Request.QueryString["filetype"].ToString() == ".xls" || Request.QueryString["filetype"].ToString() == ".XLS")
                {
                    prnBtn.Visible = false;
                    clrTrkBtn.Visible = false;
                    TrkBtn.Visible = false;
                    unTrkBtn.Visible = false;
                }

                if (Request.QueryString["filetype"].ToString() == ".ppt" || Request.QueryString["filetype"].ToString() == ".PPT")
                {
                    prnBtn.Visible = true;
                    clrTrkBtn.Visible = false;
                    TrkBtn.Visible = false;
                    unTrkBtn.Visible = false;
                }
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