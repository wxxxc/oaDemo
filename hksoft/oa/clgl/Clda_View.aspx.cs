using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.clgl
{
    public partial class Clda_View : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10801", "0");

                DropDownListBind();

                //参数判断 
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    lbltitle.Text = "修改";
                    SqlDataReader datar = SqlHelper.ExecuteReader("select a.*,b.ui_desc from OA_CLDA a left outer join yh b on (a.jdr=b.ui_id) where id='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (datar.Read())
                    {
                        cph.Text = datar["cph"].ToString();
                        clmc.Text = datar["clmc"].ToString();
                        zdzs.Text = datar["zdzs"].ToString();
                        qyrq.Text = string.Format("{0:d}", datar["qyrq"]);
                        gmj.Text = datar["gmj"].ToString();
                        cz.Text = datar["cz"].ToString();
                        cpxh.Text = datar["cpxh"].ToString();
                        fdjh.Text = datar["fdjh"].ToString();
                        cjh.Text = datar["cjh"].ToString();
                        xszh.Text = datar["xszh"].ToString();
                        bz.Text = datar["bz"].ToString();
                        jdr.Text = datar["ui_desc"].ToString();
                        jdsj.Text = string.Format("{0:d}", datar["jdsj"]);
                        clzt.Text = datar["clzt"].ToString();
                        glry.SelectedValue = datar["glry"].ToString();
                        jdr_label.Text = "建档：";
                        datar.Close();
                        //Init 
                        DelBtn.Visible = true;
                    }
                    else
                    {
                        datar.Close();
                        mydb.Alert_Close("此记录不存在,可能已被删除！");
                    }
                }
                else
                {
                    lbltitle.Text = "新增";
                    SaveAddBtn.Visible = true;
                    clzt.Text = "未借出";
                }

            }
        }

        //dp绑定 
        public void DropDownListBind()
        {

            string sql_glry = "select ui_id,ui_desc from yh where ui_lx='企业' and ui_status='正常' order by ui_id";
            bd.Bind_DropDownList(glry, sql_glry, "ui_id", "ui_desc", "", "");

        }

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            if (lbltitle.Text == "新增")
            {
                SqlHelper.ExecuteSql("insert into OA_CLDA(cph,clmc,zdzs,qyrq,gmj,cz,cpxh,fdjh,cjh,xszh,bz,jdr,jdsj,glry,clzt) values('" + hkdb.GetStr(cph.Text) + "','" + hkdb.GetStr(clmc.Text) + "','" + hkdb.GetStr(zdzs.Text) + "','" + hkdb.GetStr(qyrq.Text) + "','" + hkdb.GetStr(gmj.Text) + "','" + hkdb.GetStr(cz.Text) + "','" + hkdb.GetStr(cpxh.Text) + "','" + hkdb.GetStr(fdjh.Text) + "','" + hkdb.GetStr(cjh.Text) + "','" + hkdb.GetStr(xszh.Text) + "','" + hkdb.GetStr(bz.Text) + "','" + this.Session["userid"] + "',GETDATE(),'" + glry.SelectedValue + "','" + hkdb.GetStr(clzt.Text) + "')");
            }
            else
            {
                SqlHelper.ExecuteSql("update OA_CLDA set cph='" + hkdb.GetStr(cph.Text) + "',clmc='" + hkdb.GetStr(clmc.Text) + "',zdzs='" + hkdb.GetStr(zdzs.Text) + "',qyrq='" + hkdb.GetStr(qyrq.Text) + "',gmj='" + hkdb.GetStr(gmj.Text) + "',cz='" + hkdb.GetStr(cz.Text) + "',cpxh='" + hkdb.GetStr(cpxh.Text) + "',fdjh='" + hkdb.GetStr(fdjh.Text) + "',cjh='" + hkdb.GetStr(cjh.Text) + "',xszh='" + hkdb.GetStr(xszh.Text) + "',bz='" + hkdb.GetStr(bz.Text) + "',glry='" + glry.SelectedValue + "' where id='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
            }

            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            if (s == "SaveAddBtn")
            {
                Clear_Click();
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "Clda.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("保存成功！", "Clda.aspx");
            }
        }

        //清空 
        protected void Clear_Click()
        {
            cph.Text = "";
            clmc.Text = "";
            zdzs.Text = "";
            qyrq.Text = "";
            gmj.Text = "";
            cz.Text = "";
            cpxh.Text = "";
            fdjh.Text = "";
            cjh.Text = "";
            xszh.Text = "";
            bz.Text = "";
            clzt.Text = "未借出";
            glry.SelectedValue = "";
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            int j = 0;
            j = (int)SqlHelper.ExecuteScalar("select count(*) from oa_clsq where xycl= '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
            if (j > 0)
            {
                mydb.Alert("删除失败,要删除的车辆已存在申请记录！");
            }
            else
            {
                SqlHelper.ExecuteSql("delete from OA_CLDA where id = '" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                mydb.Alert_Refresh_Close("删除成功！", "Clda.aspx");
            }
        }
    }
}
