using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.dagl
{
    public partial class FilesManageJy : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11804", "11804");

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                //页面绑定 
                GridViewBind();
            }
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " WHERE State='未封卷' and (CHARINDEX('," + this.Session["deptid"] + ",',','+QxUnitId+',')>0 )";

            if (!string.IsNullOrEmpty(jsNumber.Text))
            {
                Str1 = Str1 + " AND Number LIKE '%" + hkdb.GetStr(jsNumber.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsName.Text))
            {
                Str1 = Str1 + " AND Name LIKE '%" + hkdb.GetStr(jsName.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsRoomName.Text))
            {
                Str1 = Str1 + " AND RoomName LIKE '%" + hkdb.GetStr(jsRoomName.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsUnitName.Text))
            {
                Str1 = Str1 + " AND UnitName LIKE '%" + hkdb.GetStr(jsUnitName.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsBzPost.Text))
            {
                Str1 = Str1 + " AND BzPost LIKE '%" + hkdb.GetStr(jsBzPost.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsBgTime.Text))
            {
                Str1 = Str1 + " AND BgTime LIKE '%" + hkdb.GetStr(jsBgTime.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsQuanZong.Text))
            {
                Str1 = Str1 + " AND QuanZong LIKE '%" + hkdb.GetStr(jsQuanZong.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsMulu.Text))
            {
                Str1 = Str1 + " AND Mulu LIKE '%" + hkdb.GetStr(jsMulu.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsDaGuan.Text))
            {
                Str1 = Str1 + " AND DaGuan LIKE '%" + hkdb.GetStr(jsDaGuan.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsBaoXian.Text))
            {
                Str1 = Str1 + " AND BaoXian LIKE '%" + hkdb.GetStr(jsBaoXian.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsSuoWei.Text))
            {
                Str1 = Str1 + " AND SuoWei LIKE '%" + hkdb.GetStr(jsSuoWei.Text) + "%' ";
            }

            if (!string.IsNullOrEmpty(jsPinZheng.Text))
            {
                Str1 = Str1 + " AND PinZheng LIKE '%" + hkdb.GetStr(jsPinZheng.Text) + "%' ";
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) AS NUMS FROM OA_FilesManage" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM OA_FilesManage" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}
