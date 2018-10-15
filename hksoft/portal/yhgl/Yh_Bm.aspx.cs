using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hksoft.portal.yhgl
{
    public partial class Yh_Bm : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public int ListType = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session判断
            hkdb.VeriSess("4");

            //显示标签
            if ((Request["ListType"] != null))
            {
                ListType = Int32.Parse(Request["ListType"].ToString());
            }
            else
            {
                ListType = 1;
            }

            if (!IsPostBack)
            {
                //模块权限
                hkdb.PassTo("60305", "0");

                lblyh.Text = SqlHelper.ExecuteScalar("SELECT UI_DESC FROM YH WHERE UI_ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'").ToString();

                //页面绑定 
                GridViewBind();
            }
        }

        //数据绑定 
        public void GridViewBind()
        {
            if (ListType == 1)
            {
                string Str1 = " WHERE BM_ID IN(SELECT SSBMID FROM YH_BM WHERE UI_ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "')";
                DataSet ds = SqlHelper.ExecuteDs("SELECT BM_ID,BM_BM,dLine+BM_MC AS BM_MC,BM_BZ FROM BM " + Str1 + " ORDER BY dQxStr");
                GridView1.DataSource = ds;
            }
            else
            {
                DelBm.Visible = false;
                AddBm.Visible = true;
                string Str1 = " WHERE BM_ID NOT IN(SELECT SSBMID FROM YH_BM WHERE UI_ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "') AND BM_ID<>(SELECT UI_SSBM FROM YH WHERE UI_ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "')";
                DataSet ds = SqlHelper.ExecuteDs("SELECT BM_ID,BM_BM,dLine+BM_MC AS BM_MC,BM_BZ FROM BM " + Str1 + " ORDER BY dQxStr");
                GridView1.DataSource = ds;
            }

            GridView1.DataBind();
        }

        //删除附加部门
        protected void DelBm_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            string cal = "";
            int i = 0;
            for (i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Rows[i].Cells[1].FindControl("del");
                if (cb.Checked == true)
                {
                    if (string.IsNullOrEmpty(cal))
                    {
                        cal = GridView1.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        cal = cal + "','" + GridView1.DataKeys[i].Value.ToString();
                    }
                }
            }
            if (!string.IsNullOrEmpty(cal))
            {
                SqlHelper.ExecuteSql("DELETE FROM YH_BM WHERE UI_ID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' AND SSBMID IN('" + cal + "')");
                mydb.Alert_Refresh("删除完成！", "yh.aspx");
                GridViewBind();
            }
            else
            {
                mydb.Alert("删除失败,请先选中记录！");
            }
        }

        //添加附加部门 
        protected void AddBm_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            string cal = "";
            int i = 0;
            for (i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Rows[i].Cells[1].FindControl("del");
                if (cb.Checked == true)
                {
                    if (string.IsNullOrEmpty(cal))
                    {
                        cal = GridView1.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        cal = cal + "','" + GridView1.DataKeys[i].Value.ToString();
                    }
                }
            }
            if (!string.IsNullOrEmpty(cal))
            {
                SqlHelper.ExecuteSql("INSERT INTO YH_BM(UI_ID,SSBMID) SELECT '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "',BM_ID FROM BM WHERE BM_ID IN('" + cal + "')");
                mydb.Alert_Refresh("添加完成！", "yh.aspx");
                GridViewBind();
            }
            else
            {
                mydb.Alert("添加失败,请先选中记录！");
            }
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if ((e.Row.RowType == DataControlRowType.DataRow))
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }

        //图片变换 
        public string GetSelectImage(string NormalImg, string SelectedImg, int selected, int position)
        {
            if (selected == position)
            {
                return SelectedImg;
            }
            else
            {
                return NormalImg;
            }
        }

        //已选部门
        protected void YX_Click(object sender, System.EventArgs e)
        {
            Server.Transfer("YH_BM.aspx?id=" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "&ListType=1");
        }

        //待选部门 
        protected void DX_Click(object sender, System.EventArgs e)
        {
            Server.Transfer("YH_BM.aspx?id=" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "&ListType=2");
        }
    }
}