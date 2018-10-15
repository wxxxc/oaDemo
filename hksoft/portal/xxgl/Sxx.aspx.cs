using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.xxgl
{
    public partial class Sxx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                string a = null, b = null;

                if (this.Session["systype"].ToString() == "G")
                {
                    a = "1001"; 
                }
                else
                {
                    a = "10101";
                }

                //判断是否是从“已发送邮件、写邮件”页面返回
                if (Request.QueryString["i"] != "2")
                {
                    b = a;
                }
                else
                {
                    b = "0";
                }

                hkdb.PassTo("10101,1001", b);

                AspNetPager1.PageSize = int.Parse(Request.Cookies["haoke"].Values["pagecount"]);

                GridViewBind();
            }
        }

        //刷新
        protected void Receive_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //收消息 
        public void GridViewBind()
        {
            string str1 = " WHERE JSR='" + this.Session["userid"] + "'";
            switch (jsfa.SelectedValue)
            {
                case "0":
                    str1 = str1 + " AND ZT='0'";
                    break;
                case "1":
                    str1 = str1 + " AND ZT='1'";
                    break;
            }

            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) AS NUMS FROM hk_Mess_JS" + str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.ID,A.ZT,B.NR,B.FSR,B.FSSJ,C.UI_DESC FROM HK_MESS_JS A LEFT OUTER JOIN HK_MESS_FS B ON (A.ID=B.ID) LEFT OUTER JOIN YH C ON (B.FSR=C.UI_ID) " + str1 + " ORDER BY FSSJ DESC", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
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
                CheckBox chk = (CheckBox)e.Row.FindControl("del");
                e.Row.Attributes["ondblclick"] = chk.ClientID + ".checked=true";
            }
        }

        //标记为已读 
        protected void Read_Click(object sender, EventArgs e)
        {
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
                SqlHelper.ExecuteSql("UPDATE HK_MESS_JS SET ZT='1' WHERE JSR='" + this.Session["userid"] + "' AND ID IN('" + cal + "')");
                GridViewBind();
            }
            else
            {
                mydb.Alert("请先勾选消息，再标记已读！");   //弹出提示信息
            }
        }
    }
}
