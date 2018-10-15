using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.dagl
{
    public partial class FilesManage_Add : System.Web.UI.Page
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
            SqlHelper.ExecuteSql("insert into OA_FilesManage(State,Number,Name,RoomName,RoomId,BackYear,Starttime,Endtime,UnitId,UnitName,BzPost,BgTime,DengJi,QuanZong,Mulu,DaGuan,BaoXian,SuoWei,PinZheng,PzStartNum,PzEndNum,YeShu,QxUnitId,QxUnitName,Remark,Username,Realname) values ('" + State.SelectedValue + "','" + hkdb.GetStr(Number.Text) + "','" + hkdb.GetStr(Name.Text) + "','" + RoomName.SelectedItem.Text + "','" + RoomName.SelectedValue + "','" + hkdb.GetStr(BackYear.Text) + "','" + hkdb.GetStr(Starttime.Text) + "','" + hkdb.GetStr(Endtime.Text) + "','" + hkdb.GetStr(UnitName.SelectedValue) + "','" + hkdb.GetStr(UnitName.SelectedItem.Text) + "','" + hkdb.GetStr(BzPost.Text) + "','" + hkdb.GetStr(BgTime.Text) + "','" + hkdb.GetStr(DengJi.Text) + "','" + hkdb.GetStr(QuanZong.Text) + "','" + hkdb.GetStr(Mulu.Text) + "','" + hkdb.GetStr(DaGuan.Text) + "','" + hkdb.GetStr(BaoXian.Text) + "','" + hkdb.GetStr(SuoWei.Text) + "','" + hkdb.GetStr(PinZheng.Text) + "','" + hkdb.GetStr(PzStartNum.Text) + "','" + hkdb.GetStr(PzEndNum.Text) + "','" + hkdb.GetStr(YeShu.Text) + "','" + hkdb.GetStr(wfDeptIDs.Text) + "','" + hkdb.GetStr(wfDept.Text) + "','" + hkdb.GetStr(Remark.Text) + "','" + this.Session["UserID"] + "','" + this.Session["Username"] + "')");

            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "FilesManage.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！","FilesManage.aspx");
            }
        }

        //清空 
        protected void Clear_Click()
        {
            Number.Text = "";
            Name.Text = "";
            RoomName.SelectedValue = "";
            BackYear.Text = "";
            Starttime.Text = "";
            Endtime.Text = "";
            UnitName.SelectedValue = "";
            BzPost.Text = "";
            BgTime.Text = "";
            DengJi.SelectedValue = "";
            QuanZong.Text = "";
            Mulu.Text = "";
            DaGuan.Text = "";
            BaoXian.Text = "";
            SuoWei.Text = "";
            PinZheng.SelectedValue = "";
            PzStartNum.Text = "";
            PzEndNum.Text = "";
            YeShu.Text = "";
            State.SelectedValue = "未封卷";
            Remark.Text = "";
            wfDeptIDs.Text = "";
            wfDept.Text = "";
        }
    }
}
