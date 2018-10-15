using System;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.jhgl
{
    public partial class Bmjh_Gzx_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10202", "0");

                BindAttr();

                SqlDataReader dr = SqlHelper.ExecuteReader("select gzzt,gznr,jhkssj,jhwcsj,yqjg,sjwcsj,sjwcqk,cyz from oa_gzjh02 where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (dr.Read())
                {
                    gzzt.Text = dr["gzzt"].ToString();
                    gznr.Text = dr["gznr"].ToString();
                    jhkssj.Text = string.Format("{0:d}", dr["jhkssj"]);
                    jhwcsj.Text = string.Format("{0:d}", dr["jhwcsj"]);
                    yqjg.Text = dr["yqjg"].ToString();
                    sjwcsj.Text = dr["sjwcsj"].ToString();
                    sjwcjg.Text = dr["sjwcqk"].ToString();
                    //参与者 
                    UserID.Text = dr["cyz"].ToString();
                    if (!string.IsNullOrEmpty(UserID.Text))
                    {
                        UserName.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + dr["cyz"].ToString() + "','1'"));
                    }
                    dr.Close();

                    switch (Request.QueryString["i"])
                    {
                        case "shz":
                            SaveBtn.Visible = false;
                            break;
                        case "pjz":
                            SaveBtn.Visible = false;
                            SavePjBtn.Visible = true;
                            sjwc.Visible = true;
                            break;
                        case "wc":
                            sjwc.Visible = true;
                            SaveBtn.Visible = false;
                            break;
                    }
                }
                else
                {
                    dr.Close();
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("update OA_GZJH02 set gzzt='" + hkdb.GetStr(gzzt.Text) + "',gznr='" + hkdb.GetStr(gznr.Text) + "',jhkssj='" + hkdb.GetStr(jhkssj.Text) + "',jhwcsj='" + hkdb.GetStr(jhwcsj.Text) + "',yqjg='" + hkdb.GetStr(yqjg.Text) + "',cyz='" + UserID.Text.TrimEnd(',') + "' where id='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            if (Request.QueryString["type"].ToString() == "m")//修改页面
            {
                mydb.Alert_Refresh_Close("保存成功！", "bmjhzd_mod.aspx?id=" + Request.QueryString["jhid"] + "");
            }
            else//新增页面过来
            {
                mydb.Alert_Refresh_Close("保存成功！", "bmjhzd_add.aspx?id=" + Request.QueryString["jhid"] + "");
            }
        }

        protected void SavePj_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("update OA_GZJH02 set sjwcsj='" + hkdb.GetStr(sjwcsj.Text) + "',sjwcqk='" + hkdb.GetStr(sjwcjg.Text) + "' where id='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

            if (Request.QueryString["type"].ToString() == "m")//修改页面
            {
                mydb.Alert_Refresh_Close("保存成功！", "bmjhzd_mod.aspx?id=" + Request.QueryString["jhid"] + "");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！", "bmjhzd_add.aspx?id=" + Request.QueryString["jhid"] + "");
            }
        }
    }
}