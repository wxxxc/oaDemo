using System;
using System.Collections;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.flow
{
    public partial class WorkFlow_Node_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();   
        public string str, uvim;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT TOP 1 A.*,B.fName,C.wfName FROM hk_WorkFlowNode A LEFT OUTER JOIN hk_Form B ON(A.FK_fid=B.fID) LEFT OUTER JOIN hk_WorkFlow C ON(A.FK_wfid=C.wfID) WHERE FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "' ORDER BY fnNum DESC");
                if (dr.Read())
                {
                    fnPosition.SelectedValue = "中间段";
                    fnNum.Text += int.Parse(dr["fnNum"].ToString()) + 1;
                    lblfid.Text = dr["FK_fid"].ToString();
                    lblfno.Text = dr["FK_fno"].ToString();
                    lblfname.Text = dr["fName"].ToString();
                    lblwfid.Text = dr["FK_wfid"].ToString();
                    lblwfno.Text = dr["FK_wfno"].ToString();
                    lblwfname.Text = dr["wfName"].ToString();
                }
                else
                {
                    fnPosition.SelectedValue = "开始";
                    fnNum.Text = "1";

                    SqlDataReader dr1 = SqlHelper.ExecuteReader("SELECT A.*,B.fName FROM hk_WorkFlow A LEFT OUTER JOIN hk_Form B ON(A.FK_fid=B.fID) WHERE A.wfNo='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "'");
                    if (dr1.Read())
                    {
                        lblfid.Text = dr1["FK_fid"].ToString();
                        lblfno.Text = dr1["FK_fno"].ToString();
                        lblfname.Text = dr1["fName"].ToString();
                        lblwfid.Text = dr1["wfID"].ToString();
                        lblwfno.Text = dr1["wfNo"].ToString();
                        lblwfname.Text = dr1["wfName"].ToString();
                    }
                    dr1.Close();
                }
                dr.Close();

                BindDplist();
            }

            if (!IsPostBack)
            {
                Random g = new Random();
                string rad = g.Next(10000).ToString();
                lblNodeNo.Text = "" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + System.DateTime.Now.Hour.ToString() + "" + System.DateTime.Now.Minute.ToString() + "" + System.DateTime.Now.Second.ToString() + "" + System.DateTime.Now.Millisecond.ToString() + "" + rad + "";
            }
        }

        public void BindDplist()
        {
            SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT fnNum,fnName FROM hk_WorkFlowNode WHERE FK_wfno ='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "'");
            while (datar1.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = datar1["fnName"].ToString();
                theItem.Value = datar1["fnNum"].ToString();
                SourceListBox.Items.Add(theItem);
            }
            datar1.Close();
        }

        //确定
        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            //判断序号是否重复
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNode WHERE FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "' AND fnNum='" + hkdb.GetStr(fnNum.Text) + "'");
            if (dr.Read())
            {
                dr.Close();
                mydb.Alert("提交失败，序号重复！");
                return;
            }
            dr.Close();

            //判断是否已存在开始步骤
            if (fnPosition.SelectedValue == "开始")
            {
                SqlDataReader dr2 = SqlHelper.ExecuteReader("SELECT TOP 1 * FROM hk_WorkFlowNode WHERE FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "' AND fnPosition='开始'");
                if (dr2.Read())
                {
                    dr2.Close();
                    mydb.Alert("提交失败，【开始]】步骤已经存在！");
                    return;
                }
                dr2.Close();
            }

            int SETLEFT, SETTOP, SETLEFT1, SETTOP1, Pnum;
            Pnum = int.Parse(fnNum.Text) + 1;
            string LineContent = null, lblnextnodenum = null;

            //边距
            SqlDataReader dr4 = SqlHelper.ExecuteReader("SELECT TOP 1 * FROM hk_WorkFlowNode WHERE FK_wfno='" + hkdb.GetStr(Request.QueryString["FlowNumber"]) + "' AND fnNum<'" + hkdb.GetStr(fnNum.Text) + "' ORDER BY fnNum DESC");
            if (dr4.Read())
            {
                SETTOP = int.Parse(dr4["TopMargin"].ToString());
                if (SETTOP == 20)
                {
                    SETTOP1 = 200;
                }
                else
                {
                    SETTOP1 = 20;
                }

                SETLEFT = int.Parse(dr4["fnNum"].ToString());

                if (SETLEFT % 2 == 0)
                {
                    SETLEFT1 = int.Parse(dr4["LeftMargin"].ToString()) + 180;
                }
                else
                {
                    SETLEFT1 = int.Parse(dr4["LeftMargin"].ToString());
                }
            }
            else
            {
                SETLEFT1 = 20;
                SETTOP1 = 20;
            }
            dr4.Close();

            //是否有已选步骤
            if (TargetListBox.Items.Count > 0)
            {
                for (int i = 0; i <= TargetListBox.Items.Count - 1; i++)
                {
                    str = "" + TargetListBox.Items[i].Value + ",";
                    uvim = str.Remove(str.LastIndexOf(","), 1);
                    ArrayList myarr = new ArrayList();
                    string[] mystr = uvim.Split(',');
                    for (int s = 0; s < mystr.Length; s++)
                    {
                        myarr.Add(mystr[s].ToString());
                        LineContent = "<vml:line title=\"\" style=\"DISPLAY: none; Z-INDEX: 2; POSITION: absolute\" to=\"0,0\" from=\"0,0\" coordsize=\"21600,21600\" arcsize=\"4321f\" object=\"" + mystr[s] + "\" source=\"" + fnNum.Text + "\" mfrID=\"" + fnNum.Text + "\"><vml:stroke endarrow=\"block\"></vml:stroke><vml:shadow offset=\"1px,1px\" color=\"#b3b3b3\" type=\"single\" on=\"T\"></vml:shadow></vml:line>";
                        SqlHelper.ExecuteSql("INSERT INTO hk_WorkFlowNodeLine(StartNum,EndNum,nlContent,FK_fnno,FK_wfno) VALUES('" + hkdb.GetStr(fnNum.Text) + "','" + mystr[s] + "','" + LineContent + "','" + lblNodeNo.Text + "','" + lblwfno.Text + "')");

                        lblnextnodenum += "" + mystr[s] + ",";
                    }
                }

                SqlHelper.ExecuteSql("INSERT INTO hk_WorkFlowNode(ynEditAtt,ynDelAtt,FK_fid,FK_fno,FK_wfid,FK_wfno,fnNo,fnNum,fnName,LeftMargin,TopMargin,fnUserIDs,fnUserNames,fnDeptIDs,fnDeptNames,fnRoleIDs,fnRoleNames,ReviewMode,SelectMode,TimeLimit,ynEndAudi,FK_uid,FK_did,fnQxStr,FK_rid,AddTime,NextNodeNum,fnPosition) values ('" + hkdb.GetStr(ynEditAtt.SelectedValue) + "','" + hkdb.GetStr(ynDelAtt.SelectedValue) + "','" + lblfid.Text + "','" + lblfno.Text + "','" + lblwfid.Text + "','" + lblwfno.Text + "','" + lblNodeNo.Text + "','" + hkdb.GetStr(fnNum.Text) + "','" + hkdb.GetStr(fnName.Text) + "','" + SETLEFT1 + "','" + SETTOP1 + "','0','未设置','0','未设置','0','未设置','" + ReviewMode.SelectedValue + "','" + SelectMode.SelectedValue + "','" + hkdb.GetStr(TimeLimit.Text) + "','" + ynEndAudi.SelectedValue + "','" + this.Session["userid"] + "','" + this.Session["deptid"] + "','" + this.Session["deptqx"] + "','" + this.Session["roleid"] + "',GETDATE(),'" + lblnextnodenum + "','" + fnPosition.SelectedValue + "')");
            }
            else
            {
                SqlHelper.ExecuteSql("INSERT INTO hk_WorkFlowNode(ynEditAtt,ynDelAtt,NextNodeNum,FK_fid,FK_fno,FK_wfid,FK_wfno,fnNo,fnNum,fnName,LeftMargin,TopMargin,fnUserIDs,fnUserNames,fnDeptIDs,fnDeptNames,fnRoleIDs,fnRoleNames,ReviewMode,SelectMode,TimeLimit,ynEndAudi,FK_uid,FK_did,fnQxStr,FK_rid,AddTime,fnPosition) values ('" + hkdb.GetStr(ynEditAtt.SelectedValue) + "','" + hkdb.GetStr(ynDelAtt.SelectedValue) + "','','" + lblfid.Text + "','" + lblfno.Text + "','" + lblwfid.Text + "','" + lblwfno.Text + "','" + lblNodeNo.Text + "','" + hkdb.GetStr(fnNum.Text) + "','" + hkdb.GetStr(fnName.Text) + "','" + SETLEFT1 + "','" + SETTOP1 + "','0','未设置','0','未设置','0','未设置','" + ReviewMode.SelectedValue + "','" + SelectMode.SelectedValue + "','" + hkdb.GetStr(TimeLimit.Text) + "','" + ynEndAudi.SelectedValue + "','" + this.Session["userid"] + "','" + this.Session["deptid"] + "','" + this.Session["deptqx"] + "','" + this.Session["roleid"] + "',GETDATE(),'" + fnPosition.SelectedValue + "')");
            }

            mydb.Alert_Reload_Close("保存成功");
        }

        //单选
        protected void Button2_Click(object sender, EventArgs e)
        {
            int i = 0;

            while (i <= SourceListBox.Items.Count - 1)
            {
                if (SourceListBox.Items[i].Selected)
                {
                    if (TargetListBox.Items.IndexOf(SourceListBox.Items[i]) >= 0)
                    {
                        mydb.Alert("此项已经存在！");
                        return;
                    }

                    TargetListBox.Items.Add(new ListItem(SourceListBox.Items[i].Text, SourceListBox.Items[i].Value));
                    SourceListBox.Items.Remove(SourceListBox.Items[i]);
                }
                else
                    i += 1;
            }
        }

        //全选
        protected void Button5_Click(object sender, EventArgs e)
        {
            if (SourceListBox.Items.Count > 0)
            {
                foreach (ListItem MyItem in SourceListBox.Items)
                    TargetListBox.Items.Add(MyItem);
                SourceListBox.Items.Clear();
            }
        }

        //单消
        protected void Button4_Click(object sender, EventArgs e)
        {
            int i = 0;

            while (i <= TargetListBox.Items.Count - 1)
            {
                if (TargetListBox.Items[i].Selected)
                {
                    SourceListBox.Items.Add(new ListItem(TargetListBox.Items[i].Text, TargetListBox.Items[i].Value));
                    TargetListBox.Items.Remove(TargetListBox.Items[i]);
                }
                else
                    i += 1;
            }
        }

        //全消
        protected void Button6_Click(object sender, EventArgs e)
        {
            if (TargetListBox.Items.Count > 0)
            {
                foreach (ListItem MyItem in TargetListBox.Items)
                    SourceListBox.Items.Add(MyItem);
                TargetListBox.Items.Clear();
            }
        }
    }
}
