using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.wpgl
{
    public partial class Folder_R : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10109", "0");

                //dp绑定 
                DropDownListBind();

                if (!string.IsNullOrEmpty(Request.QueryString["classid"]))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HK_NETDISK_DIR WHERE DIRID='" + hkdb.GetStr(Request.QueryString["classid"].ToString()) + "' AND USERID='" + this.Session["userid"] + "'");
                    if (datar.Read())
                    {
                        mlid.Text = datar["DirID"].ToString();
                        mlmc.Text = datar["Name"].ToString();
                        DirList.SelectedValue = datar["ParentID"].ToString();
                        if (datar["Share"].ToString() == "是")
                        {
                            share.Checked = true;
                        }
                        else
                        {
                            share.Checked = false;
                        }

                        //if (datar["ParentID"].ToString() == "0")
                        //{
                        //    DirList.Enabled = false;
                        //}
                        //else
                        //{
                        //    DirList.Enabled = true;
                        //}
                        datar.Close();

                        SaveBtn.Enabled = true;
                        DelBtn.Enabled = true;
                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert("该文件夹不存在，可能已被删除！");
                    }
                }

                //判断状态 
                if (Request.QueryString["k"] == "nex")
                {
                    lblsta.Text = "-> 新增状态";
                    SaveBtn.Enabled = true;
                    DelBtn.Enabled = true;
                }
            }
        }

        public void DropDownListBind()
        {
            DirList.Items.Clear();

            bd.Bind_DropDownList_disk(DirList, "0", "");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "AddBtn")
            {
                mlid.Text = "";
                mlmc.Text = "";
                DirList.SelectedValue = "0";
                share.Checked = false;
                lblsta.Text = "-> 新增状态";

                SaveBtn.Enabled = true;
                DelBtn.Enabled = true;
            }
            else
            {
                string qstr = hkdb.GetValueChk_Str(share.Checked);
 
                if (lblsta.Text == "-> 修改状态")
                {
                    SqlHelper.ExecuteSql("UPDATE HK_NETDISK_DIR SET NAME='" + hkdb.GetStr(mlmc.Text) + "',ParentID=" + DirList.SelectedValue + ",Share='" + qstr + "' WHERE DirID='" + Request.QueryString["classid"].ToString() + "'");
                    mydb.Alert("保存成功！");
                    Response.Write("<script language=javascript>");
                    Response.Write("window.parent.lframe10109.location='folder_l.aspx';<");
                    Response.Write("/script>");
                }
                else
                {
                    //先插入记录 
                    SqlHelper.ExecuteSql("INSERT INTO HK_NETDISK_DIR(NAME,PARENTID,USERID,CREATEDATE,SHARE) VALUES('" + hkdb.GetStr(mlmc.Text) + "','" + DirList.SelectedValue + "','" + this.Session["userid"] + "',GETDATE(),'" + qstr + "')");

                    mydb.Alert("保存成功！");
                    mlid.Text = "";
                    mlmc.Text = "";
                    //sjml.SelectedValue = "" 
                    share.Checked = false;
                    Response.Write("<script language=javascript>");
                    Response.Write("window.parent.lframe10109.location='folder_l.aspx';");
                    Response.Write("window.parent.rframe10109.location='folder_r.aspx?k=nex';<");
                    Response.Write("/script>");
                }
            }
        }

        protected void Del_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM HK_NETDISK_DIR WHERE ParentID='" + hkdb.GetStr(mlid.Text) + "'";
            if (bd.CheckRepeat(sql) == "true")
            {
                mydb.Alert("删除失败，该文件夹下存在子文件夹！");
                return;
            }

            SqlHelper.ExecuteSql("DELETE FROM HK_NETDISK_DIR WHERE DirID = '" + hkdb.GetStr(mlid.Text) + "'");

            mydb.Alert_Close("删除成功！");
            //刷新 
            Response.Write("<script language=javascript>");
            Response.Write("window.parent.lframe10109.location='folder_l.aspx';<");
            Response.Write("/script>");

            mlid.Text = "";
            mlmc.Text = "";
            share.Checked = false;
            DropDownListBind();
            DirList.SelectedValue = "0";

            SaveBtn.Enabled = false;
            DelBtn.Enabled = false;
        }

        //返回
        protected void ReturnBtn_Click(object sender, EventArgs e)
        {
            Response.Write("<script language=javascript>");
            Response.Write("window.parent.location='ShowDisk.aspx';<");
            Response.Write("/script>");
        }
    }
}
