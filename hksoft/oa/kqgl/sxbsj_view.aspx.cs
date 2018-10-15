using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class sxbsj_view : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11729", "0");

                BindAttr();

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KQ_AttenTime where ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        UserName.Text = datar["SyRealname"].ToString();
                        UserID.Text = datar["SyUsername"].ToString();

                        PbType.Text = datar["PbType"].ToString();
                        QyType.SelectedValue = datar["QyType"].ToString();
                        DjType_1.Text = datar["DjType_1"].ToString();
                        DjType_2.Text = datar["DjType_2"].ToString();
                        DjType_3.Text = datar["DjType_3"].ToString();
                        DjType_4.Text = datar["DjType_4"].ToString();
                        DjType_5.Text = datar["DjType_5"].ToString();
                        DjType_6.Text = datar["DjType_6"].ToString();

                        h1.SelectedValue = datar["DjTime_1"].ToString().Substring(0, 2);
                        h2.SelectedValue = datar["DjTime_2"].ToString().Substring(0, 2);
                        h3.SelectedValue = datar["DjTime_3"].ToString().Substring(0, 2);
                        h4.SelectedValue = datar["DjTime_4"].ToString().Substring(0, 2);
                        h5.SelectedValue = datar["DjTime_5"].ToString().Substring(0, 2);
                        h6.SelectedValue = datar["DjTime_6"].ToString().Substring(0, 2);

                        m1.SelectedValue = datar["DjTime_1"].ToString().Substring(3, 2);
                        m2.SelectedValue = datar["DjTime_2"].ToString().Substring(3, 2);
                        m3.SelectedValue = datar["DjTime_3"].ToString().Substring(3, 2);
                        m4.SelectedValue = datar["DjTime_4"].ToString().Substring(3, 2);
                        m5.SelectedValue = datar["DjTime_5"].ToString().Substring(3, 2);
                        m6.SelectedValue = datar["DjTime_6"].ToString().Substring(3, 2);
                        datar.Close();
                    }
                }
                else
                {
                    lbltitle.Text = "新增";
                }
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if ((DjType_1.SelectedValue != "无" && DjType_2.SelectedValue == "无") | (DjType_1.SelectedValue == "无" && DjType_2.SelectedValue != "无"))
            {
                mydb.Alert("保存失败，上午的上下班必须成对维护！");
                return;
            }

            if ((DjType_3.SelectedValue != "无" && DjType_4.SelectedValue == "无") | (DjType_3.SelectedValue == "无" && DjType_4.SelectedValue != "无"))
            {
                mydb.Alert("保存失败，下午的上下班必须成对维护！");
                return;
            }

            if ((DjType_5.SelectedValue != "无" && DjType_6.SelectedValue == "无") | (DjType_5.SelectedValue == "无" && DjType_6.SelectedValue != "无"))
            {
                mydb.Alert("保存失败，晚上的上下班必须成对维护！");
                return;
            }

            if (DjType_1.SelectedValue != "无" && h1.SelectedValue == "00")
            {
                mydb.Alert("保存失败，上午上班的时间必须维护！");
                return;
            }

            if (DjType_2.SelectedValue != "无" && h2.SelectedValue == "00")
            {
                mydb.Alert("保存失败，上午下班的时间必须维护！");
                return;
            }

            if (DjType_3.SelectedValue != "无" && h3.SelectedValue == "00")
            {
                mydb.Alert("保存失败，下午上班的时间必须维护！");
                return;
            }

            if (DjType_4.SelectedValue != "无" && h4.SelectedValue == "00")
            {
                mydb.Alert("保存失败，下午下班的时间必须维护！");
                return;
            }

            if (DjType_5.SelectedValue != "无" && h5.SelectedValue == "00")
            {
                mydb.Alert("保存失败，晚上上班的时间必须维护！");
                return;
            }

            if (DjType_6.SelectedValue != "无" && h6.SelectedValue == "00")
            {
                mydb.Alert("保存失败，晚上下班的时间必须维护！");
                return;
            }

            if (DjType_1.SelectedValue == "免签到" && DjType_2.SelectedValue == "免签退")
            {
                mydb.Alert("保存失败，上午班次不能同时出现【免签到+免签退】！");
                return;
            }

            if (DjType_3.SelectedValue == "免签到" && DjType_4.SelectedValue == "免签退")
            {
                mydb.Alert("保存失败，下午班次不能同时出现【免签到+免签退】！");
                return;
            }

            if (DjType_5.SelectedValue == "免签到" && DjType_6.SelectedValue == "免签退")
            {
                mydb.Alert("保存失败，晚上班次不能同时出现【免签到+免签退】！");
                return;
            }

            if (lbltitle.Text == "新增")
            {
                SqlHelper.ExecuteScalar("insert into OA_KQ_AttenTime values('" + hkdb.GetStr(PbType.Text) + "','" + DjType_1.SelectedValue + "','" + h1.SelectedValue + ":" + m1.SelectedValue + "','" + DjType_2.SelectedValue + "','" + h2.SelectedValue + ":" + m2.SelectedValue + "','" + DjType_3.SelectedValue + "','" + h3.SelectedValue + ":" + m3.SelectedValue + "','" + DjType_4.SelectedValue + "','" + h4.SelectedValue + ":" + m4.SelectedValue + "','" + DjType_5.SelectedValue + "','" + h5.SelectedValue + ":" + m5.SelectedValue + "','" + DjType_6.SelectedValue + "','" + h6.SelectedValue + ":" + m6.SelectedValue + "','" + QyType.SelectedValue + "','" + hkdb.GetStr(UserID.Text) + "','" + hkdb.GetStr(UserName.Text) + "')");
            }
            else
            {
                SqlHelper.ExecuteSql("Update OA_KQ_AttenTime Set SyUsername='" + hkdb.GetStr(UserID.Text) + "', SyRealname='" + hkdb.GetStr(UserName.Text) + "',PbType='" + hkdb.GetStr(PbType.Text) + "',QyType='" + QyType.SelectedValue + "',DjType_1='" + DjType_1.SelectedValue + "',DjType_2='" + DjType_2.SelectedValue + "',DjType_3='" + DjType_3.SelectedValue + "',DjType_4='" + DjType_4.SelectedValue + "',DjType_5='" + DjType_5.SelectedValue + "',DjType_6='" + DjType_6.SelectedValue + "',DjTime_1='" + h1.SelectedValue + ":" + m1.SelectedValue + "',DjTime_2='" + h2.SelectedValue + ":" + m2.SelectedValue + "',DjTime_3='" + h3.SelectedValue + ":" + m3.SelectedValue + "',DjTime_4='" + h4.SelectedValue + ":" + m4.SelectedValue + "',DjTime_5='" + h5.SelectedValue + ":" + m5.SelectedValue + "',DjTime_6='" + h6.SelectedValue + ":" + m6.SelectedValue + "' where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            }

            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "sxbsj.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！", "sxbsj.aspx");
            }
        }
    }
}
