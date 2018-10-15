using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Wdyjx_f_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public static string attKey;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10114", "0");

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
                Number.Text = "" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + System.DateTime.Now.Hour.ToString() + "" + System.DateTime.Now.Minute.ToString() + "" + System.DateTime.Now.Second.ToString() + "" + System.DateTime.Now.Millisecond.ToString() + "" + rad + "";

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HK_WDYJ WHERE YJID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                if (datar.Read())
                {
                    lblyjbt.Text = datar["yjbt"].ToString();
                    editor.Value = hkdb.GetStrTeOut(datar["yjnr"].ToString());
                    lblfbsj.Text = string.Format("{0:d}", datar["fbsj"]);
                    lblfbrmc.Text = datar["fbrmc"].ToString();
                    lblhfnr.Text = datar["hfnr"].ToString();
                    lblhfsj.Text = string.Format("{0:d}", datar["hfsj"]);
                    lblhfrmc.Text = datar["hfrmc"].ToString();

                    if (!string.IsNullOrEmpty(datar["fjmc"].ToString()))
                    {
                        Number.Text = datar["fjmc"].ToString();
                    } 

                    if (datar["zt"].ToString() == "待回复")
                    {
                        SaveBtn.Visible = true;
                        DelBtn.Visible = true;
                        uploadBtn.Visible = true;
                        AttDelBtn.Visible = true;
                    }
                    datar.Close();
                }
                else
                {
                    datar.Close();
                    mydb.Alert_Close("此记录不存在,可能已被删除！");
                }
            }

            BindDpList();
        }

        public void BindAttr()
        {
            uploadBtn.Attributes["onclick"] = "javascript:return PageCheck();";
            AttDelBtn.Attributes["onclick"] = "javascript:return AttDel();";
        }

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("UPDATE HK_WDYJ SET YJNR='" + hkdb.GetStrTeIn(editor.Value) + "',FJMC='" + hkdb.GetStr(Number.Text) + "' WHERE YJID = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' AND ZT='待回复'");

            mydb.Alert_Close("保存成功！");
        }

        //删除
        protected void Del_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("DELETE FROM HK_WDYJ WHERE YJID = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "' AND ZT='待回复'");

            mydb.Alert_Refresh_Close("删除成功！","Wdyjx_f.aspx");
        }

        public void BindDpList()
        {
            fjlb.Items.Clear();

            string sql_fjlb = "select * from hk_AttUpload where attkey='" + hkdb.GetStr(Number.Text) + "' and attClass='p03' order by attID desc";
            bd.Bind_DropDownList_NoBlank(fjlb, sql_fjlb, "attNewName", "attName", "", "");
        }

        //上传
        protected void uploadBtn_Click(object sender, EventArgs e)
        {
            string strBaseLocation = Server.MapPath("../../Attach/portal/yjx/");
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

                SqlHelper.ExecuteSql("insert into hk_AttUpload(attName,attNewName,attKey,attClass) values ('" + fileName + "','" + TruePath + "','" + hkdb.GetStr(Number.Text) + "','p03')");
                BindDpList();
            }
        }
    }
}
