using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.portal.xzgl
{
    public partial class Ygtxl_lb_add : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        public string LineW, QxString, QxStringSta, LineWSta;
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("11310", "0");

                BindAttr();

                string sql_down_bh = "select id,Linew+name as aaa from hk_Ygtxl_lb order by QxString asc";
                bd.Bind_DropDownList(ParentNodesID, sql_down_bh, "id", "aaa", "0", "根节点");

                if (Request.QueryString["typeId"] != null)
                {
                    ParentNodesID.SelectedValue = Request.QueryString["typeId"].ToString();
                }
            }
        }

        public void BindAttr()
        {
            Button1.Attributes["onclick"] = "javascript:return chknull();";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataReader dr_sta = SqlHelper.ExecuteReader("select top 1 * from hk_Ygtxl_lb where id='" + ParentNodesID.SelectedValue + "'");
            if (dr_sta.Read())
            {
                QxStringSta = dr_sta["QxString"].ToString();
                LineWSta = dr_sta["LineW"].ToString();
            }
            dr_sta.Close();

            if (ParentNodesID.SelectedValue == "0")
            {
                SqlDataReader dr = SqlHelper.ExecuteReader("select top 1 * from hk_Ygtxl_lb where ParentNodesID='0' order by QxString desc");
                if (dr.Read())
                {
                    SqlDataReader drt_key = SqlHelper.ExecuteReader("select  top 1 * from hk_DeptKey where dkid>(select dkid from hk_DeptKey where dkname='" + dr["QxString"] + "') order by dkname asc");
                    if (drt_key.Read())
                    {
                        QxString = drt_key["dkname"].ToString();
                        LineW = "|-";
                    }
                    else
                    {
                        QxString = "aaaaa";
                        LineW = "|-";
                    }
                    drt_key.Close();
                }
                else
                {
                    QxString = "aaaaa";
                    LineW = "|-";
                }
                dr.Close();
            }
            else
            {
                SqlDataReader dr = SqlHelper.ExecuteReader("select * from hk_Ygtxl_lb where id='" + ParentNodesID.SelectedValue + "'");
                if (dr.Read())
                {
                    if (dr["QxString"].ToString().Length == 5)
                    {
                        SqlDataReader drt_key = SqlHelper.ExecuteReader("select top 1 * from hk_Ygtxl_lb where QxString like '%" + dr["QxString"].ToString() + "%' and  len(QxString)=9 order by QxString desc");
                        if (drt_key.Read())
                        {
                            string qxint = null;
                            qxint = drt_key["QxString"].ToString().Substring(drt_key["QxString"].ToString().Length - 4, 3);
                            int qxint_s = int.Parse(qxint) + 1;
                            QxString = "" + QxStringSta + "" + qxint_s + "a";
                            LineW = "|---";
                        }
                        else
                        {
                            QxString = "" + QxStringSta + "100a";
                            LineW = "|---";
                        }
                        drt_key.Close();
                    }
                    else
                    {
                        SqlDataReader drt_key = SqlHelper.ExecuteReader("select  top 1 * from hk_Ygtxl_lb where  QxString like '%" + dr["QxString"].ToString() + "%' and  len(QxString)=" + dr["QxString"].ToString().Length + "+4 order by QxString desc");
                        if (drt_key.Read())
                        {
                            string qxint = null;
                            qxint = drt_key["QxString"].ToString().Substring(drt_key["QxString"].ToString().Length - 4, 3);
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
                            SqlDataReader drt_key1 = SqlHelper.ExecuteReader("select  top 1 * from hk_Ygtxl_lb where  QxString like '%" + dr["QxString"].ToString().Substring(0, dr["QxString"].ToString().Length - 4) + "%' and  len(QxString)=" + dr["QxString"].ToString().Length + " order by QxString desc");
                            if (drt_key1.Read())
                            {
                                QxString = "" + QxStringSta + "100a";
                                LineW = "|-";
                                for (int i = 0; i < LineWSta.ToString().Length + 2; i++)
                                {
                                    LineW = LineW + "-";
                                }
                            }
                        }
                        drt_key.Close();
                    }
                }
                dr.Close();
            }

            SqlHelper.ExecuteSql("insert into hk_Ygtxl_lb(Name,PxNum,ParentNodesID,LineW,Username,Realname,QxString) values ('" + hkdb.GetStr(Name.Text) + "','" + PxNum.Text + "','" + hkdb.GetStr(ParentNodesID.SelectedValue) + "','" + LineW + "','" + Session["userid"] + "','" + Session["username"] + "','" + QxString + "')");

            mydb.InsertLog("新增部门[" + Name.Text + "]", "11310");

            if (CheckBox1.Checked == true)
            {
                this.Response.Write("<script language=javascript>alert('提交成功！'); window.parent.lhead.location = 'Ygtxl_l.aspx'</script>");
            }
            else
            {
                this.Response.Write("<script language=javascript>alert('提交成功！'); window.parent.lhead.location = 'Ygtxl_l.aspx';window.location.href='Ygtxl_r.aspx'</script>");
            }
        }
    }
}