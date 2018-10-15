using haoke365;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hksoft.app.task
{
    public partial class Add_fbdbrw : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();
        BindData bd1 = new BindData();
        BindData bdqt = new BindData();
        BindData bdrzld = new BindData();
        BindData bdrzrr = new BindData();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("9");

            if (!IsPostBack)
            {
                hkdb.PassTo("10301", "0");

                DropDownListBind();

                lblAttachSize.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT P_STRING FROM hk_CSDA WHERE PARAMT='P_fj_size'"));

                ynxs.Checked = false;

                Panelrq.Visible = false;
            }
        }

        //任务性质 
        public void DropDownListBind()
        {
            string sql_rwxz = "select id,mc FROM hk_ZDYLX where fl='o10' and zt='正常'";
            bd.Bind_DropDownList(rwxz, sql_rwxz, "id", "mc", "", "");

            bd1.Bind_DropDownList_bm(bm, "", "领导&科级干部，部门中心负责人", "");
            bdqt.Bind_DropDownList_bm(bm1, "", "领导&科级干部，部门中心负责人", "");
            bdrzld.Bind_DropDownList_bm(bm2, "", "领导&科级干部，部门中心负责人", "");
            bdrzrr.Bind_DropDownList_bm(bm3, "", "领导&科级干部，部门中心负责人", "");
            bdqt.Bind_DropDownList_bm(bm4, "", "领导&科级干部，部门中心负责人", "");


        }

        #region  限时待办
        protected void ynxs_click(object sender, EventArgs e)
        {
            if (ynxs.Checked == true)
            {
                Panelrq.Visible = true;
            }
            else
            {
                Panelrq.Visible = false;
                txtSdate.Text = "";
                txtEdate.Text = "";
                sxs.SelectedValue = "";
                sfz.SelectedValue = "";
                exs.SelectedValue = "";
                efz.SelectedValue = "";
            }
        }
        #endregion

        #region 保存
        protected void Save_Click(object sender, EventArgs e)
        {
            //判断btn 
            Button btn = (Button)sender;
            string s = btn.ID;
            string unitcode = null;
            string sdateStr = null;
            string edateStr = null;
            string FileName = "";
            string FileVisualPathStr = "";
            string UserName = this.Session["userid"].ToString();
            string PathStr = null;
            string type = null;
            string ynxsstr = null;

            if (ynxs.Checked == true)
            {
                ynxsstr = "是";
                if (string.IsNullOrEmpty(txtSdate.Text) | string.IsNullOrEmpty(txtEdate.Text) | string.IsNullOrEmpty(sxs.Text) | string.IsNullOrEmpty(sfz.Text) | string.IsNullOrEmpty(exs.Text) | string.IsNullOrEmpty(efz.Text))
                {
                    mydb.Alert("请选择开始日期或截止日期！");
                    return;
                }
            }
            else
            {
                ynxsstr = "否";
            }

            if (ynxs.Checked == true)
            {
                sdateStr = txtSdate.Text + " " + sxs.SelectedValue + sfz.SelectedValue + "00";
                edateStr = txtEdate.Text + " " + exs.SelectedValue + efz.SelectedValue + "00";
            }
            else
            {
                sdateStr = "";
                edateStr = "";
            }

            //判断附件 
            if (!string.IsNullOrEmpty(fj.PostedFile.FileName.Trim()))
            {
                try
                {
                    PathStr = fj.PostedFile.FileName;

                    if (fj.PostedFile.ContentLength < 1024 * int.Parse(lblAttachSize.Text))//判断附件大小是否小于1024*附件最大值参数 
                    {

                        type = PathStr.Substring((PathStr.LastIndexOf(".") + 1));
                        if (!string.IsNullOrEmpty(fjname.Text.Trim()))
                        {
                            FileName = fjname.Text + "." + type;
                        }
                        else
                        {
                            FileName = System.IO.Path.GetFileName(fj.PostedFile.FileName);
                        }

                        //if (!System.IO.Directory.Exists((Server.MapPath("..\\") + "mobileAttach\\oa\\rw\\" + UserName)))
                        //{
                        //    System.IO.Directory.CreateDirectory((Server.MapPath("..\\") + "mobileAttach\\oa\\rw\\" + UserName));
                        //}
                        Random TempNameInt = new Random();
                        string NewDocDirName = TempNameInt.Next(100000000).ToString();
                        if (!System.IO.Directory.Exists((Server.MapPath("..\\") + "mobileAttach\\oa\\rw\\" + UserName + "\\" + NewDocDirName)))
                        {
                            System.IO.Directory.CreateDirectory((Server.MapPath("..\\") + "mobileAttach\\oa\\rw\\" + UserName + "\\" + NewDocDirName));
                        }
                        TempNameInt = null;
                        fj.PostedFile.SaveAs((Server.MapPath("..\\") + "mobileAttach\\oa\\rw\\" + UserName + "\\" + NewDocDirName + "\\" + FileName));
                        FileVisualPathStr = "\\mobileAttach\\oa\\rw\\" + UserName + "\\" + NewDocDirName + "\\";
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

            //任务单号
            unitcode = DateTime.Now.Year.ToString("D2").Substring(0, 4) + DateTime.Now.Month.ToString("D2").Substring(0, 2) + DateTime.Now.Day.ToString("D2").Substring(0, 2);
            SqlDataReader datar = SqlHelper.ExecuteReader("select rwdh from OA_RWD01 where left(rwdh,8)='" + unitcode + "' order by rwdh desc");

            if (datar.Read())
            {
                unitcode = unitcode.Trim() + (Convert.ToInt32(datar["rwdh"].ToString().Substring(8, 3)) + 1).ToString("D3");
            }
            else
            {
                unitcode = unitcode + "001";
            }
            datar.Close();

            var jsdx1 = hkdb.GetStr(jsdx_real.Text);
            var qtld1 = hkdb.GetStr(qtld_real.Text);
            var zrld1 = hkdb.GetStr(zrld_real.Text);
            var zrr1 = hkdb.GetStr(zrr_real.Text);
            var qtbm1 = hkdb.GetStr(qtbm_real.Text);
            var zrbm1 = hkdb.GetStr(zrbm_real.Text);

            int newID = (Int32)SqlHelper.ExecuteScalar("insert into OA_RWD01(source,rwdh,rwbt,rwnr,jjcd,rwxz,ynxs,ksrq,jzrq,rwzt,fbr,fbsj,fjmc,fjlj,jsdx,fblx,qtld,zrld,zrr,qtbm,zrbm) values('" + hkdb.GetStr(rwly.Text) + "','" + unitcode + "', '" + hkdb.GetStr(rwbt.Text) + "', '" + editor.Value + "', '" + jjcd.SelectedValue + "', '" + rwxz.SelectedValue + "', '" + ynxsstr + "', '" + sdateStr + "', '" + edateStr + "', '已发布', '" + this.Session["userid"] + "', GETDATE(), '" + FileName + "', '" + FileVisualPathStr + "','" + jsdx1 + "','3','" + qtld1 + "','" + zrld1 + "','" + zrr1 + "','" + qtbm1 + "','" + zrbm1 + "')" + "SELECT CAST(scope_identity() AS int)");

            int i = 0;
            for (i = 0; i < (jsdx.Text.Split(',')).Length; i++)
            {
                SqlHelper.ExecuteSql("insert into OA_RWD02(ssrwid,jsr,jszt) values('" + newID + "','" + jsdx1.Split(',')[i] + "','未接收')");

            }

            //判断btn 
            if (s == "SaveAddBtn")
            {
                ynxs.Checked = false;
                txtSdate.Text = "";
                txtEdate.Text = "";
                sxs.SelectedValue = "";
                sfz.SelectedValue = "";
                exs.SelectedValue = "";
                efz.SelectedValue = "";
                rwxz.SelectedValue = "";
                fjname.Text = "";
                rwbt.Text = "";
                jjcd.SelectedValue = "中";
                editor.Value = "";
                mydb.Alert_Refresh("发布成功,请新增下一条记录！", "fbdbrw.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("发布成功！", "fbdbrw.aspx");
            }
        }
        #endregion

        #region 清空
        protected void Clear_Click(object sender, EventArgs e)
        {
            ynxs.Checked = false;
            txtSdate.Text = "";
            txtEdate.Text = "";
            sxs.SelectedValue = "";
            sfz.SelectedValue = "";
            exs.SelectedValue = "";
            efz.SelectedValue = "";
            rwxz.SelectedValue = "";
            fjname.Text = "";
            rwbt.Text = "";
            jjcd.SelectedValue = "中";
            editor.Value = "";
        }
        #endregion

        #region 选择接收人
        protected void Query_Click(object sender, EventArgs e)
        {
            ListViewBind();
        }


        //gv绑定 
        public void ListViewBind()
        {
            string Str1 = " WHERE UI_STATUS='正常' AND UI_LX='企业'";

            if (!string.IsNullOrEmpty(bm.SelectedItem.Value))
            {
                if (bm.SelectedItem.Value == "1000000")
                {
                    Str1 = Str1 + " and yn_bmglz='是'";
                }
                else
                {
                    Str1 = Str1 + " and ui_ssbm= '" + bm.SelectedItem.Value + "' ";
                }
            }
            if (!string.IsNullOrEmpty(cxtj.Text))
            {
                Str1 = Str1 + " AND (UI_ID LIKE '%" + hkdb.GetStr(cxtj.Text) + "%' OR UI_DESC LIKE '%" + hkdb.GetStr(cxtj.Text) + "%')";
            }
            AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from yh" + Str1);
            //DataSet ds = SqlHelper.ExecuteDs("select ui_id,ui_desc,ui_sex,ui_lx,(case when yn_bmglz='是' then 'ch' else 'noch' end)as yn_bmglz,b.bm_mc,c.zwmc from yh a left outer JOIN BM b on (a.ui_ssbm=b.bm_id)left outer JOIN ZW c on (a.ui_zw=c.zwid)" + Str1 + " order by a.number", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
            DataSet ds = SqlHelper.ExecuteDs("select ui_id,ui_desc,ui_sex,ui_lx,(case when yn_bmglz='是' then 'ch' else 'noch' end)as yn_bmglz,b.bm_mc,c.zwmc from yh a left outer JOIN BM b on (a.ui_ssbm=b.bm_id)left outer JOIN ZW c on (a.ui_zw=c.zwid)" + Str1 + " order by a.number", AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);

            ListView1.DataSource = ds;
            ListView1.DataBind();
        }
        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            ListViewBind();
        }
        #endregion


        #region  牵头领导
        protected void Query_Click1(object sender, EventArgs e)
        {
            ListViewBind2();
        }

        //gv绑定 
        public void ListViewBind2()
        {
            string Str1 = " where ui_status='正常' and ui_lx='企业'";

            if (!string.IsNullOrEmpty(bm1.SelectedItem.Value))
            {
                if (bm1.SelectedItem.Value == "1000000")
                {
                    Str1 = Str1 + " and yn_bmglz='是'";
                }
                else
                {
                    Str1 = Str1 + " and ui_ssbm= '" + bm1.SelectedItem.Value + "' ";
                }
            }
            if (!string.IsNullOrEmpty(cxtj1.Text))
            {
                Str1 = Str1 + " AND (UI_ID LIKE '%" + hkdb.GetStr(cxtj1.Text) + "%' OR UI_DESC LIKE '%" + hkdb.GetStr(cxtj1.Text) + "%')";
            }
            AspNetPager2.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from yh" + Str1);

            DataSet ds = SqlHelper.ExecuteDs("select ui_id,ui_desc,ui_sex,ui_lx,(case when yn_bmglz='是' then 'ch' else 'noch' end)as yn_bmglz,b.bm_mc,c.zwmc from yh a left outer JOIN BM b on (a.ui_ssbm=b.bm_id)left outer JOIN ZW c on (a.ui_zw=c.zwid)" + Str1 + "order by a.number", AspNetPager2.PageSize * (AspNetPager2.CurrentPageIndex - 1), AspNetPager2.PageSize);
            ListView2.DataSource = ds;
            ListView2.DataBind();
        }

        protected void AspNetPager2_PageChanged(object sender, System.EventArgs e)
        {
            ListViewBind2();
        }

        #endregion

        #region 责任领导 

        //查询 
        protected void Query_Click2(object sender, EventArgs e)
        {
            ListViewBind3();
        }

        //gv绑定 
        public void ListViewBind3()
        {
            string Str1 = " where ui_status='正常' and ui_lx='企业'";

            if (!string.IsNullOrEmpty(bm2.SelectedItem.Value))
            {
                if (bm2.SelectedItem.Value == "1000000")
                {
                    Str1 = Str1 + " and yn_bmglz='是'";
                }
                else
                {
                    Str1 = Str1 + " and ui_ssbm= '" + bm2.SelectedItem.Value + "' ";
                }
            }

            if (!string.IsNullOrEmpty(cxtj2.Text))
            {
                Str1 = Str1 + " AND (UI_ID LIKE '%" + hkdb.GetStr(cxtj2.Text) + "%' OR UI_DESC LIKE '%" + hkdb.GetStr(cxtj2.Text) + "%')";
            }
            AspNetPager3.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from yh" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select ui_id,ui_desc,ui_sex,ui_lx,(case when yn_bmglz='是' then 'ch' else 'noch' end)as yn_bmglz,b.bm_mc,c.zwmc from yh a left outer JOIN BM b on (a.ui_ssbm=b.bm_id)left outer JOIN ZW c on (a.ui_zw=c.zwid)" + Str1 + "order by a.number", AspNetPager3.PageSize * (AspNetPager3.CurrentPageIndex - 1), AspNetPager3.PageSize);
            ListView3.DataSource = ds;
            ListView3.DataBind();
        }

        protected void AspNetPager3_PageChanged(object sender, System.EventArgs e)
        {
            ListViewBind();
        }
        #endregion

        #region  责任人
        //查询 
        protected void Query_Click3(object sender, EventArgs e)
        {
            ListViewBind4();
        }

        //gv绑定 
        public void ListViewBind4()
        {
            string Str1 = " where ui_status='正常' and ui_lx='企业'";

            if (!string.IsNullOrEmpty(bm3.SelectedItem.Value))
            {
                if (bm3.SelectedItem.Value == "1000000")
                {
                    Str1 = Str1 + " and yn_bmglz='是'";
                }
                else
                {
                    Str1 = Str1 + " and ui_ssbm= '" + bm3.SelectedItem.Value + "' ";
                }
            }

            if (!string.IsNullOrEmpty(cxtj3.Text))
            {
                Str1 = Str1 + " AND (UI_ID LIKE '%" + hkdb.GetStr(cxtj3.Text) + "%' OR UI_DESC LIKE '%" + hkdb.GetStr(cxtj3.Text) + "%')";
            }
             AspNetPager4.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from yh" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select ui_id,ui_desc,ui_sex,ui_lx,(case when yn_bmglz='是' then 'ch' else 'noch' end)as yn_bmglz,b.bm_mc,c.zwmc from yh a left outer JOIN BM b on (a.ui_ssbm=b.bm_id)left outer JOIN ZW c on (a.ui_zw=c.zwid)" + Str1 + "order by a.number", AspNetPager4.PageSize * (AspNetPager4.CurrentPageIndex - 1), AspNetPager4.PageSize);
            ListView4.DataSource = ds;
            ListView4.DataBind();
        }

        protected void AspNetPager4_PageChanged(object sender, System.EventArgs e)
        {
            ListViewBind4();
        }

        #endregion

        #region 牵头部门

        //查询
        protected void Query_Click4(object sender, EventArgs e)
        {
            ListViewBind5();
        }

        //gv绑定 
        public void ListViewBind5()
        {
            string Str1 = "";
            if (!string.IsNullOrEmpty(cxtj4.Text))
            {
                Str1 = "where name like '%" + hkdb.GetStr(cxtj4.Text) + "%'";

            }
            AspNetPager5.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from OA_Rwfbdw" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select * from OA_Rwfbdw " + Str1 + "order by OA_Rwfbdw.name", AspNetPager5.PageSize * (AspNetPager5.CurrentPageIndex - 1), AspNetPager5.PageSize);
            ListView5.DataSource = ds;
            ListView5.DataBind();
        }
        protected void AspNetPager5_PageChanged(object sender, System.EventArgs e)
        {
            ListViewBind5();
        }
        #endregion

        #region  责任部门
        protected void Query_Click5(object sender, EventArgs e)
        {
            ListViewBind6();
        }

        //gv绑定 
        public void ListViewBind6()
        {
            string Str1 = "";
            if (!string.IsNullOrEmpty(cxtj5.Text))
            {
                Str1 = "where  bm_mc  like '%" + hkdb.GetStr(cxtj5.Text) + "%'";
            }
            AspNetPager6.RecordCount = (int)SqlHelper.ExecuteScalar("select count(*) from BM" + Str1);
            DataSet ds = SqlHelper.ExecuteDs("select * from BM " + Str1 + "order by BM.bm_mc", AspNetPager6.PageSize * (AspNetPager6.CurrentPageIndex - 1), AspNetPager6.PageSize);
            ListView6.DataSource = ds;
            ListView6.DataBind();
        }

        protected void AspNetPager6_PageChanged(object sender, System.EventArgs e)
        {
            ListViewBind6();
        }

        #endregion




    }

}