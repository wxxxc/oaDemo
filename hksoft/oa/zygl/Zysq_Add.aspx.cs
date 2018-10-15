using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.zygl
{
    public partial class Zysq_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10108", "0");

                //短信
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                //资源分类 
                string sql_zyfl = "select flmc,flid from OA_ZYFL order by flid";
                bd.Bind_DropDownList(zyfl, sql_zyfl, "flid", "flmc", "", "");


                //Init 
                //SaveBtn.Enabled = false;
                txtSdate.Text = DateTime.Now.AddDays(0).ToString("yyyy-MM-dd");
                txtEdate.Text = DateTime.Now.AddDays(0).ToString("yyyy-MM-dd");

                //绑定部门
                DropDownListBind_sjbm();

                sybm.SelectedValue = this.Session["deptid"].ToString();
            }
        }

        protected void ZYFL_Click(object s, EventArgs e)
        {
            sqzy.DataSource = DropDownListBind();
            sqzy.DataTextField = "zymc";
            sqzy.DataValueField = "djid";
            sqzy.DataBind();
        }

        //dp绑定 
        public void DropDownListBind_sjbm()
        {
            bd.Bind_DropDownList_bm(sybm, "", "", "");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            string sdateStr = null;
            string edateStr = null;
            sdateStr = txtSdate.Text + " " + sxs.SelectedValue + sfz.SelectedValue + "00";
            edateStr = txtEdate.Text + " " + exs.SelectedValue + efz.SelectedValue + "00";

            SqlHelper.ExecuteSql("insert into OA_ZYSQ(sybm,sqzy,jysm,sysj,ghsj,zt,sqr,sqsj) values('" + sybm.SelectedValue + "','" + sqzy.SelectedValue + "','" + hkdb.GetStr(jysm.Text) + "','" + sdateStr + "','" + edateStr + "','审批中','" + this.Session["userid"] + "',GETDATE())");
            //Msg 
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                SqlDataReader datar = SqlHelper.ExecuteReader("select glry from oa_zyfl where flid='" + zyfl.SelectedValue + "'");
                if (datar.Read())
                {
                    ycxx.Text = datar["glry"].ToString();
                    datar.Close();

                    string message = "申请从" + sdateStr + "到" + edateStr + "使用[" + sqzy.SelectedItem.Text + "],请批复!" + this.Session["username"].ToString();
                    hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), ycxx.Text, message);
                }
                else
                {
                    datar.Close();
                }
            }

            //判断btn 
            if (s == "SaveBtn")
            {
                mydb.Alert_Refresh("保存成功！", "Zysq.aspx");
                //sybm.SelectedValue = "";
                zyfl.SelectedValue = "";
                jysm.Text = "";
                sxs.SelectedValue = "";
                sfz.SelectedValue = "";
                exs.SelectedValue = "";
                efz.SelectedValue = "";
            }
        }

        //检测冲突 
        protected void JSzt_Click(object sender, EventArgs e)
        {
            DateTime sdateStr = default(DateTime);
            DateTime edateStr = default(DateTime);

            sdateStr = Convert.ToDateTime(txtSdate.Text + " " + sxs.SelectedValue + sfz.SelectedValue + "00");
            edateStr = Convert.ToDateTime(txtEdate.Text + " " + exs.SelectedValue + efz.SelectedValue + "00");

            SqlDataReader datar = SqlHelper.ExecuteReader("select * from OA_ZYSQ a left outer join OA_ZYDJ b on (a.sqzy=b.djid) where sqzy='" + sqzy.SelectedValue + "' and b.zt='可用' and a.zt='已同意' and ((sysj<='" + sdateStr + "' and ghsj>'" + sdateStr + "') or (sysj<='" + edateStr + "' and ghsj >'" + edateStr + "'))");
            if (datar.Read())
            {
                mydb.Alert_Close("该资源已经被其它用户申请，请沟通协调后再决定是否保存！");
            }
            else
            {
                mydb.Alert("该资源目前还没有被借出，可以申请！");
            }
            datar.Close();

            SaveBtn.Enabled = true;
        }

        //清空 
        protected void Clear_Click(object sender, EventArgs e)
        {
            //sybm.SelectedValue = "";
            zyfl.SelectedValue = "";
            jysm.Text = "";
            sxs.SelectedValue = "";
            sfz.SelectedValue = "";
            exs.SelectedValue = "";
            efz.SelectedValue = "";
        }

        //申请资源 
        public ICollection DropDownListBind()
        {
            SqlConnection cnn = default(SqlConnection);
            SqlDataAdapter dtcmd = default(SqlDataAdapter);
            DataSet dset = default(DataSet);

            cnn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["haokeDataLink"]);
            dtcmd = new SqlDataAdapter("select * from OA_ZYDJ where zyfl='" + zyfl.SelectedValue + "' and zt='可用' order by djid", cnn);
            dset = new DataSet();
            dtcmd.Fill(dset);
            DataView dv = new DataView(dset.Tables[0]);
            return dv;
        }
    }
}
