using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.rwgl
{
    public partial class dbrwcx : System.Web.UI.Page
    {
        public mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10306", "10306");

                DropDownListBind();

                //AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                fbbm.SelectedValue = this.Session["deptid"].ToString();
                txtSdate.Text = System.DateTime.Now.AddDays(-30).ToString("yyyy-MM-dd");
                //txtSdate.Text = Request.Cookies["haoke"].Values["sdate"].ToString();
                txtEdate.Text = System.DateTime.Now.AddDays(0).ToString("yyyy-MM-dd");

                DropDownListBind_rysq();

                GridViewBind();
            }
        }

        //任务性质 
        public void DropDownListBind()
        {
            string sql_rwxz = "select id,mc FROM hk_ZDYLX where fl='o10' and zt<>'删除'";
            bd.Bind_DropDownList(rwxz, sql_rwxz, "id", "mc", "", "全部");
            bd.Bind_DropDownList_bm(fbbm, "", "", "");
        }

        //人员申请 
        public void DropDownListBind_rysq()
        {
            string sql_rysq = "select ui_id,ui_desc+'('+b.zwmc+')' as ui_desc from yh a left outer JOIN ZW b on (a.ui_zw=b.zwid) where ui_status='正常' and ui_ssbm='" + fbbm.SelectedValue + "' order by ui_desc";
            bd.Bind_DropDownList(rysq, sql_rysq, "ui_id", "ui_desc", "", "");
        }

        public void GridViewBind()
        {
            if (!string.IsNullOrEmpty(txtEdate.Text) & !string.IsNullOrEmpty(txtSdate.Text))
            {
                string str1 = null;
                System.DateTime sdateStr = Convert.ToDateTime(txtSdate.Text);
                System.DateTime edateStr = Convert.ToDateTime(txtEdate.Text);

                str1 = " where rwzt<>'录入' and fbsj>='" + sdateStr + "' and fbsj<='" + edateStr + "'";

                if (!string.IsNullOrEmpty(fbbm.SelectedValue))
                {
                    str1 = str1 + " and b.ui_ssbm='" + fbbm.SelectedValue + "'";
                }

                if (!string.IsNullOrEmpty(rysq.SelectedValue))
                {
                    str1 = str1 + " and fbr='" + rysq.SelectedValue + "'";
                }
                if (!string.IsNullOrEmpty(rwbt.Text))
                {
                    str1 = str1 + " and rwbt like '%" + hkdb.GetStr(rwbt.Text) + "%'";
                }
                if (!string.IsNullOrEmpty(rwnr.Text))
                {
                    str1 = str1 + " and rwnr like '%" + hkdb.GetStr(rwnr.Text) + "%'";
                }
                if (!string.IsNullOrEmpty(rwdh.Text))
                {
                    str1 = str1 + " and rwdh like '%" + hkdb.GetStr(rwdh.Text) + "%'";
                }
                if (!string.IsNullOrEmpty(jjcd.SelectedValue))
                {
                    str1 = str1 + " and jjcd='" + jjcd.SelectedValue + "'";
                }
                if (!string.IsNullOrEmpty(rwxz.SelectedValue))
                {
                    str1 = str1 + " and rwxz='" + rwxz.SelectedValue + "'";
                }
                if (!string.IsNullOrEmpty(rwzt.SelectedValue))
                {
                    str1 = str1 + " and rwzt='" + rwzt.SelectedValue + "'";
                }
                if (!string.IsNullOrEmpty(fblx.SelectedValue))
                {
                    str1 = str1 + " and fblx='" + fblx.SelectedValue + "'";
                }
                if (xsrw.Checked == true)
                {
                    str1 = str1 + " and ynxs='是'";
                }

                //显示下级人员的任务？
                if (xjrw.Checked == true)
                {
                    string xjrwstr = this.Session["userid"].ToString();
                    SqlDataReader dr = SqlHelper.ExecuteReader("select bm_id FROM BM where bm_sjbm='" + this.Session["deptid"] + "'");
                    while (dr.Read())
                    {
                        SqlDataReader dr2 = SqlHelper.ExecuteReader("select ui_id from yh where ui_ssbm='" + dr["bm_id"].ToString() + "'");
                        while (dr2.Read())
                        {
                            xjrwstr = xjrwstr + "','" + dr2["ui_id"].ToString();
                        }
                        dr2.Close();
                    }
                    dr.Close();

                    str1 = str1 + " and fbr in ('" + xjrwstr + "')";
                }
                else
                {
                    str1 = str1 + " and fbr='" + this.Session["userid"] + "'";
                }

                AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_RWD01 a left outer join yh b on(a.fbr=b.ui_id) " + str1 + "");
                DataSet ds = SqlHelper.ExecuteDs("select '按用户' as fblxmc,source,(select y.ui_desc+'等' from yh y where ui_id=(select SUBSTRING(convert(varchar(500), z.jsdx)+',',1,CHARINDEX(',',convert(varchar(500), z.jsdx)+',')-1) from OA_RWD01 z  where fblx='3' and a.rwid=z.rwid))as jsdxmc,a.*,(case when a.jjcd='高' then '高' when a.jjcd='中' then '中' else '低' end)as jjcd2,(case when a.ynxs='是' then 'ch' else 'noch' end)as ynxs2,case when( fjmc=''or fjmc is null) then null else 'y' end as fjmc2,b.ui_desc,c.mc from OA_RWD01 a left outer join yh b on (a.fbr=b.ui_id) left outer JOIN hk_ZDYLX c on (a.rwxz=c.id) " + str1 + " order by fbsj desc", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
                GridView1.DataSource = ds;
                GridView1.DataBind();

                //打印
                if (AspNetPager1.RecordCount == 0)
                {
                    PrnBtn.Attributes.Add("onclick", "");
                }
                else
                {
                    PrnBtn.Attributes.Add("onclick", "Javascript:popPrn('dbrwcx_prn.aspx?&i1=" + sdateStr + "&i2=" + edateStr + "&i3=" + rysq.SelectedValue + "&i4=" + rwbt.Text + "&i5=" + rwnr.Text + "&i6=" + rwdh.Text + "&i7=" + jjcd.SelectedValue + "&i8=" + rwxz.SelectedValue + "&i9=" + rwzt.SelectedValue + "&i10=" + fblx.SelectedValue + "&i11=" + xsrw.Checked + "&i12=" + xjrw.Checked + "');");
                }
            }
        }

        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            rysq.SelectedValue = "";
            rwzt.SelectedValue = "";
            rwbt.Text = "";
            rwnr.Text = "";
            rwdh.Text = "";
            rwxz.SelectedValue = "";
            jjcd.SelectedValue = "";
            fblx.SelectedValue = "";
            xsrw.Checked = false;
            xjrw.Checked = false;
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
                string rwzt = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "rwzt")).Trim();

                if (rwzt == "已暂停")
                {
                    e.Row.ForeColor = Color.Red;
                }

                if (rwzt == "已完成")
                {
                    e.Row.ForeColor = Color.Green;
                }

                if (rwzt == "已关闭")
                {
                    e.Row.ForeColor = Color.FromArgb(92,26,140);
                }
            }
        }
    }
}
