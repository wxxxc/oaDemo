using System;
using haoke365;
using System.Data;

namespace hkpro.app.portal
{
    public partial class Msg_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                BindAttr();
                DropDownListBind();
            }
            
        }

        public void BindAttr()
        {
            jsr.Attributes.Add("readonly", "readonly");
        }

        protected void Send_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(jsr.Text))
            {
                lblMsg.Text = "请选择接收人！";
                return;
            }

            if (string.IsNullOrEmpty(fsnr.Text))
            {
                lblMsg.Text = "请输入消息内容！";
                return;
            }
            var jsr1 = hkdb.GetStr(jsr_real.Text);

            SqlHelper.ExecuteSql("exec sp_Send_Mess 1,0,'" + this.Session["userid"] + "','" + jsr1 + "','" + fsnr.Text + "'");

            jsr1 = "";
            fsnr.Text = "";

            lblMsg.Text = "发送成功！";
        }
        #region 收件人


        //dp绑定 
        public void DropDownListBind()
        {           
            bd.Bind_DropDownList_bm(bm, "", "全部部门", "");
        }
        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            ListViewBind();
        }

        //gv绑定 
        public void ListViewBind()
        {
            string Str1 = " WHERE UI_STATUS='正常' AND UI_LX='企业'";

            if (!string.IsNullOrEmpty(bm.SelectedValue))
            {
                Str1 = Str1 + " AND UI_SSBM='" + bm.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(cxtj.Text))
            {
                Str1 = Str1 + " AND (UI_ID LIKE '%" + hkdb.GetStr(cxtj.Text) + "%' OR UI_DESC LIKE '%" + hkdb.GetStr(cxtj.Text) + "%')";
            }



            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from yh" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT A.UI_ID,A.UI_DESC  AS UI_DESC,'部门:'+B.BM_MC AS BM_MC,'职位:'+C.ZWMC AS ZWMC FROM YH A LEFT OUTER JOIN BM B ON(A.UI_SSBM=B.BM_ID) LEFT OUTER JOIN ZW C ON(A.UI_ZW=C.ZWID)" + Str1, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            ListView1.DataSource = ds;
            ListView1.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            ListViewBind();
        }

        #endregion
    }
}
