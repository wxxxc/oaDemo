using System;
using System.Collections;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.flow
{
    public partial class WorkFlow_Node_Base : System.Web.UI.Page
    {
        mydb hkdb = new mydb(); 
        public string str, uvim;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                BindAttr();

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowNode WHERE fnID='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (dr.Read())
                {
                    lblNodeNo.Text = dr["fnNo"].ToString();
                    fnNum.Text = dr["fnNum"].ToString();
                    lblwfno.Text = dr["FK_wfno"].ToString();
                    fnName.Text = dr["fnName"].ToString();
                    ReviewMode.SelectedValue = dr["ReviewMode"].ToString();
                    SelectMode.SelectedValue = dr["SelectMode"].ToString();
                    TimeLimit.Text = dr["TimeLimit"].ToString();
                    lblynEndAudi.SelectedValue = dr["ynEndAudi"].ToString();
                    lblnextnodenum.Text = dr["NextNodeNum"].ToString();
                    fnPosition.SelectedValue = dr["fnPosition"].ToString();
                    ynDelAtt.SelectedValue = dr["ynDelAtt"].ToString();
                    ynEditAtt.SelectedValue = dr["ynEditAtt"].ToString();
                }
                dr.Close();

                BindDplist();
            }
        }

        public void BindDplist()
        {
            string strlist_n = null, str_n = null;
            str_n = "" + lblnextnodenum.Text + "";
            ArrayList myarr_n = new ArrayList();
            string[] mystr_n = str_n.Split(',');
            for (int s = 0; s < mystr_n.Length; s++)
            {
                strlist_n += "'" + mystr_n[s] + "',";
            }
            strlist_n += "'0'";

            //已提交
            SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT fnNum,fnName FROM hk_WorkFlowNode WHERE fnNum IN (" + strlist_n + ") AND FK_wfno='" + lblwfno.Text + "'");
            while (datar1.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = datar1["fnName"].ToString();
                theItem.Value = datar1["fnNum"].ToString();
                TargetListBox.Items.Add(theItem);
            }
            datar1.Close();

            //未提交
            SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT fnNum,fnName FROM hk_WorkFlowNode WHERE fnNum NOT IN (" + strlist_n + ") AND FK_wfno='" + lblwfno.Text + "'");
            while (datar2.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = datar2["fnName"].ToString();
                theItem.Value = datar2["fnNum"].ToString();
                SourceListBox.Items.Add(theItem);
            }
            datar2.Close();
        }

        public void BindAttr()
        {
            fnNum.Attributes.Add("readonly", "readonly");
        }

        //确定
        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            string LineContent = null, lblnextnodenum = null;

            //删除Line
            SqlHelper.ExecuteSql("DELETE FROM hk_WorkFlowNodeLine WHERE StartNum='" + hkdb.GetStr(fnNum.Text) + "' and FK_wfno='" + lblwfno.Text + "'");

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

                        SqlHelper.ExecuteSql("INSERT INTO hk_WorkFlowNodeLine(StartNum,EndNum,nlContent,FK_fnno,FK_wfno) values ('" + hkdb.GetStr(fnNum.Text) + "','" + mystr[s] + "','" + LineContent + "','" + lblNodeNo.Text + "','" + lblwfno.Text + "')");
                        lblnextnodenum += "" + mystr[s] + ",";
                    }
                }

                SqlHelper.ExecuteSql("UPDATE hk_WorkFlowNode Set ynDelAtt='" + ynDelAtt.SelectedValue + "',ynEditAtt='" + ynEditAtt.SelectedValue + "',fnName='" + hkdb.GetStr(fnName.Text) + "',ReviewMode='" + hkdb.GetStr(ReviewMode.SelectedValue) + "',SelectMode='" + hkdb.GetStr(SelectMode.SelectedValue) + "',TimeLimit='" + hkdb.GetStr(TimeLimit.Text) + "',ynEndAudi='" + lblynEndAudi.SelectedValue + "',NextNodeNum='" + lblnextnodenum + "',fnPosition='" + fnPosition.SelectedValue + "' WHERE fnID='" + int.Parse(Request.QueryString["id"]) + "'");
            }
            else
            {
                SqlHelper.ExecuteSql("UPDATE hk_WorkFlowNode Set ynDelAtt='" + ynDelAtt.SelectedValue + "',ynEditAtt='" + ynEditAtt.SelectedValue + "',fnName='" + hkdb.GetStr(fnName.Text) + "',ReviewMode='" + hkdb.GetStr(ReviewMode.SelectedValue) + "',SelectMode='" + hkdb.GetStr(SelectMode.SelectedValue) + "',TimeLimit='" + hkdb.GetStr(TimeLimit.Text) + "',ynEndAudi='" + lblynEndAudi.SelectedValue + "',NextNodeNum='',fnPosition='" + fnPosition.SelectedValue + "' WHERE fnID='" + int.Parse(Request.QueryString["id"]) + "'");
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
