using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.portal.wpgl
{
    public partial class EditFile1 : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        int nFileID = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10109", "0");
            }

            ///获取参数
            if (Request.Params["UrlID"] != null)
            {
                if (Int32.TryParse(Request.Params["UrlID"].ToString(), out nFileID) == false)
                {
                    return;
                }
            }

            if (!IsPostBack)
            {
                if (nFileID > -1)
                {
                    BindFileData(nFileID);
                }
            }
        }

        public void BindFileData(int nUrlID)
        {
            string sFileName = "";
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT FileName FROM hk_NetDisk_Url WHERE UrlID='" + nFileID.ToString() + "'");
            if (dr.Read())
            {
                sFileName = dr["FileName"].ToString();
            }
            dr.Close();

            ///查找最后一个“.”
            int dotIndex = sFileName.LastIndexOf(".");
            if (dotIndex > -1)
            {
                //获取文件的名称（不含后缀）
                Name.Text = sFileName.Substring(0, dotIndex);
                lb.Text = sFileName.Substring(dotIndex).Substring(1);
                lb.Text = "." + lb.Text;
            }
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            string strName = (Name.Text + lb.Text).Trim();

            SqlHelper.ExecuteSql("UPDATE hk_NetDisk_Url SET FileName ='" + hkdb.GetStr(strName) + "' WHERE UrlID='" + nFileID.ToString() + "'");
            mydb.Alert_Refresh_Close("文件名修改成功！","Showdisk.aspx");
        }
    }
}