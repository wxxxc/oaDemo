using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Kqsjsc : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11731", "11731");

                BindAttr();
            }
        }

        public void BindAttr()
        {
            UserName1.Attributes.Add("readonly", "readonly");
        }

        //按日期删除
        protected void Del_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            if (string.IsNullOrEmpty(ksrq.Text) | string.IsNullOrEmpty(jsrq.Text))
            {
                mydb.Alert("请先选择考勤日期范围，再执行删除！");
                return;
            }

            SqlHelper.ExecuteSql("DELETE FROM OA_KQXX WHERE KQRQ BETWEEN '" + hkdb.GetStr(ksrq.Text) + "' AND '" + hkdb.GetStr(jsrq.Text) + "'");

            ksrq.Text = "";
            jsrq.Text = "";
            ksrq1.Text = "";
            jsrq1.Text = "";
            UserID1.Text = "";
            UserName1.Text = "";

            mydb.Alert("删除成功！可以重新导入删除的考勤数据！");
        }

        //按个人删除
        protected void Del_Click2(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            if (string.IsNullOrEmpty(UserID1.Text))
            {
                mydb.Alert("请先选择要删除的人员，再执行删除！");
                return;
            }

            if (string.IsNullOrEmpty(ksrq1.Text) | string.IsNullOrEmpty(jsrq1.Text))
            {
                mydb.Alert("请先选择考勤日期范围，再执行删除！");
                return;
            }

            SqlHelper.ExecuteSql("DELETE FROM OA_KQXX WHERE RYBH IN(SELECT KQID FROM OA_KQ_QX WHERE YHID='" + hkdb.GetStr(UserID1.Text) + "') AND KQRQ BETWEEN '" + hkdb.GetStr(ksrq1.Text) + "' AND '" + hkdb.GetStr(jsrq1.Text) + "'");

            ksrq.Text = "";
            jsrq.Text = "";
            ksrq1.Text = "";
            jsrq1.Text = "";
            UserID1.Text = "";
            UserName1.Text = "";

            mydb.Alert("删除成功！可以重新导入删除的考勤数据！");
        }
    }
}
