using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class wdzs_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10111", "0");

                DropDownListBind();
                //dp绑定 

                BindAttr();

                //新增页面 
                lbltitle.Text = "新增";

                Random f = new Random();
                string sjs = f.Next(10000).ToString();
                Number.Text = "" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + System.DateTime.Now.Hour.ToString() + "" + System.DateTime.Now.Minute.ToString() + "" + System.DateTime.Now.Second.ToString() + "" + System.DateTime.Now.Millisecond.ToString() + "" + sjs + "";
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
        }

        //dp绑定 
        public void DropDownListBind()
        {
            string sql_BigName = "select ID,Name from OA_KlClass order by ID";
            bd.Bind_DropDownList(BigName, sql_BigName, "ID", "Name", "", "");

        }

        protected void BigName_SelectedIndexChanged(object sender, EventArgs e)
        {
            LittleName.Items.Clear();

            string sql_LittleName = "select ID,Name from OA_KlClassSub  where BigId='" + BigName.SelectedValue + "' order by ID";
            bd.Bind_DropDownList(LittleName, sql_LittleName, "ID", "Name", "", "");

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteScalar("insert into OA_KnowLedge(Number,BigId,BigName,LittleId,LittleName,Title,Content,AthourSay,KeyWord,YdUsername,YdRealname,TjUsername,TjRealname,ScUsername,ScRealname,DyUsername,DyRealname,PointNum,ScNum,DyNum,TjNum,LastTime,QxYdUsername,QxYdRealname,IfTj,State,KeyKmId,Username,Realname,Settime) values ('" + hkdb.GetStr(Number.Text) + "','" + BigName.SelectedValue + "','" + BigName.SelectedItem + "','" + LittleName.SelectedValue + "','" + LittleName.SelectedItem + "','" + hkdb.GetStr(TitleName.Text) + "','" + hkdb.GetStr(Content.Text) + "','" + hkdb.GetStr(AthourSay.Text) + "','" + hkdb.GetStr(KeyWord.Text) + "','','','','','','','','','0','0','0','0','" + System.DateTime.Now.ToString() + "','" + hkdb.GetStr(UserID.Text) + "','" + hkdb.GetStr(UserName.Text) + "','否','暂存','0','" + this.Session["userid"] + "','" + this.Session["username"] + "','" + System.DateTime.Now.ToString() + "')");

            //判断btn
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert("保存成功,请新增下一条记录！");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！", "wdzs.aspx?LittleId=" + Request.QueryString["id"] + "");
            }
        }

        protected void SANZJ_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteScalar("insert into OA_KnowLedge(Number,BigId,BigName,LittleId,LittleName,Title,Content,AthourSay,KeyWord,YdUsername,YdRealname,TjUsername,TjRealname,ScUsername,ScRealname,DyUsername,DyRealname,PointNum,ScNum,DyNum,TjNum,LastTime,QxYdUsername,QxYdRealname,IfTj,State,KeyKmId,Username,Realname,Settime) values ('" + hkdb.GetStr(Number.Text) + "','" + BigName.SelectedValue + "','" + BigName.SelectedItem + "','" + LittleName.SelectedValue + "','" + LittleName.SelectedItem + "','" + hkdb.GetStr(TitleName.Text) + "','" + hkdb.GetStr(Content.Text) + "','" + hkdb.GetStr(AthourSay.Text) + "','" + hkdb.GetStr(KeyWord.Text) + "','','','','','','','','','0','0','0','0','" + System.DateTime.Now.ToString() + "','" + hkdb.GetStr(UserID.Text) + "','" + hkdb.GetStr(UserName.Text) + "','否','暂存','0','" + this.Session["userid"] + "','" + this.Session["username"] + "','" + System.DateTime.Now.ToString() + "')");

            Response.Redirect("wdzs_add_zjAdd.aspx?Number=" + Number.Text + "&LittleId=" + Request.QueryString["id"] + "");
        }

        //清空 
        protected void Clear_Click()
        {
            BigName.Text = "";
            LittleName.Text = "";
            UserName.Text = "";
            UserID.Text = "";
            TitleName.Text = "";
            Content.Text = "";
            AthourSay.Text = "";
            KeyWord.Text = "";
        }

        protected void allyh_Click(object sender, EventArgs e)
        {
            UserID.Text = "全部用户";
            UserName.Text = "全部用户";
        }
    }
}
