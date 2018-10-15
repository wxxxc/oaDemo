using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class wdzs_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10111", "0");

                BindAttr();

                DropDownListBind();
                //dp绑定 

                //Random f = new Random();
                //string sjs = f.Next(10000).ToString();
                //Number.Text = "" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + System.DateTime.Now.Hour.ToString() + "" + System.DateTime.Now.Minute.ToString() + "" + System.DateTime.Now.Second.ToString() + "" + System.DateTime.Now.Millisecond.ToString() + "" + sjs + "";

                if (!IsPostBack)
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select *  from OA_KnowLedge where ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        BigName.SelectedValue = datar["Bigid"].ToString();
                        //知识小类
                        LittleName.Items.Clear();

                        string sql_LittleName = "select ID,Name from OA_KlClassSub  where BigId='" + BigName.SelectedValue + "' order by ID";
                        bd.Bind_DropDownList(LittleName, sql_LittleName, "ID", "Name", "", "");


                        TitleName.Text = datar["Title"].ToString();
                        Content.Text = datar["Content"].ToString();
                        AthourSay.Text = datar["AthourSay"].ToString();
                        KeyWord.Text = datar["KeyWord"].ToString();
                        UserName.Text = datar["QxYdRealname"].ToString();
                        UserID.Text = datar["QxYdUsername"].ToString();
                        LittleName.SelectedValue = datar["LittleId"].ToString();
                        Number.Text = datar["Number"].ToString();
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
            SqlHelper.ExecuteScalar("Update OA_KnowLedge  Set BigId='" + BigName.SelectedValue + "',BigName='" + BigName.SelectedItem + "',LittleId='" + LittleName.SelectedValue + "',LittleName='" + LittleName.SelectedItem + "',Title='" + hkdb.GetStr(TitleName.Text) + "',Content='" + hkdb.GetStr(Content.Text) + "',AthourSay='" + hkdb.GetStr(AthourSay.Text) + "',KeyWord='" + hkdb.GetStr(KeyWord.Text) + "',QxYdUsername='" + hkdb.GetStr(UserID.Text) + "',QxYdRealname='" + hkdb.GetStr(UserName.Text) + "'  where id='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

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
                mydb.Alert_Refresh_Close("保存成功！", "wdzs.aspx?LittleId=" + Request.QueryString["LittleId"] + "");
            }
        }

        protected void SANZJ_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteScalar("Update OA_KnowLedge  Set BigId='" + BigName.SelectedValue + "',BigName='" + BigName.SelectedItem + "',LittleId='" + LittleName.SelectedValue + "',LittleName='" + LittleName.SelectedItem + "',Title='" + hkdb.GetStr(TitleName.Text) + "',Content='" + hkdb.GetStr(Content.Text) + "',AthourSay='" + hkdb.GetStr(AthourSay.Text) + "',KeyWord='" + hkdb.GetStr(KeyWord.Text) + "',QxYdUsername='" + hkdb.GetStr(UserID.Text) + "',QxYdRealname='" + hkdb.GetStr(UserName.Text) + "'  where id='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

            Response.Redirect("wdzs_manage.aspx?Number=" + Number.Text + "&LittleId=" + Request.QueryString["LittleId"] + "");
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
