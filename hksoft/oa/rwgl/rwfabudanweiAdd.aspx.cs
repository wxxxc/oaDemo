using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hksoft.oa.rwgl
{
    public partial class rwfabudanweiAdd : System.Web.UI.Page
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
            }
        } 
        
       

        protected void Save_Click(object sender, EventArgs e)
        {
           
            //编码判断（重复）
            if (bd.CheckRepeat("SELECT id FROM OA_Rwfbdw WHERE num='" + hkdb.GetStr(num.Text) + "'") == "true")
            {
                mydb.Alert("保存失败，该序号已存在！");
                return;
            }
            
            //名称判断（重复）
            if (bd.CheckRepeat("SELECT id FROM OA_Rwfbdw WHERE name='" + hkdb.GetStr(name.Text) +"'") == "true")
            {
                mydb.Alert("保存失败，该单位已存在！");
                return;
            }
            
           
            //SqlHelper.ExecuteSql("INSERT INTO hk_MySet(FK_uid,ynRemind,RemindTime,RemindMode,RemindSound,Mail_Qc,Mail_Smtp,Mail_Dlyh,Mail_Dlmm,Mail_Port,Mail_Fsr,PageCount) VALUES('" + hkdb.GetStr(yhbm.Text) + "','是','60000','否','1.swf','ok8209@sohu.com','smtp.sohu.com','ok8209','haokee3000','25','系统管理员',15)");

            SqlHelper.ExecuteSql("INSERT INTO OA_Rwfbdw (num,name,address,tel,charge) VALUES('" + hkdb.GetStr(num.Text) + "','" + hkdb.GetStr(name.Text) + "','" + hkdb.GetStr(address.Text) + "','" + hkdb.GetStr(tel.Text) + "','" + hkdb.GetStr(charge.Text) + "')");

          
            //日志
            mydb.InsertLog("新增任务发布单位【" + name.Text + "】", "13802");

            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "rwfabudanwei.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！", "rwfabudanwei.aspx");
            }
        }

        //清空 
        protected void Clear_Click()
        {
            num.Text = "";
            name.Text = "";
            charge.Text = "";
            address.Text = "";
            tel.Text = "";
        }
    }
    
}