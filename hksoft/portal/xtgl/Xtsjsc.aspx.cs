using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.xtgl
{
    public partial class Xtsjsc : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("60113", "60113");

                DropDownListBind();

                GridViewBind();
            }
        }

        //dp绑定 
        public void DropDownListBind()
        {
            string sql = "SELECT produid,produname FROM hk_init WHERE produid NOT IN('S','X') ORDER BY InitType";
            bd.Bind_DropDownList(xt, sql, "produid", "produname", "", "");
        }

        //查询 
        protected void Query_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            DataSet ds = SqlHelper.ExecuteDs("SELECT DISTINCT SourceClass,SourceDesc FROM hk_DBSource WHERE ProduID='" + xt.SelectedValue + "' AND ynDel='Y' AND SourceName NOT IN ('JS','QY','QX','MD','MD_LC','MD_SP','YH','YH_JS','hk_AttUpload','hk_MyDesk','hk_MySet','hk_DLRZ','hk_SystemLog')ORDER BY SourceClass,SourceDesc");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            if (superpwd.Text != "Aa123456")
            {
                mydb.Alert("密钥错误！");
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
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT SourceName FROM hk_DBSource WHERE ProduID='" + xt.SelectedValue + "' AND SourceDesc IN ('" + cal + "')");
                while (dr.Read())
                {
                    SqlHelper.ExecuteSql("TRUNCATE TABLE " + dr["SourceName"] + "");
                }
                dr.Close();

                mydb.Alert("系统数据删除完成！");

                //日志 
                mydb.InsertLog("批量删除系统数据【" + hkdb.GetStrClr(cal) + "】", "60113");

                GridViewBind();
            }
            else
            {
                mydb.Alert("删除失败,请先选中记录！");
            }
        }
    }
}
