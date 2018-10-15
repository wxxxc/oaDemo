using System;
using System.Collections;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.flow
{
    public partial class WorkFlow_Node_Write : System.Web.UI.Page
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
                    lblfnNum.Text = dr["fnNum"].ToString();
                    lblwfno.Text = dr["FK_wfno"].ToString();
                    lblfnName.Text = dr["fnName"].ToString();
                    lblfno.Text = dr["FK_fno"].ToString();
                    lblfnWriteID.Text = dr["fnWriteID"].ToString();
                }
                dr.Close();

                BindDplist();
            }
        }

        public void BindDplist()
        {
            string strlist_n = null, str_n = null;
            str_n = "" + lblfnWriteID.Text + "";
            ArrayList myarr_n = new ArrayList();
            string[] mystr_n = str_n.Split(',');
            for (int s = 0; s < mystr_n.Length; s++)
            {
                strlist_n += "'" + mystr_n[s] + "',";
            }
            strlist_n += "'0'";

            //已提交
            SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT clID,clName FROM hk_FormColumn WHERE clID IN (" + strlist_n + ") AND FK_fno='" + lblfno.Text + "' AND clType!='[电子印章]'");
            while (datar1.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = datar1["clName"].ToString();
                theItem.Value = datar1["clID"].ToString();
                TargetListBox.Items.Add(theItem);
            }
            datar1.Close();
            
            //未提交
            SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT clID,clName FROM hk_FormColumn WHERE clID NOT IN (" + strlist_n + ") AND FK_fno='" + lblfno.Text + "' AND clType!='[电子印章]'");
            while (datar2.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = datar2["clName"].ToString();
                theItem.Value = datar2["clID"].ToString();
                SourceListBox.Items.Add(theItem);
            }
            datar2.Close();
        }

        public void BindAttr()
        {
            lblfnNum.Attributes.Add("readonly", "readonly");
            lblfnName.Attributes.Add("readonly", "readonly");
        }

        //确定
        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            string lblfnWriteID = null, lblfnWriteName = null;

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
                        SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM hk_FormColumn WHERE clID='" + mystr[s] + "'");
                        if (dr.Read())
                        {
                            lblfnWriteID += "" + dr["clID"].ToString() + ",";
                            lblfnWriteName += "" + dr["clName"].ToString() + ",";
                        }
                        dr.Close();
                    }
                }

                SqlHelper.ExecuteSql("UPDATE hk_WorkFlowNode SET fnWriteID='" + lblfnWriteID + "',fnWriteName='" + lblfnWriteName + "' WHERE fnID='" + int.Parse(Request.QueryString["id"]) + "'");
            }
            else
            {
                SqlHelper.ExecuteSql("UPDATE hk_WorkFlowNode SET fnWriteID='',fnWriteName='' WHERE fnID='" + int.Parse(Request.QueryString["id"]) + "'");
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
