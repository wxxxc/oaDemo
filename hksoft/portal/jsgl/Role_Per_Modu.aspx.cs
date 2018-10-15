using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using haoke365;

namespace hkpro.portal.jsgl
{
    public partial class Role_Per_Modu : System.Web.UI.Page
    {
        mydb hkdb = new mydb();

        public StringBuilder seriesData = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("60302", "0");

                if (Request.QueryString["roleid"].ToString() == "1")
                {
                    mydb.Alert_Goto("为避免误操作，系统将不允许修改【超级管理员】角色的权限！", "role.aspx");
                }

                LabelRole.Text = Request.QueryString["rolename"];

                BindTree();
            }
        }

        //绑定Tree
        protected void BindTree()
        {
            //获取模块权限
            string strModu = "";
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT DISTINCT MODU_ID FROM QX WHERE ROLE_ID ='" + hkdb.GetStr(Request.QueryString["roleid"].ToString()) + "'");
            while (dr.Read())
            {
                strModu += dr["MODU_ID"].ToString() + ",";
            }
            dr.Close();

            hidSaveId.Value = strModu.TrimEnd(',');

            //查询Sql
            string Sql = "";
            if (this.Session["systype"].ToString() != "A")     //主登录页
            {
                if (this.Session["systype"].ToString() == "O")     //OA系统
                {
                    Sql = " AND MODU_LX IN('P','W','" + this.Session["systype"] + "')";
                }
                else
                {
                    Sql = " AND MODU_LX IN('P','" + this.Session["systype"] + "')";
                }
            }

            DataSet ds1 = SqlHelper.ExecuteDs("SELECT MODU_ID,MODU_MC FROM HK_MODU WHERE MODU_UPID=0 AND MODU_LX<>'G' AND MODU_ZT!='禁用' " + Sql + " ORDER BY ORDERID");

            seriesData.Append("[");
            for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
            {
                seriesData.Append("{");
                seriesData.Append("id:" + ds1.Tables[0].Rows[i]["MODU_ID"].ToString());
                seriesData.Append(",");
                seriesData.Append("name:\"" + ds1.Tables[0].Rows[i]["MODU_MC"].ToString() + "\"");
                seriesData.Append(",");
                seriesData.Append("pId:0");
                //选中
                string[] mystr1 = strModu.Split(',');
                for (int s = 0; s < mystr1.Length; s++)
                {
                    if (ds1.Tables[0].Rows[i]["MODU_ID"].ToString() == mystr1[s])
                    {
                        seriesData.Append(",");
                        seriesData.Append("checked:true");
                    }
                }
                seriesData.Append("}");
                //if (i != ds1.Tables[0].Rows.Count - 1)
                //{
                seriesData.Append(",");
                //}

                DataSet ds2 = SqlHelper.ExecuteDs("SELECT MODU_ID,MODU_MC,MODU_UPID FROM HK_MODU WHERE MODU_UPID='" + ds1.Tables[0].Rows[i]["modu_id"].ToString() + "' AND MODU_LX<>'G' AND MODU_ZT!='禁用' " + Sql + " ORDER BY ORDERID");
                for (int j = 0; j < ds2.Tables[0].Rows.Count; j++)
                {
                    seriesData.Append("{");
                    seriesData.Append("id:" + ds2.Tables[0].Rows[j]["MODU_ID"].ToString());
                    seriesData.Append(",");
                    seriesData.Append("name:\"" + ds2.Tables[0].Rows[j]["MODU_MC"].ToString() + "\"");
                    seriesData.Append(",");
                    seriesData.Append("pId:" + ds2.Tables[0].Rows[j]["MODU_UPID"].ToString());
                    //选中
                    string[] mystr2 = strModu.Split(',');
                    for (int s = 0; s < mystr2.Length; s++)
                    {
                        if (ds2.Tables[0].Rows[j]["MODU_ID"].ToString() == mystr2[s])
                        {
                            seriesData.Append(",");
                            seriesData.Append("checked:true");
                        }
                    }

                    seriesData.Append("}");
                    if (j != ds2.Tables[0].Rows.Count)
                    {
                        seriesData.Append(",");
                    }
                }
            }
            seriesData.Append("]");
        }

        //保存
        protected void Save_Click(object sender, EventArgs e)
        {
            //Demo
            if (hkdb.IsDemo("Y") == "true")
            {
                return;
            }

            //删除权限表
            SqlHelper.ExecuteSql("DELETE FROM QX WHERE ROLE_ID='" + hkdb.GetStr(Request.QueryString["roleid"].ToString()) + "'");

            //插入权限表
            string strModus = hidSaveId.Value;
            string[] mystr1 = strModus.Split(',');
            for (int s = 0; s < mystr1.Length; s++)
            {
                SqlHelper.ExecuteSql("INSERT INTO QX(MODU_ID,ROLE_ID) VALUES('" + mystr1[s] + "','" + hkdb.GetStr(Request.QueryString["roleid"].ToString()) + "')");
            }

            mydb.Alert_Goto("保存成功！", "role.aspx");
        }
    }
}
