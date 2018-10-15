using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.dagl
{
    public partial class FilesManage : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11802", "11802");

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
            string Str1 = " WHERE 1=1";

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

                LinkButton l1 = (LinkButton)e.Row.FindControl("Shanchu");
                LinkButton l2 = (LinkButton)e.Row.FindControl("ZtOrQd");
                LinkButton l3 = (LinkButton)e.Row.FindControl("ShouHui");

                l1.Attributes.Add("onclick", "javascript:return confirm('确认删除吗？')");

                l3.Attributes.Add("onclick", "javascript:return confirm('确认收回此案卷所有借阅出去的文件吗？')");

                if (e.Row.Cells[4].Text.ToString() == "已封卷")
                {
                    l2.Attributes.Add("onclick", "javascript:return confirm('确认拆卷吗。操作后，拥有权限的人可以申请借阅文件')");
                    l2.Visible = true;
                }
                if (e.Row.Cells[4].Text.ToString() == "未封卷")
                {
                    l2.Attributes.Add("onclick", "javascript:return confirm('确认封卷吗。操作后，所有人都不能申请借阅文件')");
                    l2.Visible = true;
                }
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ZtOrQd")
            {
                int ID = Convert.ToInt32(e.CommandArgument);

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_FilesManage where id='" + ID + "' and  State='已封卷'");
                if (datar.Read())
                {
                    datar.Close();
                    SqlHelper.ExecuteSql("Update OA_FilesManage Set State='未封卷'  where id='" + ID + "'");
                    mydb.Alert("拆卷成功！");
                }
                else
                {
                    datar.Close();
                    SqlHelper.ExecuteSql("Update OA_FilesManage  Set State='已封卷'  where id='" + ID + "'");
                    mydb.Alert("封卷成功！");
                }

                GridViewBind();
            }

            if (e.CommandName == "Shanchu")
            {
                int ID = Convert.ToInt32(e.CommandArgument);

                SqlHelper.ExecuteSql("delete from OA_FilesManage where id='" + ID + "'");

                SqlHelper.ExecuteSql("delete from OA_FilesManageBook where FilesId='" + ID + "'");

                GridViewBind();
            }

            if (e.CommandName == "ShouHui")
            {
                int ID = Convert.ToInt32(e.CommandArgument);

                SqlHelper.ExecuteSql("Update OA_FilesManageBook Set State='未借出',JrUsername='',JrRealname=''  where FilesId='" + ID + "'");

                SqlHelper.ExecuteSql("Update OA_FilesManageBookLog  Set State='被收回' ,GhTime='" + System.DateTime.Now.ToString() + "' where AJId='" + ID + "' and (State='未归还')");

                mydb.Alert("收回成功！");

                GridViewBind();
            }
        }
    }
}
