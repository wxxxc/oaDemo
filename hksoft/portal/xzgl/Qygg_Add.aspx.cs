using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Qygg_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string attKey;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11301", "0");

                OperQx();

                //附件
                SqlDataReader dr_fj = SqlHelper.ExecuteReader("SELECT p_string FROM hk_CSDA WHERE paramt='P_AttType'");
                if (dr_fj.Read())
                {
                    attKey = dr_fj["p_string"].ToString();
                }
                dr_fj.Close();

                BindAttr();

                Random g = new Random();
                string rad = g.Next(10000).ToString();
                fjNumber.Text = "" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + System.DateTime.Now.Hour.ToString() + "" + System.DateTime.Now.Minute.ToString() + "" + System.DateTime.Now.Second.ToString() + "" + System.DateTime.Now.Millisecond.ToString() + "" + rad + "";
                
                //使用范围
                if (this.Session["systype"].ToString() == "A")     //主登录页
                {
                    SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT xh FROM hk_Init WHERE produID IN('M','V','F')");
                    if (datar1.Read())
                    {
                        lx.Visible = true;
                    }
                    datar1.Close();
                }
                else  //子登录页
                {
                    if (this.Session["systype"].ToString() == "M" | this.Session["systype"].ToString() == "V" | this.Session["systype"].ToString() == "F")
                    {
                        lx.Visible = true;
                    }
                }

                DropDownListBind();
            }

            BindDpList();
        }

        //操作权限
        public void OperQx()
        {
            hkdb.QxValid(SaveBtn, "11301a", Session["roleqx"].ToString());
        }

        public void BindAttr()
        {
            uploadBtn.Attributes["onclick"] = "javascript:return PageCheck();";
            AttDelBtn.Attributes["onclick"] = "javascript:return AttDel();";
        }

        //dp绑定 
        public void DropDownListBind()
        {
            string sql = "SELECT ID,MC FROM HK_ZDYLX WHERE fl='p02' AND ZT='正常'";
            bd.Bind_DropDownList(ggfl, sql, "ID", "MC", "", "");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("INSERT INTO HK_QYGG(GGZT,GGNR,KSSJ,JSSJ,LX,GGFL,ZT,LRR,LRSJ,GGLB,GGFJ) VALUES('" + hkdb.GetStr(ggzt.Text) + "','" + editor.Value + "','" + hkdb.GetStr(kssj.Text) + "','" + hkdb.GetStr(jssj.Text) + "','" + lx.SelectedValue + "','" + ggfl.SelectedValue + "','录入','" + this.Session["userid"] + "',GETDATE(),'1','" + fjNumber.Text + "')");
            
            mydb.Alert_Refresh_Close("保存成功！","Qygg.aspx");
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            ggzt.Text = "";
            editor.Value = "";
            ggfl.SelectedValue = "";
            kssj.Text = "";
            jssj.Text = "";

            Random g = new Random();
            string rad = g.Next(10000).ToString();
            fjNumber.Text = "" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + System.DateTime.Now.Hour.ToString() + "" + System.DateTime.Now.Minute.ToString() + "" + System.DateTime.Now.Second.ToString() + "" + System.DateTime.Now.Millisecond.ToString() + "" + rad + "";
        }

        public void BindDpList()
        {
            fjlb.Items.Clear();

            string sql_fjlb = "select * from hk_AttUpload where attkey='" + hkdb.GetStr(fjNumber.Text) + "' and attClass='p02' order by attID desc";
            bd.Bind_DropDownList_NoBlank(fjlb, sql_fjlb, "attNewName", "attName", "", "");
        }

        //上传
        protected void uploadBtn_Click(object sender, EventArgs e)
        {
            string strBaseLocation = Server.MapPath("../../Attach/portal/gg/");
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

                SqlHelper.ExecuteSql("insert into hk_AttUpload(attName,attNewName,attKey,attClass) values ('" + fileName + "','" + TruePath + "','" + hkdb.GetStr(fjNumber.Text) + "','p02')");
                BindDpList();
            }
        }
    }
}
