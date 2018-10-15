using haoke365;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hksoft.hr.jxkh
{
    public partial class Jxkhgz_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");
            if (!IsPostBack)
            {
                //模块权限
                hkdb.PassTo("81112", "0");
                //操作权限
                OperQx();
                string Sql = "select HR_Jxkhgz.contens from HR_Jxkhgz ";
                //editor.Value = SqlHelper.ExecuteScalar(Sql).ToString();
                editor.Value = Convert.ToString(SqlHelper.ExecuteScalar(Sql));
            }
        }
        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(upbtn, "81112m", Session["roleqx"].ToString());
        }
        //修改
        protected void update_click(object sender, EventArgs e)
        {
            //SqlHelper.ExecuteScalar("update HR_Jxkhgz set contens = '" + hkdb.GetStr(editor.Value) + "' where id = 1");
            SqlHelper.ExecuteScalar("update HR_Jxkhgz set contens = '" + editor.Value + "' where id = 1");
            mydb.Alert("修改成功！");
        }
    }
}