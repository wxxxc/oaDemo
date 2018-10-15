using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zsgl
{
    public partial class zszj_update : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        public static string KmTitle, attKey;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10111", "0");

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT p_string FROM hk_CSDA WHERE paramt='P_AttType'");
                if (dr.Read())
                {
                    attKey = dr["p_string"].ToString();
                }
                dr.Close();

                BindAttr();

                SqlDataReader datar = SqlHelper.ExecuteReader("select id,Number,Title from OA_KnowLedge   where  Number='" + hkdb.GetStr(Request.QueryString["Number"]) + "'  ");
                if (datar.Read())
                {
                    KmTitle = datar["Title"].ToString();
                }
                datar.Close();
            }
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_KlChap where id='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                    if (datar.Read())
                    {
                        Name.Text = datar["Name"].ToString();
                        editor.Value = datar["Content"].ToString();
                        Number.Text = datar["Number"].ToString();

                        string sql_fjlb = "select  * from OA_KlChapAtt where KeyField='" + hkdb.GetStr(Number.Text) + "' order by id desc";
                        bd.Bind_DropDownList_NoBlank(fjlb, sql_fjlb, "NewName", "Name", "", "");

                    }
                    datar.Close();
                }
            }

            BindDpList();
        }

        public void BindAttr()
        {
            uploadBtn.Attributes["onclick"] = "javascript:return PageCheck();";
            delBtn.Attributes["onclick"] = "javascript:return AttDel();";
        }

        public void BindDpList()
        {
            //附件列表
            fjlb.Items.Clear();
            string sql_fjlb = "select  * from OA_KlChapAtt where KeyField='" + hkdb.GetStr(Number.Text) + "' order by id desc";
            bd.Bind_DropDownList_NoBlank(fjlb, sql_fjlb, "NewName", "Name", "", "");
        }

        //上传附件
        protected void uploadBtn_Click(object sender, EventArgs e)
        {
            string strBaseLocation = Server.MapPath("../../Attach/oa/knowledge/");
            string TruePath = string.Empty;
            string Temp1 = string.Empty;

            if (uploadFile.PostedFile.ContentLength != 0)
            {
                string fileName = System.IO.Path.GetFileName(uploadFile.PostedFile.FileName);
                string extName = System.IO.Path.GetExtension(fileName);

                Random g = new Random();
                string rad = g.Next(10000).ToString();
                Temp1 = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString() + rad;
                uploadFile.PostedFile.SaveAs(strBaseLocation + Temp1 + extName);
                TruePath = Temp1 + extName;

                SqlHelper.ExecuteSql("insert into OA_KlChapAtt(Name,NewName,KeyField) values ('" + fileName + "','" + TruePath + "','" + hkdb.GetStr(Number.Text) + "')");
                BindDpList();
            }
        }

        protected void BtnS_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteScalar("update  OA_KlChap set  Content='" + editor.Value + "',Name='" + hkdb.GetStr(Name.Text) + "' where  id='" + hkdb.GetStr(Request.QueryString["id"]) + "'");

            mydb.Alert_Refresh_Close("提交成功！", "wdzs_manage.aspx?Number=" + hkdb.GetStr(Request.QueryString["Number"]) + "");
        }
    }
}