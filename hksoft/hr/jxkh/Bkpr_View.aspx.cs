using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jxkh
{
    public partial class Bkpr_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object Sender, EventArgs E)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("81103", "0");

                BindAttr();

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";

                    if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                    {
                        SqlDataReader datar = SqlHelper.ExecuteReader("SELECT * FROM HR_Kpdf_Bkpr01 WHERE BID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                        if (datar.Read())
                        {
                            bid.Text = datar["bid"].ToString();
                            xm.Text = datar["xm"].ToString();
                            bs.Text = datar["bs"].ToString();
                            gw.Text = datar["gw"].ToString();
                            fgzrid.Text = datar["fgzrid"].ToString();
                            fgzrmc.Text = datar["fgzrmc"].ToString();
                            bz.Text = datar["bz"].ToString();
                            datar.Close();

                            //Init
                            DelBtn.Visible = true;
                            SaveAddBtn.Visible = false;
                            img1.Visible = false;
                        }
                        else
                        {
                            datar.Close();
                            mydb.Alert_Close("此记录不存在,可能已被删除！");
                        }
                    }
                }
                else
                {
                    lbltitle.Text = "新增";
                    SaveAddBtn.Visible = true;
                }
            }
        }

        public void BindAttr()
        {
            xm.Attributes.Add("readonly", "readonly");
            fgzrmc.Attributes.Add("readonly", "readonly");
        }

        protected void Save_Click(object Sender, EventArgs E)
        {
            if (lbltitle.Text == "新增")
            {
                //编码判断（重复）
                if (bd.CheckRepeat("SELECT bid FROM HR_Kpdf_Bkpr01 WHERE bid='" + hkdb.GetStr(bid.Text) + "'") == "true")
                {
                    mydb.Alert("保存失败,此编码已经存在！");
                    return;
                }

                SqlHelper.ExecuteSql("INSERT INTO HR_Kpdf_Bkpr01(bid,xm,bs,gw,fgzrid,fgzrmc,bz,cjr,cjsj) VALUES"
                    + "('" + hkdb.GetStr(bid.Text) + "','" + hkdb.GetStr(xm.Text) + "','" + hkdb.GetStr(bs.Text) + "','" + hkdb.GetStr(gw.Text) + "','" + hkdb.GetStr(fgzrid.Text) + "','" + hkdb.GetStr(fgzrmc.Text) + "','" + hkdb.GetStr(bz.Text) + "','" + this.Session["userid"] + "',GETDATE())");

                //判断btn 
                Button btn = (Button)Sender;
                string s = btn.ID;
                if (s == "SaveAddBtn")
                {
                    Clear_Click();

                    mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Bkpr.aspx");
                }
                else
                {
                    mydb.Alert_Refresh("保存成功！", "Bkpr.aspx");
                }
            }
            else
            {
                SqlHelper.ExecuteSql("UPDATE HR_Kpdf_Bkpr01 SET bs='" + hkdb.GetStr(bs.Text) + "',gw='" + hkdb.GetStr(gw.Text) + "',fgzrid='" + hkdb.GetStr(fgzrid.Text) + "',fgzrmc='" + hkdb.GetStr(fgzrmc.Text) + "',bz='" + hkdb.GetStr(bz.Text) + "',xgr='" + this.Session["userid"] + "',xgsj=GETDATE() WHERE BID='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                mydb.Alert_Refresh("保存成功！", "Bkpr.aspx");
            }
        }

        //清空 
        public void Clear_Click()
        {
            bid.Text = "";
            xm.Text = "";
            bs.Text = "";
            gw.Text = "";
            fgzrid.Text = "";
            fgzrmc.Text = "";
            bz.Text = "";
        }

        //删除 
        public void Del_Click(object Sender, EventArgs E)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            string sql1 = "SELECT * FROM HR_Kpdf_Kpxm02 WHERE SSBID='" + hkdb.GetStr(bid.Text) + "'";
            if (bd.CheckRepeat(sql1) == "true")
            {
                mydb.Alert("删除失败,考评项目中已存在该被考评人的相关记录！");
                return;
            }

            SqlHelper.ExecuteSql("DELETE FROM HR_Kpdf_Bkpr02 WHERE ssbid = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            SqlHelper.ExecuteSql("DELETE FROM HR_Kpdf_Bkpr01 WHERE bid = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");

            mydb.Alert_Refresh_Close("删除成功！", "Bkpr.aspx");
        } 
    }
}
