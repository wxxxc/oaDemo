using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;

namespace haoke365
{
    public class BindData_HR
    {
        //评分项目
        public void Bind_DropDownList_pfxm(DropDownList MyDropDownList, string defaultValue, string defaultText, string sql)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT XMID,XMMC FROM HR_Kpdf_Pfxm WHERE UPID=0 " + sql + " ORDER BY PXH");
            while (dr.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = dr["XMMC"].ToString();
                theItem.Value = dr["XMID"].ToString();
                MyDropDownList.Items.Add(theItem);
                AddItem_pfxm(MyDropDownList, dr["XMID"].ToString(), 1, sql);
            }
            dr.Close();

            ListItem Item = new ListItem();
            Item.Text = defaultText;
            Item.Value = defaultValue;
            MyDropDownList.Items.Insert(0, Item);
        }
        public void AddItem_pfxm(DropDownList MyDropDownList, string id, int level, string sql)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT XMID,XMMC FROM HR_Kpdf_Pfxm WHERE UPID=" + id + " " + sql + " ORDER BY PXH");
            string Str1 = "";
            int i = 0;
            for (i = 1; i <= level; i++)
            {
                Str1 = Str1 + "|—";
            }
            while (dr.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = Str1 + dr["XMMC"].ToString();
                theItem.Value = dr["XMID"].ToString();
                MyDropDownList.Items.Add(theItem);
                AddItem_pfxm(MyDropDownList, dr["XMID"].ToString(), level + 1, sql);
            }
            dr.Close();
        }
    }
}