using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zygl
{
    public partial class Clsq_Mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {

            hkdb.VeriSess("4");
            BindData bd = new BindData();

            if (!IsPostBack)
            {
                hkdb.PassTo("10108", "0");

                DropDownListBind();

                SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_CLSQ where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (datar.Read())
                {
                    if (datar["zt"].ToString() == "已同意")
                    {
                        Panel1.Visible = true;
                        Panel2.Visible = false;
                    }
                    if (datar["zt"].ToString() == "已归还")
                    {
                        Panel1.Visible = true;
                        Panel2.Visible = true;
                    }
                    if (datar["zt"].ToString() == "已拒绝")
                    {
                        Panel1.Visible = true;
                        Panel2.Visible = false;
                    }
                    if (datar["zt"].ToString() == "审批中")
                    {
                        Panel1.Visible = false;
                        Panel2.Visible = false;
                    }
                    sqbm.SelectedValue = datar["sqbm"].ToString();
                    ccxs.SelectedValue = datar["ccxs"].ToString();
                    fcdd.Text = datar["fcdd"].ToString();
                    dddd.Text = datar["dddd"].ToString();
                    czrs.Text = datar["czrs"].ToString();
                    ccsy.Text = datar["ccsy"].ToString();
                    xycl.SelectedValue = datar["xycl"].ToString();
                    jsy.SelectedValue = datar["jsy"].ToString();
                    bz.Text = datar["bz"].ToString();
                    xssj_s.Text = string.Format("{0:d}", datar["xssj_s"]);
                    sxs.SelectedValue = string.Format("{0:HH}", datar["xssj_s"]);
                    sfz.SelectedValue = string.Format("{0:mm}", datar["xssj_s"]);
                    xssj_e.Text = string.Format("{0:d}", datar["xssj_e"]);
                    exs.SelectedValue = string.Format("{0:HH}", datar["xssj_e"]);
                    efz.SelectedValue = string.Format("{0:mm}", datar["xssj_e"]);
                    spyj.Text = datar["spyj"].ToString();
                    ghsm.Text = datar["ghsm"].ToString();

                }
                else
                {
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
                datar.Close();
            }
        }

        //dp绑定 
        public void DropDownListBind()
        {
            string sql_xycl = "select id,clmc from oa_clda";
            bd.Bind_DropDownList(xycl, sql_xycl, "id", "clmc", "", "");

            string sql_jsy = "select xm,id from OA_JSYDA order by id";
            bd.Bind_DropDownList(jsy, sql_jsy, "id", "xm", "", "");

            bd.Bind_DropDownList_bm(sqbm, "", "", "");
        }

    }
}
