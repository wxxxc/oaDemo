using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.dagl
{
    public partial class FilesManage_show : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11802,11808", "0");

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT A.*,B.MC AS DengJi_MC,C.MC AS PinZheng_MC FROM OA_FilesManage A LEFT OUTER JOIN hk_ZDYLX B ON(A.DengJi=B.ID) LEFT OUTER JOIN hk_ZDYLX C ON(A.PinZheng=C.ID) WHERE A.ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        lblNumber.Text = datar["Number"].ToString();
                        lblName.Text = datar["Name"].ToString();
                        lblRoomName.Text = datar["RoomName"].ToString();
                        lblBackYear.Text = datar["BackYear"].ToString();
                        lblStarttime.Text = datar["Starttime"].ToString();
                        lblEndtime.Text = datar["Endtime"].ToString();
                        lblUnitName.Text = datar["UnitName"].ToString();
                        lblBzPost.Text = datar["BzPost"].ToString();
                        lblBgTime.Text = datar["BgTime"].ToString();
                        lblDengJi.Text = datar["DengJi_MC"].ToString();
                        lblQuanZong.Text = datar["QuanZong"].ToString();
                        lblMulu.Text = datar["Mulu"].ToString();
                        lblDaGuan.Text = datar["DaGuan"].ToString();
                        lblBaoXian.Text = datar["BaoXian"].ToString();
                        lblSuoWei.Text = datar["SuoWei"].ToString();
                        lblPinZheng.Text = datar["PinZheng_MC"].ToString();
                        lblPzStartNum.Text = datar["PzStartNum"].ToString();
                        lblPzEndNum.Text = datar["PzEndNum"].ToString();
                        lblYeShu.Text = datar["YeShu"].ToString();
                        lblwfDept.Text = datar["QxUnitName"].ToString();
                        lblState.Text = datar["State"].ToString();
                        lblRemark.Text = datar["Remark"].ToString();
                        datar.Close();
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
