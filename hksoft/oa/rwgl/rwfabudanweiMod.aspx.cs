using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;
using System.Data.SqlClient;

namespace hksoft.oa.rwgl
{
    public partial class rwfabudanweiMod : System.Web.UI.Page
    {

        mydb hkdb = new mydb();
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session判断
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                //模块权限
                hkdb.PassTo("13802", "0");
                
           
                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM OA_Rwfbdw WHERE id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        num.Text = datar["num"].ToString();
                        name.Text = datar["name"].ToString();
                        address.Text = datar["address"].ToString();
                        charge.Text = datar["charge"].ToString();
                        tel.Text = datar["tel"].ToString();
                        datar.Close();

                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert_Close("该记录不存在，可能已被删除！");
                    }
                }
            }
        }

        //操作权限
      
        protected void Save_Click(object sender, EventArgs e)
        {

            //编码判断（重复）
            if (bd.CheckRepeat("SELECT id FROM OA_Rwfbdw WHERE num='" + hkdb.GetStr(num.Text) + "' and id!='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'") == "true")
            {
                mydb.Alert("保存失败，该序号已存在！");
                return;
            }

            //名称判断（重复）
            if (bd.CheckRepeat("SELECT id FROM OA_Rwfbdw WHERE name='" + hkdb.GetStr(name.Text)+ "' and id!='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'") == "true")
            {
                mydb.Alert("保存失败，该单位已存在！");
                return;
            }

            SqlHelper.ExecuteSql("Update OA_Rwfbdw set num='" + hkdb.GetStr(num.Text) + "',name='" + hkdb.GetStr(name.Text) + "',address='" + hkdb.GetStr(address.Text) + "',tel='" + hkdb.GetStr(tel.Text) + "',charge='" + hkdb.GetStr(charge.Text) + "' WHERE id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

             //日志
            mydb.InsertLog("修改任务发布单位【" + hkdb.GetStr(name.Text) + "】", "13802");

            mydb.Alert_Refresh_Close("保存成功！", "rwfabudanwei.aspx");
        }
        protected void Del_Click(object sender, EventArgs e)
        {

            SqlHelper.ExecuteSql("DELETE FROM OA_Rwfbdw WHERE id = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            //日志
             mydb.InsertLog("删除任务发布单位【" + name.Text + "】", "13802");

            mydb.Alert_Refresh_Close("用户已删除！", "rwfabudanwei.aspx");
        }
    }
}