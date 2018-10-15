using System;
using System.Data.SqlClient;
using System.Web.UI;
using haoke365;

namespace hkpro.portal.dxgl
{
    public partial class Dxzhye : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("10904", "10904");

                SqlDataReader dr = SqlHelper.ExecuteReader("SELECT * FROM DXZH");
                if (dr.Read())
                {
                    yhm.Text = dr["tid"].ToString();
                    ptmm.Text = dr["tpd"].ToString();
                    fwq.SelectedValue = dr["fwq"].ToString();
                    cscs.Text = dr["cscs"].ToString();
                    bjye.Text = dr["bjye"].ToString();
                    txsj.Text = dr["txsj"].ToString();
                    if (dr["ynrz"].ToString() == "是")
                    {
                        ynrz.Checked = true;
                    }
                    dqye.Text = dr["dqye"].ToString();
                }
                dr.Close();
            }
        }

        //保存 
        protected void Save_Click(object sender, EventArgs e)
        {
            string ynrzstr = hkdb.GetValueChk_Str(ynrz.Checked);

            SqlHelper.ExecuteSql("DELETE FROM DXZH");
            SqlHelper.ExecuteSql("INSERT INTO DXZH VALUES('" + hkdb.GetStr(yhm.Text) + "','" + hkdb.GetStr(ptmm.Text) + "','" + hkdb.GetStr(fwq.SelectedValue) + "','" + hkdb.GetStr(cscs.Text) + "','" + hkdb.GetStr(bjye.Text) + "','" + hkdb.GetStr(txsj.Text) + "','" + ynrzstr + "','" + hkdb.GetStr(dqye.Text) + "','" + this.Session["userid"] + "',GETDATE())");
            mydb.Alert("保存成功！");
        }
    }
}
