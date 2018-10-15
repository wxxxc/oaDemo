using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.workflow.work
{
    public partial class ArrangeWork_Add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public string LineW, QxString, QxStringSta, LineWSta;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                BindAttr();

                string sql_parid = "SELECT ffID,ffLine+ffName AS ffName FROM hk_WorkFlowFolder ORDER BY ffQxStr ASC";
                bd.Bind_DropDownList(dp_parid, sql_parid, "ffID", "ffName", "0", "根节点");

                if (Request.QueryString["id"] != null)
                {
                    dp_parid.SelectedValue = Request.QueryString["id"].ToString();
                }
            }
        }

        public void BindAttr()
        {
            SaveBtn.Attributes["onclick"] = "javascript:return chknull();";
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT TOP 1 * FROM hk_WorkFlowFolder WHERE ffID='" + dp_parid.SelectedValue + "'");
            if (dr.Read())
            {
                QxStringSta = dr["ffQxStr"].ToString();
                LineWSta = dr["ffLine"].ToString();
            }
            dr.Close();

            if (dp_parid.SelectedValue == "0")
            {
                SqlDataReader datar1 = SqlHelper.ExecuteReader("SELECT TOP 1 * FROM hk_WorkFlowFolder WHERE ffParid='0' ORDER BY ffQxStr DESC");
                if (datar1.Read())
                {
                    SqlDataReader datar11 = SqlHelper.ExecuteReader("SELECT TOP 1 * FROM hk_DeptKey WHERE dkID>(SELECT dkID FROM hk_DeptKey WHERE dkName='" + datar1["ffQxStr"] + "') ORDER BY dkName ASC");
                    if (datar11.Read())
                    {
                        QxString = datar11["dkName"].ToString();
                        LineW = "|-";
                    }
                    else
                    {
                        QxString = "aaaaa";
                        LineW = "|-";
                    }
                    datar11.Close();
                }
                else
                {
                    QxString = "aaaaa";
                    LineW = "|-";
                }
                datar1.Close();
            }
            else
            {
                SqlDataReader datar2 = SqlHelper.ExecuteReader("SELECT * FROM hk_WorkFlowFolder WHERE ffID='" + dp_parid.SelectedValue + "'");
                if (datar2.Read())
                {
                    if (datar2["ffQxStr"].ToString().Length == 5)
                    {
                        SqlDataReader datar22 = SqlHelper.ExecuteReader("SELECT TOP 1 * FROM hk_WorkFlowFolder WHERE ffQxStr LIKE '%" + datar2["ffQxStr"].ToString() + "%' AND LEN(ffQxStr)=9 ORDER BY ffQxStr DESC");
                        if (datar22.Read())
                        {
                            string qxint = null;
                            qxint = datar22["ffQxStr"].ToString().Substring(datar22["ffQxStr"].ToString().Length - 4, 3);
                            int qxint_s = int.Parse(qxint) + 1;
                            QxString = "" + QxStringSta + "" + qxint_s + "a";
                            LineW = "|---";
                        }
                        else
                        {
                            QxString = "" + QxStringSta + "100a";
                            LineW = "|---";
                        }
                        datar22.Close();
                    }
                    else
                    {
                        SqlDataReader datar23 = SqlHelper.ExecuteReader("SELECT TOP 1 * FROM hk_WorkFlowFolder WHERE ffQxStr like '%" + datar2["ffQxStr"].ToString() + "%' AND LEN(ffQxStr)=" + datar2["ffQxStr"].ToString().Length + "+4 ORDER BY ffQxStr DESC");
                        if (datar23.Read())
                        {
                            string qxint = null;
                            qxint = datar23["ffQxStr"].ToString().Substring(datar23["ffQxStr"].ToString().Length - 4, 3);
                            int qxint_s = int.Parse(qxint) + 1;
                            QxString = "" + QxStringSta + "" + qxint_s + "a";

                            LineW = "|-";
                            for (int i = 0; i < LineWSta.ToString().Length + 2; i++)
                            {
                                LineW = LineW + "-";
                            }
                        }
                        else
                        {
                            SqlDataReader datar24 = SqlHelper.ExecuteReader("SELECT TOP 1 * FROM hk_WorkFlowFolder WHERE ffQxStr LIKE '%" + datar2["ffQxStr"].ToString().Substring(0, datar2["ffQxStr"].ToString().Length - 4) + "%' AND LEN(ffQxStr)=" + datar2["ffQxStr"].ToString().Length + " ORDER BY ffQxStr DESC");
                            if (datar24.Read())
                            {
                                QxString = "" + QxStringSta + "100a";
                                LineW = "|-";
                                for (int i = 0; i < LineWSta.ToString().Length + 2; i++)
                                {
                                    LineW = LineW + "-";
                                }
                            }
                            datar24.Close();
                        }
                        datar23.Close();
                    }
                }
                datar2.Close();
            }

            SqlHelper.ExecuteSql("INSERT INTO hk_WorkFlowFolder(ffName,ffOrdid,ffParid,ffLine,FK_uid,ffQxStr) values ('" + hkdb.GetStr(Name.Text) + "','" + hkdb.GetStr(txt_ordid.Text) + "','" + hkdb.GetStr(dp_parid.SelectedValue) + "','" + LineW + "','" + this.Session["userid"] + "','" + QxString + "')");

            mydb.Alert_Parent("保存成功！", "ArrangeWork.aspx");
        }
    }
}
