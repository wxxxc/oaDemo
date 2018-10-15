using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.dagl
{
    public partial class FilesManage_update : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11802", "0");

                BindAttr();

                //dp绑定
                DropDownListBind();

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM OA_FilesManage WHERE ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        Number.Text = datar["Number"].ToString();
                        Name.Text = datar["Name"].ToString();
                        RoomName.SelectedValue = datar["RoomId"].ToString();
                        RoomName.SelectedItem.Text = datar["RoomName"].ToString();
                        BackYear.Text = datar["BackYear"].ToString();
                        Starttime.Text = datar["Starttime"].ToString();
                        Endtime.Text = datar["Endtime"].ToString();
                        UnitName.SelectedValue = datar["UnitId"].ToString();
                        UnitName.SelectedItem.Text = datar["UnitName"].ToString();
                        BzPost.Text = datar["BzPost"].ToString();
                        BgTime.Text = datar["BgTime"].ToString();
                        DengJi.SelectedValue = datar["DengJi"].ToString();
                        QuanZong.Text = datar["QuanZong"].ToString();
                        Mulu.Text = datar["Mulu"].ToString();
                        DaGuan.Text = datar["DaGuan"].ToString();
                        BaoXian.Text = datar["BaoXian"].ToString();
                        SuoWei.Text = datar["SuoWei"].ToString();
                        PinZheng.SelectedValue = datar["PinZheng"].ToString();
                        PzStartNum.Text = datar["PzStartNum"].ToString();
                        PzEndNum.Text = datar["PzEndNum"].ToString();
                        YeShu.Text = datar["YeShu"].ToString();
                        wfDeptIDs.Text = datar["QxUnitId"].ToString();
                        wfDept.Text = datar["QxUnitName"].ToString();
                        State.SelectedValue = datar["State"].ToString();
                        Remark.Text = datar["Remark"].ToString();
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

        public void BindAttr()
        {
            wfDept.Attributes.Add("readonly", "readonly");
        }

        //dp绑定 
        public void DropDownListBind()
        {
            //部门
            bd.Bind_DropDownList_bm(UnitName, "", "", "");

            //案卷密级
            string sql_dengji = "SELECT ID,MC FROM hk_zdylx where fl='o04' AND zt='正常'";
            bd.Bind_DropDownList(DengJi, sql_dengji, "ID", "MC", "", "");

            //凭证类别
            string sql_pinzheng = "SELECT ID,MC FROM hk_zdylx where fl='o05' AND zt='正常'";
            bd.Bind_DropDownList(PinZheng, sql_pinzheng, "ID", "MC", "", "");

            //所属卷库
            string sql_roomname = "select * from oa_FilesRoom where (CHARINDEX('," + this.Session["deptid"] + ",',','+QxUnitId+',')>0) order by id desc";
            bd.Bind_DropDownList(RoomName, sql_roomname, "ID", "name", "", "");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("Update OA_FilesManage Set Number='" + hkdb.GetStr(Number.Text) + "',Name='" + hkdb.GetStr(Name.Text) + "',RoomId='" + RoomName.SelectedValue + "',RoomName='" + RoomName.SelectedItem.Text + "' ,BackYear='" + hkdb.GetStr(BackYear.Text) + "',Starttime='" + hkdb.GetStr(Starttime.Text) + "',Endtime='" + hkdb.GetStr(Endtime.Text) + "' ,UnitId='" + UnitName.SelectedValue + "',UnitName='" + UnitName.SelectedItem.Text + "' ,BzPost='" + hkdb.GetStr(BzPost.Text) + "',BgTime='" + hkdb.GetStr(BgTime.Text) + "',DengJi='" + hkdb.GetStr(DengJi.SelectedValue) + "' ,QuanZong='" + hkdb.GetStr(QuanZong.Text) + "',Mulu='" + hkdb.GetStr(Mulu.Text) + "',DaGuan='" + hkdb.GetStr(DaGuan.Text) + "',BaoXian='" + hkdb.GetStr(BaoXian.Text) + "' ,SuoWei='" + hkdb.GetStr(SuoWei.Text) + "',PinZheng='" + PinZheng.SelectedValue + "' ,PzStartNum='" + hkdb.GetStr(PzStartNum.Text) + "',PzEndNum='" + hkdb.GetStr(PzEndNum.Text) + "',YeShu='" + hkdb.GetStr(YeShu.Text) + "' ,QxUnitId='" + hkdb.GetStr(wfDeptIDs.Text) + "',QxUnitName='" + hkdb.GetStr(wfDept.Text) + "' ,State='" + hkdb.GetStr(State.SelectedValue) + "',Remark='" + hkdb.GetStr(Remark.Text) + "' where id='" + int.Parse(Request.QueryString["id"]) + "'");

             mydb.Alert_Refresh_Close("保存成功！","FilesManage.aspx");
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            string sql = "SELECT ID FROM OA_FilesManageBook WHERE FilesId='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'";
            if (bd.CheckRepeat(sql) == "true")
            {
                mydb.Alert("删除失败,此案卷下已存在文件！");
                return;
            }

            SqlHelper.ExecuteSql("DELETE FROM OA_FilesManage WHERE ID = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            mydb.Alert_Refresh_Close("删除成功！","FilesManage.aspx");
        }
    }
}
