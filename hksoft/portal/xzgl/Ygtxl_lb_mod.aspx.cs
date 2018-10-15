using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Ygtxl_lb_mod : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public string LineW, QxString, QxStringSta, LineWSta;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11310", "0");

                string sql_down_bh = "select id,Linew+name as aaa from hk_Ygtxl_lb order by QxString asc";
                bd.Bind_DropDownList(ParentNodesID, sql_down_bh, "id", "aaa", "0", "根节点");

                SqlDataReader dr_sta = SqlHelper.ExecuteReader("select * from hk_Ygtxl_lb where id='" + Request.QueryString["id"] + "'");
                if (dr_sta.Read())
                {
                    Name.Text = dr_sta["Name"].ToString();
                    PxNum.Text = dr_sta["PxNum"].ToString();
                    ParentNodesID.SelectedValue = dr_sta["ParentNodesID"].ToString();
                }
                dr_sta.Close();

                BindAttr();
            }
        }

        public void BindAttr()
        {
            Button1.Attributes["onclick"] = "javascript:return chknull();";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("Update hk_Ygtxl_lb Set Name='" + hkdb.GetStr(Name.Text) + "',PxNum='" + hkdb.GetStr(PxNum.Text) + "' where id='" + int.Parse(Request.QueryString["id"]) + "'  ");

            SqlHelper.ExecuteSql("Update hk_Ygtxl Set FoldersName='" + hkdb.GetStr(Name.Text) + "' where FoldersID='" + int.Parse(Request.QueryString["id"]) + "' ");

            mydb.InsertLog("修改部门名称[" + Name.Text + "]", "11310");

            this.Response.Write("<script language=javascript>alert('提交成功！'); window.parent.lhead.location='Ygtxl_l.aspx';window.location.href='Ygtxl_r.aspx'</script>");
        }
    }
}