using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.xmgl
{
    public partial class Xmwh_Gzjl : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            xmid.Text = (string)Request.QueryString["id"].ToString();
            if (!IsPostBack)
            {
                hkdb.PassTo("11505", "0");

                lblAttachSize.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT P_STRING FROM hk_CSDA WHERE PARAMT='P_fj_size'"));

                if (string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SaveBtn.Enabled = false;
                    PrnBtn.Enabled = false;
                }

                if (!string.IsNullOrEmpty(Request.QueryString["gzid"]))
                {
                    gzid.Text = Request.QueryString["gzid"];
                    SqlDataReader dr = SqlHelper.ExecuteReader("select * from oa_xmgl_gzjl where gzid='" + hkdb.GetStr(Request.QueryString["gzid"].ToString()) + "'");
                    if (dr.Read())
                    {
                        gzrq.Text = dr["gzrq"].ToString();
                        gzztjs.Text = dr["gzztjs"].ToString();
                        gzztxs.Text = dr["gzztxs"].ToString();
                    }
                    dr.Close();
                }
            }

            GridViewBind();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string FileName = "";
            string FileVisualPathStr = "";
            string UserName = this.Session["userid"].ToString();

            if (!string.IsNullOrEmpty(fj.PostedFile.FileName.Trim()))
            {
                try
                {
                    if (fj.PostedFile.ContentLength < 1024 * int.Parse(lblAttachSize.Text))
                    {
                        FileName = System.IO.Path.GetFileName(fj.PostedFile.FileName);
                        //if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\oa\\xm\\" + UserName)))
                        //{
                        //    System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\oa\\xm\\" + UserName));
                        //}
                        Random TempNameInt = new Random();
                        string NewDocDirName = TempNameInt.Next(100000000).ToString();
                        if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\oa\\xm\\" + UserName + "\\" + NewDocDirName)))
                        {
                            System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\oa\\xm\\" + UserName + "\\" + NewDocDirName));
                        }
                        TempNameInt = null;
                        fj.PostedFile.SaveAs((Server.MapPath("..\\..\\") + "Attach\\oa\\xm\\" + UserName + "\\" + NewDocDirName + "\\" + FileName));
                        FileVisualPathStr = "\\Attach\\oa\\xm\\" + UserName + "\\" + NewDocDirName + "\\";
                    }
                    else
                    {
                        mydb.Alert("保存失败,附件大小不能超过 " + lblAttachSize.Text + " KB！");
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            if (string.IsNullOrEmpty(gzid.Text))
            {
                SqlHelper.ExecuteSql("insert into OA_XMGL_GZJL(xmid,gzrq,gzztjs,gzztxs,gzfjmc,gzfjlj) values('" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "','" + hkdb.GetStr(gzrq.Text) + "', '" + hkdb.GetStr(gzztjs.Text) + "', '" + hkdb.GetStr(gzztxs.Text) + "','" + FileName + "','" + FileVisualPathStr + "')");
            }
            else
            {
                SqlHelper.ExecuteSql("update OA_XMGL_GZJL set gzrq='" + hkdb.GetStr(gzrq.Text) + "',gzztjs= '" + hkdb.GetStr(gzztjs.Text) + "',gzztxs= '" + hkdb.GetStr(gzztxs.Text) + "',gzfjmc='" + FileName + "',gzfjlj='" + FileVisualPathStr + "' where gzid='" + hkdb.GetStr(gzid.Text) + "'");
            }

            gzrq.Text = "";
            gzztjs.Text = "";
            gzztxs.Text = "";
            gzid.Text = "";
            mydb.Alert("保存成功！");

            GridViewBind();
        }

        //gv绑定 
        public void GridViewBind()
        {
            SqlDataSource1.SelectCommand = "";
            SqlDataSource1.SelectCommand = "select * from OA_XMGL_GZJL where xmid='" + hkdb.GetStr(Request.QueryString["id"]) + "'";
            SqlDataSource1.DeleteCommand = "";
            SqlDataSource1.DeleteCommand = "delete from OA_XMGL_GZJL where gzid=@gzid";

            PrnBtn.Attributes.Add("onclick", "Javascript:popPrn('xm_gzjl_prn.aspx?&i1=" + xmid.Text + "');");
        }

        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
    }
}
