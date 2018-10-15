using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Pfclsc_Sc : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string attKey;
        public void Page_Load(object Sender, EventArgs E)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("81106", "0");

                //附件
                attKey = this.Session["fjlx"].ToString();

                BindAttr();

                Random g = new Random();
                string rad = g.Next(10000).ToString();
                Number.Text = "" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + System.DateTime.Now.Hour.ToString() + "" + System.DateTime.Now.Minute.ToString() + "" + System.DateTime.Now.Second.ToString() + "" + System.DateTime.Now.Millisecond.ToString() + "" + rad + "";

                if (!string.IsNullOrEmpty(Request.QueryString["kpid"]))
                {
                    lblname.Text = SqlHelper.ExecuteScalar("SELECT UI_DESC FROM YH WHERE UI_ID='" + hkdb.GetStr(Request.QueryString["bid"].ToString()) + "'").ToString();

                    //判断重复
                    string sql = "SELECT kpzt FROM HR_Kpdf_Kpxm01 WHERE kpid='" + hkdb.GetStr(Request.QueryString["kpid"].ToString()) + "' and kpzt='未生效'";
                    if (bd.CheckRepeat(sql) == "true")
                    {
                        uploadBtn.Visible = true;
                        AttDelBtn.Visible = true;
                        SaveBtn.Visible = true;
                    }

                    SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.* FROM HR_Kpdf_Kpxm03 A WHERE sskpid='" + hkdb.GetStr(Request.QueryString["kpid"].ToString()) + "' AND ssbid='" + hkdb.GetStr(Request.QueryString["bid"].ToString()) + "'");
                    if (dr.Read())
                    {
                        lbltitle.Text = "修改";

                        if (!string.IsNullOrEmpty(dr["kpfj"].ToString()))
                        {
                            Number.Text = dr["kpfj"].ToString();
                        }
                    }
                    else
                    {
                        lbltitle.Text = "新增";
                    }
                    dr.Close();
                }
            }

            BindDpList();
        }

        public void BindAttr()
        {
            uploadBtn.Attributes["onclick"] = "javascript:return PageCheck();";
            AttDelBtn.Attributes["onclick"] = "javascript:return AttDel();";
        }

        public void BindDpList()
        {
            fjlb.Items.Clear();

            //附件列表
            string sql_fjlb = "select * from hk_AttUpload where attkey='" + hkdb.GetStr(Number.Text) + "' and attClass='h21' order by attID desc";
            bd.Bind_DropDownList_NoBlank(fjlb, sql_fjlb, "attNewName", "attName", "", "");
        }

        //保存 
        protected void Save_Click(object Sender, EventArgs E)
        {
            if (lbltitle.Text == "新增")
            {
                SqlHelper.ExecuteSql("INSERT INTO HR_Kpdf_Kpxm03(SSKPID,SSBID,KPFJ) VALUES('" + hkdb.GetStr(Request.QueryString["kpid"].ToString()) + "','" + hkdb.GetStr(Request.QueryString["bid"].ToString()) + "','" + hkdb.GetStr(Number.Text) + "')");
            }

            mydb.Alert_Refresh_Close("保存成功！", "Pfclsc_View.aspx?id=" + Request.QueryString["kpid"].ToString() + "");
        }

        //上传
        protected void uploadBtn_Click(object sender, EventArgs e)
        {
            string strBaseLocation = Server.MapPath("../../attach/hr/jxgl/");
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

                SqlHelper.ExecuteSql("insert into hk_AttUpload(attName,attNewName,attKey,attClass) values ('" + fileName + "','" + TruePath + "','" + hkdb.GetStr(Number.Text) + "','h21')");

                BindDpList();
            }
        }
    }
}
