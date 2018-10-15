using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.jhgl
{
    public partial class Wdjh_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10110", "0");

                BindAttr();

                //短信
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                DropDownListBind_lx();

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SqlDataReader dr = SqlHelper.ExecuteReader("select * from oa_gzjh01 where jhid='" + hkdb.GetStr(Request.QueryString["id"].ToString()) + "'");
                    if (dr.Read())
                    {
                        jhnf.Text = dr["jhnf"].ToString();
                        jhlx.SelectedValue = dr["jhlx"].ToString();
                        ztmb.Text = dr["ztmb"].ToString();

                        switch ((dr["jhyf"].ToString()).Substring((dr["jhyf"].ToString()).Length - 1))
                        {
                            case "度":
                                rblcq.SelectedValue = "按季度";
                                yf.Items.Clear();

                                ListItem theItem3 = new ListItem();
                                theItem3.Text = "";
                                theItem3.Value = "";
                                yf.Items.Add(theItem3);

                                ListItem theItem4 = new ListItem();
                                theItem4.Text = "一季度";
                                theItem4.Value = "一季度";
                                yf.Items.Add(theItem4);

                                ListItem theItem5 = new ListItem();
                                theItem5.Text = "二季度";
                                theItem5.Value = "二季度";
                                yf.Items.Add(theItem5);

                                ListItem theItem6 = new ListItem();
                                theItem6.Text = "三季度";
                                theItem6.Value = "三季度";
                                yf.Items.Add(theItem6);

                                ListItem theItem7 = new ListItem();
                                theItem7.Text = "四季度";
                                theItem7.Value = "四季度";
                                yf.Items.Add(theItem7);
                                break;
                            case "年":
                                rblcq.SelectedValue = "按半年";
                                yf.Items.Clear();

                                ListItem theItem = new ListItem();
                                theItem.Text = "";
                                theItem.Value = "";
                                yf.Items.Add(theItem);

                                ListItem theItem1 = new ListItem();
                                theItem1.Text = "上半年";
                                theItem1.Value = "上半年";
                                yf.Items.Add(theItem1);

                                ListItem theItem2 = new ListItem();
                                theItem2.Text = "下半年";
                                theItem2.Value = "下半年";
                                yf.Items.Add(theItem2);
                                break;
                            default:
                                rblcq.SelectedValue = "按月份";
                                yf.Items.Clear();

                                ListItem theItem0 = new ListItem();
                                theItem0.Text = "";
                                theItem0.Value = "";
                                yf.Items.Add(theItem0);

                                ListItem theItem8 = new ListItem();
                                theItem8.Text = "01月";
                                theItem8.Value = "01月";
                                yf.Items.Add(theItem8);

                                ListItem theItem9 = new ListItem();
                                theItem9.Text = "02月";
                                theItem9.Value = "02月";
                                yf.Items.Add(theItem9);

                                ListItem theItem10 = new ListItem();
                                theItem10.Text = "03月";
                                theItem10.Value = "03月";
                                yf.Items.Add(theItem10);

                                ListItem theItem11 = new ListItem();
                                theItem11.Text = "04月";
                                theItem11.Value = "04月";
                                yf.Items.Add(theItem11);

                                ListItem theItem12 = new ListItem();
                                theItem12.Text = "05月";
                                theItem12.Value = "05月";
                                yf.Items.Add(theItem12);

                                ListItem theItem13 = new ListItem();
                                theItem13.Text = "06月";
                                theItem13.Value = "06月";
                                yf.Items.Add(theItem13);

                                ListItem theItem14 = new ListItem();
                                theItem14.Text = "07月";
                                theItem14.Value = "07月";
                                yf.Items.Add(theItem14);

                                ListItem theItem15 = new ListItem();
                                theItem15.Text = "08月";
                                theItem15.Value = "08月";
                                yf.Items.Add(theItem15);

                                ListItem theItem16 = new ListItem();
                                theItem16.Text = "09月";
                                theItem16.Value = "09月";
                                yf.Items.Add(theItem16);

                                ListItem theItem17 = new ListItem();
                                theItem17.Text = "10月";
                                theItem17.Value = "10月";
                                yf.Items.Add(theItem17);

                                ListItem theItem18 = new ListItem();
                                theItem18.Text = "11月";
                                theItem18.Value = "11月";
                                yf.Items.Add(theItem18);

                                ListItem theItem19 = new ListItem();
                                theItem19.Text = "12月";
                                theItem19.Value = "12月";
                                yf.Items.Add(theItem19);
                                break;
                        }

                        yf.SelectedValue = dr["jhyf"].ToString();

                        dr.Close();
                    }

                    SaveBtn.Visible = false;
                    DelBtn.Visible = true;
                    AddBtn.Visible = true;
                    SendBtn.Visible = true;
                    songshen.Visible = true;

                    AddBtn.Attributes.Add("onclick", "Javascript:popMod('gzx_add.aspx?type=a&id=" + Request.QueryString["id"] + "');");
                }

                GridViewBind();
            }
        }

        public void BindAttr()
        {
            UserName.Attributes.Add("readonly", "readonly");
        }

        //gv绑定 
        public void GridViewBind()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                DataSet ds = SqlHelper.ExecuteDs("select jhid,id,gzzt,jhkssj,jhwcsj from OA_GZJH02 where jhid='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                DataSet ds = SqlHelper.ExecuteDs("select jhid,id,gzzt,jhkssj,jhwcsj from OA_GZJH02 where jhid='" + hkdb.GetStr(IDlabel.Text) + "'");
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }

        //审批人 
        public void DropDownListBind_lx()
        {
            string sql_jhlx = "select id,mc FROM hk_ZDYLX where fl='o02' and zt='正常'";
            bd.Bind_DropDownList(jhlx, sql_jhlx, "id", "mc", "", "");
        }

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            IDlabel.Text = Convert.ToString(SqlHelper.ExecuteScalar("insert into OA_GZJH01(jhnf,jhyf,ztmb,zt,jhz,lrsj,jhlx,jhsx) values('" + hkdb.GetStr(jhnf.Text) + "','" + yf.SelectedValue + "','" + hkdb.GetStr(ztmb.Text) + "','录入','" + this.Session["userid"] + "',GETDATE(),'" + jhlx.SelectedValue + "','0')" + "select cast(scope_identity() as int)"));

            mydb.Alert_Refresh("保存成功！", "Wdjh.aspx");

            SaveBtn.Visible = false;
            DelBtn.Visible = true;
            AddBtn.Visible = true;
            SendBtn.Visible = true;
            songshen.Visible = true;

            AddBtn.Attributes.Add("onclick", "Javascript:popMod('gzx_add.aspx?type=a&id=" + IDlabel.Text + "');");
        }

        //送审
        protected void Send_Click(object sender, EventArgs e)
        {
            SqlHelper.ExecuteSql("update OA_GZJH01 set zt='审核中',lrsj=GETDATE(),sprIDs='" + hkdb.GetStr(UserID.Text) + "',sprNames='" + hkdb.GetStr(UserName.Text) + "' where zt='录入' and jhid=('" + hkdb.GetStr(IDlabel.Text) + "')");
            if (xxtz.Checked == true | dxtz.Checked == true)
            {
                string message = this.Session["username"].ToString() + "向您提交了一份个人工作计划,请审批!";
                hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), UserID.Text, message);
            }

            GridViewBind();

            mydb.Alert_Refresh_Close("计划已成功送审！", "Wdjh.aspx");
        }

        //删除 
        protected void Del_Click(object sender, EventArgs e)
        {
            string cal = "";
            int i = 0;
            for (i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Rows[i].Cells[1].FindControl("del");
                if (cb.Checked == true)
                {
                    if (string.IsNullOrEmpty(cal))
                    {
                        cal = GridView1.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        cal = cal + "','" + GridView1.DataKeys[i].Value.ToString();
                    }
                }
            }
            if (!string.IsNullOrEmpty(cal))
            {
                SqlHelper.ExecuteSql("delete from OA_GZJH02 where id in ('" + cal + "')");
                mydb.Alert_Refresh("删除成功！", "Wdjh.aspx");
                GridViewBind();
            }
            else
            {
                mydb.Alert("删除失败,请先选中记录！");
            }
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }

        protected void rblcq_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (rblcq.SelectedValue)
            {
                case "按半年":
                    yf.Items.Clear();

                    ListItem theItem = new ListItem();
                    theItem.Text = "";
                    theItem.Value = "";
                    yf.Items.Add(theItem);

                    ListItem theItem1 = new ListItem();
                    theItem1.Text = "上半年";
                    theItem1.Value = "上半年";
                    yf.Items.Add(theItem1);

                    ListItem theItem2 = new ListItem();
                    theItem2.Text = "下半年";
                    theItem2.Value = "下半年";
                    yf.Items.Add(theItem2);
                    break;
                case "按季度":
                    yf.Items.Clear();

                    ListItem theItem3 = new ListItem();
                    theItem3.Text = "";
                    theItem3.Value = "";
                    yf.Items.Add(theItem3);

                    ListItem theItem4 = new ListItem();
                    theItem4.Text = "一季度";
                    theItem4.Value = "一季度";
                    yf.Items.Add(theItem4);

                    ListItem theItem5 = new ListItem();
                    theItem5.Text = "二季度";
                    theItem5.Value = "二季度";
                    yf.Items.Add(theItem5);

                    ListItem theItem6 = new ListItem();
                    theItem6.Text = "三季度";
                    theItem6.Value = "三季度";
                    yf.Items.Add(theItem6);

                    ListItem theItem7 = new ListItem();
                    theItem7.Text = "四季度";
                    theItem7.Value = "四季度";
                    yf.Items.Add(theItem7);
                    break;
                case "按月份":
                    yf.Items.Clear();

                    ListItem theItem0 = new ListItem();
                    theItem0.Text = "";
                    theItem0.Value = "";
                    yf.Items.Add(theItem0);

                    ListItem theItem8 = new ListItem();
                    theItem8.Text = "01月";
                    theItem8.Value = "01月";
                    yf.Items.Add(theItem8);

                    ListItem theItem9 = new ListItem();
                    theItem9.Text = "02月";
                    theItem9.Value = "02月";
                    yf.Items.Add(theItem9);

                    ListItem theItem10 = new ListItem();
                    theItem10.Text = "03月";
                    theItem10.Value = "03月";
                    yf.Items.Add(theItem10);

                    ListItem theItem11 = new ListItem();
                    theItem11.Text = "04月";
                    theItem11.Value = "04月";
                    yf.Items.Add(theItem11);

                    ListItem theItem12 = new ListItem();
                    theItem12.Text = "05月";
                    theItem12.Value = "05月";
                    yf.Items.Add(theItem12);

                    ListItem theItem13 = new ListItem();
                    theItem13.Text = "06月";
                    theItem13.Value = "06月";
                    yf.Items.Add(theItem13);

                    ListItem theItem14 = new ListItem();
                    theItem14.Text = "07月";
                    theItem14.Value = "07月";
                    yf.Items.Add(theItem14);

                    ListItem theItem15 = new ListItem();
                    theItem15.Text = "08月";
                    theItem15.Value = "08月";
                    yf.Items.Add(theItem15);

                    ListItem theItem16 = new ListItem();
                    theItem16.Text = "09月";
                    theItem16.Value = "09月";
                    yf.Items.Add(theItem16);

                    ListItem theItem17 = new ListItem();
                    theItem17.Text = "10月";
                    theItem17.Value = "10月";
                    yf.Items.Add(theItem17);

                    ListItem theItem18 = new ListItem();
                    theItem18.Text = "11月";
                    theItem18.Value = "11月";
                    yf.Items.Add(theItem18);

                    ListItem theItem19 = new ListItem();
                    theItem19.Text = "12月";
                    theItem19.Value = "12月";
                    yf.Items.Add(theItem19);
                    break;
            }
        }
    }
}
