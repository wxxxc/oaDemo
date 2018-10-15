using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace haoke365
{
    public class BindData_OA
    {
        //费用类型
        public void Bind_DropDownList_fylx(DropDownList MyDropDownList, string defaultValue, string defaultText, string sql)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT fyid,fymc FROM YS_FYLX WHERE sjfyid=0 " + sql + " ORDER BY fyid");
            while (dr.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = dr["fymc"].ToString();
                theItem.Value = dr["fyid"].ToString();
                MyDropDownList.Items.Add(theItem);
                AddItem_fylx(MyDropDownList, dr["fyid"].ToString(), 1, sql);
            }
            dr.Close();

            ListItem Item = new ListItem();
            Item.Text = defaultText;
            Item.Value = defaultValue;
            MyDropDownList.Items.Insert(0, Item);
        }
        public void AddItem_fylx(DropDownList MyDropDownList, string id, int level, string sql)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT fyid,fymc FROM YS_FYLX WHERE sjfyid=" + id + " " + sql + " ORDER BY fyid");
            string Str1 = "";
            int i = 0;
            for (i = 1; i <= level; i++)
            {
                Str1 = Str1 + "|—";
            }
            while (dr.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = Str1 + dr["fymc"].ToString();
                theItem.Value = dr["fyid"].ToString();
                MyDropDownList.Items.Add(theItem);
                AddItem_fylx(MyDropDownList, dr["fyid"].ToString(), level + 1, sql);
            }
            dr.Close();
        }
    }
}
