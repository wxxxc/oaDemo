using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.dagl
{
    public partial class FilesManageBook_show : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11802,11803,11804,11805,11806,11807", "0");

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT A.*,B.mc AS MiJi_mc,C.mc as Dengji_mc,D.mc as WjType_mc,E.mc as GwType_mc FROM OA_FilesManageBook A LEFT OUTER JOIN hk_ZDYLX B ON(A.MiJi=B.ID) LEFT OUTER JOIN hk_ZDYLX C ON(A.Dengji=C.ID) LEFT OUTER JOIN hk_ZDYLX D ON(A.WjType=D.ID) LEFT OUTER JOIN hk_ZDYLX E ON(A.GwType=E.ID) WHERE A.ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        Number.Text = datar["Number"].ToString();
                        lblNum.Text = datar["Num"].ToString();
                        lblName.Text = datar["Name"].ToString();
                        lblwjTitle.Text = datar["Title"].ToString();
                        lblOtherTitle.Text = datar["OtherTitle"].ToString();
                        lblFwCompany.Text = datar["FwCompany"].ToString();
                        lblFwTime.Text = datar["FwTime"].ToString();
                        lblMiji.Text = datar["MiJi_mc"].ToString();
                        lblDengji.Text = datar["Dengji_mc"].ToString();
                        lblWjType.Text = datar["WjType_mc"].ToString();
                        lblGwType.Text = datar["GwType_mc"].ToString();
                        lblWjNum.Text = datar["WjNum"].ToString();
                        lblDyNum.Text = datar["DyNum"].ToString();
                        lblFilesName.Text = datar["FilesName"].ToString();
                        lblRemark.Text = datar["Remark"].ToString();
                        datar.Close();

                        //附件
                        bd.GetAtt(Number.Text, "o01", "oa/dagl", fujian);
                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert_Close("此记录不存在,可能已被删除！");
                    }
                }
            }
        }
    }
}
