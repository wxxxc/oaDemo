using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.portal.wpgl
{
    public partial class ViewDisk : System.Web.UI.Page
    {
        int nFileID = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10109", "0");
            }

            //获取参数
            if (Request.Params["DirID"] != null)
            {
                if (Int32.TryParse(Request.Params["DirID"].ToString(), out nFileID) == false)
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

        public void BindFileData(int nDirID)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.*,B.Name FROM hk_NetDisk_Url A LEFT OUTER JOIN hk_NetDisk_Dir B ON(A.DirID=B.DirID) WHERE A.DirID='" + nFileID.ToString() + "'");
            if (dr.Read())
            {
                lblName.Text = dr["FileName"].ToString();
                lblFileType.Text = dr["Type"].ToString();
                lblContain.Text = dr["Contain"].ToString() + "(字节)";
                lblCreateDate.Text = dr["CreateDate"].ToString();
                lblDir.Text = dr["Name"].ToString();
            }
            dr.Close();
        }

        protected void ReturnBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShowDisk.aspx");
        }
    }
}
