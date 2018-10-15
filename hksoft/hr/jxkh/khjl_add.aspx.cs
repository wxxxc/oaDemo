using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;
using System.Data;
using System.Web;
using System.Collections.Generic;

namespace hksoft.hr.jxkh
{
    public partial class khjl_add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("81111", "0");
                if (!string.IsNullOrEmpty(Request.QueryString["sd"]))
                {
                    DateTime txtbegstr = Convert.ToDateTime(Request.QueryString["sd"].ToString());
                    DateTime txtendstr = Convert.ToDateTime(Request.QueryString["sd"].ToString());
                    txtEdate.Text = txtendstr.ToString("yyyy-MM-dd");
                    txtSdate.Text = txtbegstr.ToString("yyyy-MM-dd");
                }
                else
                {
                    //txtEdate.Text = DateTime.Now.AddDays(0).ToString("yyyy-MM-dd");
                    DateTime d = DateTime.Now;
                    var dfirst = new DateTime(d.Year, d.Month, 1);
                    txtEdate.Text = dfirst.AddMonths(1).AddDays(-1).ToString("yyyy-MM-dd");
                    txtSdate.Text = dfirst.ToString("yyyy-MM-dd");
                }
                //附件大小10M
                lblAttachSize.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT P_STRING FROM hk_CSDA WHERE PARAMT='P_fj_size'"));
                GridViewBind();
                int i = 0;
                int ParentNode;
                int NodeId;
                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT XMID,XMMC,FZ,UPID FROM HR_Kpdf_Pfxm ORDER BY Pxh");
                TreeNode[] menuNodes = new TreeNode[100001];
                for (i = 0; i <= menuNodes.Length - 1; i++)
                {
                    menuNodes[i] = new TreeNode();
                }
                while (datar.Read())
                {
                    ParentNode = Convert.ToInt32(datar["UPID"]);
                    NodeId = Convert.ToInt32(datar["XMID"]);
                    menuNodes[NodeId].Text = datar["XMMC"].ToString() + "(" + datar["FZ"].ToString() + ")"
                        + "<input type=\"Text\" id=\"" + datar["XMID"].ToString() + "\" value=\"1\"  class=\"pf_times\" onblur=\"set_pftimes(this);\" style=\"width:30px;margin-left:5px;text-align: center;\">次";
                    menuNodes[NodeId].Value = datar["XMID"].ToString();
                    menuNodes[NodeId].SelectAction = TreeNodeSelectAction.None;
                    //menuNodes[NodeId].NavigateUrl = "#?times=" + "1";
                    //menuNodes[NodeId].Target = "rframe81102";
                    if (ParentNode != 0)
                    {
                        menuNodes[ParentNode].ChildNodes.Add(menuNodes[NodeId]);
                    }
                    else
                    {
                        TreeView1.Nodes.Add(menuNodes[NodeId]);
                    }
                }
                datar.Close();

            }
        }


        #region 保存
        protected void Save_Click(object sender, EventArgs e)
        {
            string id_times = times_temp.Text.ToString();
            Dictionary<string, string> dict = new Dictionary<string, string>();
            if (id_times != "")
            {
                id_times = id_times.Substring(0, id_times.Length - 1);
                string[] arr_id_times = id_times.Split(';');
                int n = 0;
                for (n = 0; n < arr_id_times.Length; n++)
                {
                    string id = arr_id_times[n].Split('|')[0];
                    string times = arr_id_times[n].Split('|')[1];
                    int itimes = Convert.ToInt32(times);
                    if (itimes != 1)
                    {
                        dict.Add(id, times);
                    }
                }
            }
            Button btn = (Button)sender;
            string s = btn.ID;
            string FileName = "";
            string FileVisualPathStr = "";
            string UserName = this.Session["userid"].ToString();
            string PathStr = null;
            string type = null;
            if (string.IsNullOrEmpty(txtSdate.Text) | string.IsNullOrEmpty(txtEdate.Text))
            {
                mydb.Alert("请选择开始日期或截止日期！");
                return;
            }

            //判断附件 
            //if (!string.IsNullOrEmpty(fj1.PostedFile.FileName.Trim()))
            //{
            //    try
            //    {
            //        PathStr = fj1.PostedFile.FileName;

            //        if (fj1.PostedFile.ContentLength < 1024 * int.Parse(lblAttachSize.Text))//判断附件大小是否小于1024*附件最大值参数 
            //        {

            //            type = PathStr.Substring((PathStr.LastIndexOf(".") + 1));
            //            if (!string.IsNullOrEmpty(fjname.Text.Trim()))
            //            {
            //                FileName = fjname.Text + "." + type;
            //            }
            //            else
            //            {
            //                FileName = System.IO.Path.GetFileName(fj1.PostedFile.FileName);
            //            }

            //            if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\hr\\khjl\\" + UserName)))
            //            {
            //                System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\hr\\khjl\\" + UserName));
            //            }
            //            Random TempNameInt = new Random();
            //            string NewDocDirName = TempNameInt.Next(100000000).ToString();
            //            if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\hr\\khjl\\" + UserName + "\\" + NewDocDirName)))
            //            {
            //                System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\hr\\khjl\\" + UserName + "\\" + NewDocDirName));
            //            }
            //            TempNameInt = null;
            //            fj1.PostedFile.SaveAs((Server.MapPath("..\\..\\") + "Attach\\hr\\khjl\\" + UserName + "\\" + NewDocDirName + "\\" + FileName));
            //            FileVisualPathStr = "\\Attach\\hr\\khjl\\" + UserName + "\\" + NewDocDirName + "\\";
            //        }
            //        else
            //        {
            //            mydb.Alert("保存失败,附件大小不能超过 " + lblAttachSize.Text + " KB！");
            //        }
            //    }
            //    catch (Exception ex)
            //    {
            //        throw ex;
            //    }
            //}
            #region 多个附件
            HttpFileCollection files = HttpContext.Current.Request.Files;
            for (int ifile = 0; ifile < files.Count; ifile++)
            {
                if (!string.IsNullOrEmpty(files[ifile].FileName.Trim()))
                {
                    try
                    {
                        PathStr = files[ifile].FileName;

                        if (files[ifile].ContentLength < 1024 * int.Parse(lblAttachSize.Text))//判断附件大小是否小于1024*附件最大值参数 
                        {

                            type = PathStr.Substring((PathStr.LastIndexOf(".") + 1));
                            if (!string.IsNullOrEmpty(fjname.Text.Trim()))
                            {
                                FileName = fjname.Text + "." + type;
                            }
                            else
                            {
                                var a = DateTime.Now.ToString("yyyyMMddHHmmssfff");
                                FileName =a+System.IO.Path.GetFileName(files[ifile].FileName);
                            }

                            //if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\hr\\khjl\\" + UserName)))
                            //{
                            //    System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\hr\\khjl\\" + UserName));
                            //}
                            Random TempNameInt = new Random();
                            string NewDocDirName = TempNameInt.Next(100000000).ToString();
                            if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\hr\\khjl\\" + UserName + "\\" + NewDocDirName)))
                            {
                                System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\hr\\khjl\\" + UserName + "\\" + NewDocDirName));
                            }
                            TempNameInt = null;
                            files[ifile].SaveAs((Server.MapPath("..\\..\\") + "Attach\\hr\\khjl\\" + UserName + "\\" + NewDocDirName + "\\" + FileName));
                            FileVisualPathStr += "\\Attach\\hr\\khjl\\" + UserName + "\\" + NewDocDirName + "\\" + FileName + ",";
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
            }
            #endregion



            string cal = "";
            string xms = "";
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
                        cal = cal + "," + GridView1.DataKeys[i].Value.ToString();
                    }
                }
            }
            foreach (TreeNode t in TreeView1.CheckedNodes)
            {
                if (t.Value != null && t.Value.Length > 0)
                {
                    xms += t.Value + ",";
                }
            }
            if (!string.IsNullOrEmpty(cal))
            {
                var cal1 = cal.Split(',');
                int j = 0;
                int k = 0;
                for (j = 0; j < cal1.Length; j++)
                {
                    if (!string.IsNullOrEmpty(xms))
                    {

                        var xms1 = xms.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries); ;
                        for (k = 0; k < xms1.Length; k++)
                        {
                            if (dict != null && dict.ContainsKey(xms1[k]))
                            {
                                string times_pf = dict[xms1[k]];
                                int itimes_pf = Convert.ToInt32(times_pf);
                                int m = 0;
                                for (m = 0; m < itimes_pf; m++)
                                {
                                    SqlHelper.ExecuteSql("insert into HR_Jxkhjl(id,yhid,xmid,begindate,enddate,createuser,createtime,fjmc,fjlj) values(NEWID(), '" + cal1[j] + "','" + xms1[k] + "','" + txtSdate.Text + "', '" + txtEdate.Text + "','" + this.Session["userid"] + "', GETDATE(), '" + FileName + "', '" + FileVisualPathStr + "')");
                                    double xmsc = Convert.ToDouble(SqlHelper.ExecuteScalar("select Fz from HR_Kpdf_Pfxm WHERE Xmid ='" + xms1[k] + "'"));
                                    double sc = Convert.ToDouble(SqlHelper.ExecuteScalar("select khscore from yh WHERE ui_id ='" + cal1[j] + "'"));
                                    SqlHelper.ExecuteSql("Update yh set khscore='" + (sc + xmsc) + "' WHERE ui_id='" + cal1[j] + "'");
                                }
                            }
                            else
                            {
                                SqlHelper.ExecuteSql("insert into HR_Jxkhjl(id,yhid,xmid,begindate,enddate,createuser,createtime,fjmc,fjlj) values(NEWID(), '" + cal1[j] + "','" + xms1[k] + "','" + txtSdate.Text + "', '" + txtEdate.Text + "','" + this.Session["userid"] + "', GETDATE(), '" + FileName + "', '" + FileVisualPathStr + "')");
                                double xmsc = Convert.ToDouble(SqlHelper.ExecuteScalar("select Fz from HR_Kpdf_Pfxm WHERE Xmid ='" + xms1[k] + "'"));
                                double sc = Convert.ToDouble(SqlHelper.ExecuteScalar("select khscore from yh WHERE ui_id ='" + cal1[j] + "'"));
                                SqlHelper.ExecuteSql("Update yh set khscore='" + (sc + xmsc) + "' WHERE ui_id='" + cal1[j] + "'");
                            }
                        }
                    }
                }
            }

            //判断btn 
            if (s == "SaveAddBtn")
            {
                fjname.Text = "";
                for (i = 0; i <= GridView1.Rows.Count - 1; i++)
                {
                    CheckBox cb = (CheckBox)GridView1.Rows[i].Cells[1].FindControl("del");
                    cb.Checked = false;
                }


                //清空父节点信息
                foreach (TreeNode node in TreeView1.Nodes)
                {
                    node.Checked = false;

                    ChildrenChecked(node);//调用清空子节点的信息
                }
                mydb.Alert_Refresh("保存成功,请新增下一条记录！", "khjl.aspx");
            }
            else
            {
                mydb.Alert_Refresh_Close("添加成功！", "khjl.aspx");
            }
        }
        #endregion


        #region  选择被考核人
        //gv绑定 
        public void GridViewBind()
        {
            string Str1 = " where  ui_status='正常' and ui_lx='企业'";
            if (!string.IsNullOrEmpty(query_content.Text))
            {
                Str1 = Str1 + " and ui_desc like '%" + hkdb.GetStr(query_content.Text) + "%' ";
            }

            DataSet ds = SqlHelper.ExecuteDs("select ui_id,ui_desc,ui_sex,ui_lx,(case when yn_bmglz='是' then 'ch' else 'noch' end)as yn_bmglz,b.bm_mc,c.zwmc from yh a left outer JOIN BM b on (a.ui_ssbm=b.bm_id)left outer JOIN ZW c on (a.ui_zw=c.zwid)" + Str1 + " order by a.ui_desc");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        #endregion



        #region  选择考核项目
        /// <summary>
        /// 清空子节点信息
        /// </summary>
        /// <param name="node"></param>
        private void ChildrenChecked(TreeNode node)
        {
            if (node.ChildNodes.Count > 0)
            {
                int i = 0;
                for (i = 0; i <= node.ChildNodes.Count - 1; i++)
                {
                    node.ChildNodes[i].Checked = false;
                    ChildrenChecked(node.ChildNodes[i]);
                }
            }
        }
        #endregion
    }
}