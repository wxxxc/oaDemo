using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.kjfs
{
    public partial class Kjfstb : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        string picpath = System.Web.HttpContext.Current.Server.MapPath("..\\..\\");
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("60106", "60106");

                panel2.Visible = false;
                @add.Text = "增 加";
            }

            //绑定数据 
            GridViewBind();
        }

        public void GridViewBind()
        {
            SqlDataSource1.SelectCommand = "";
            SqlDataSource1.SelectCommand = "SELECT * FROM HK_KJTB ORDER BY TBMC";
            SqlDataSource1.DeleteCommand = "";
            SqlDataSource1.DeleteCommand = "DELETE FROM HK_KJTB WHERE tbid=@tbid";
            SqlDataSource1.UpdateCommand = "";
            SqlDataSource1.UpdateCommand = "UPDATE HK_KJTB SET tbmc=@tbmc WHERE tbid=@tbid";
        }

        protected void ChangeType(object sender, EventArgs e)
        {
            GridViewBind();
        }

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            if (@add.Text == "保 存")
            {
                if (!string.IsNullOrEmpty(fj.PostedFile.FileName.Trim()))
                {
                    string fjtype1 = fj.PostedFile.FileName.Substring((fj.PostedFile.FileName.LastIndexOf(".") + 1));
                    if (fjtype1 == "gif" | fjtype1 == "GIF" | fjtype1 == "Gif" | fjtype1 == "jpg" | fjtype1 == "JPG" | fjtype1 == "Jpg")
                    {
                        string FileName = System.IO.Path.GetFileName(fj.PostedFile.FileName);
                        fj.PostedFile.SaveAs(picpath + ("attach\\portal\\quick\\") + FileName);

                        SqlHelper.ExecuteSql("INSERT INTO HK_KJTB (TBMC,TBZT,TBLJ) VALUES('" + hkdb.GetStr(name.Text) + "','正常','" + FileName + "')");
                        name.Text = "";
                    }
                    else
                    {
                        mydb.Alert("请选择扩展名为.gif或.jpg格式的图片文件，推荐图片尺寸50*50px（像素）！");
                        return;
                    }
                }
                else
                {
                    mydb.Alert("请选择图片路径！");
                    return;
                }

                GridViewBind();
            }
            else
            {
                panel2.Visible = true;
                @add.Text = "保 存";
            }
        }

        //禁用 
        protected void Stop_Click(object sender, EventArgs e)
        {
            int i = 0;
            string Str1 = "";
            System.Web.UI.WebControls.CheckBox chk = default(System.Web.UI.WebControls.CheckBox);
            System.Web.UI.WebControls.Label Lab = default(System.Web.UI.WebControls.Label);
            i = 0;
            foreach (GridViewRow oDataGridItem in GridView1.Rows)
            {
                chk = (CheckBox)oDataGridItem.FindControl("chk");
                if (chk.Checked)
                {
                    i = 1;
                    Lab = (Label)oDataGridItem.FindControl("dp_id");
                    if (string.IsNullOrEmpty(Str1))
                    {
                        Str1 = ((Label)oDataGridItem.FindControl("dp_id")).Text;
                    }
                    else
                    {
                        Str1 = Str1 + "','" + Lab.Text.Trim();
                    }
                }
            }
            if (i == 0)
            {
                mydb.Alert("操作失败,请先选中记录！");
                return;
            }
            else
            {
                SqlHelper.ExecuteSql("UPDATE HK_KJTB SET TBZT='禁用' WHERE TBID IN('" + Str1 + "')");
                GridViewBind();
            }
        }

        //启用
        protected void Pass_Click(object sender, EventArgs e)
        {
            int i = 0;
            string Str1 = "";
            System.Web.UI.WebControls.CheckBox chk = default(System.Web.UI.WebControls.CheckBox);
            System.Web.UI.WebControls.Label Lab = default(System.Web.UI.WebControls.Label);
            i = 0;

            foreach (GridViewRow oDataGridItem in GridView1.Rows)
            {
                chk = (CheckBox)oDataGridItem.FindControl("chk");
                if (chk.Checked)
                {
                    i = 1;
                    Lab = (Label)oDataGridItem.FindControl("dp_id");
                    if (string.IsNullOrEmpty(Str1))
                    {
                        Str1 = ((Label)oDataGridItem.FindControl("dp_id")).Text;
                    }
                    else
                    {
                        Str1 = Str1 + "','" + Lab.Text.Trim();
                    }
                }
            }
            if (i == 0)
            {
                mydb.Alert("操作失败,请先选中记录！");
                return;
            }
            else
            {
                SqlHelper.ExecuteSql("UPDATE HK_KJTB SET TBZT='正常' WHERE TBID IN('" + Str1 + "')");
                GridViewBind();
            }
        }

        //选中行变色 
        protected void Item_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}
