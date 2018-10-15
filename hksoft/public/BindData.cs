using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;

namespace haoke365
{
    public class BindData
    {
        //下拉列表_常规
        public void Bind_DropDownList(DropDownList MyDropDownList, string SQL, string DataValueField, string DataTextField, string DefaultValue, string DefaultText)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader(SQL);
            while (dr.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = dr[DataTextField].ToString();
                theItem.Value = dr[DataValueField].ToString();
                MyDropDownList.Items.Add(theItem);
            }
            dr.Close();

            ListItem Item = new ListItem();
            Item.Text = DefaultText;
            Item.Value = DefaultValue;
            MyDropDownList.Items.Insert(0, Item);
        }

        //下拉列表_常规(无空行)
        public void Bind_DropDownList_NoBlank(DropDownList MyDropDownList, string SQL, string DataValueField, string DataTextField, string DefaultValue, string DefaultText)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader(SQL);
            while (dr.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = dr[DataTextField].ToString();
                theItem.Value = dr[DataValueField].ToString();
                MyDropDownList.Items.Add(theItem);
            }
            dr.Close();
        }

        //下拉列表_部门
        public void Bind_DropDownList_bm(DropDownList MyDropDownList, string defaultValue, string defaultText, string sql)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT BM_ID,BM_MC FROM BM WHERE BM_SJBM=0 " + sql + " ORDER BY BM_ID");
            while (dr.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = dr["BM_MC"].ToString();
                theItem.Value = dr["BM_ID"].ToString();
                MyDropDownList.Items.Add(theItem);
                AddItem_bm(MyDropDownList, dr["BM_ID"].ToString(), 1, sql);
            }
            dr.Close();

            ListItem Item = new ListItem();
            Item.Text = defaultText;
            Item.Value = defaultValue;
            MyDropDownList.Items.Insert(0, Item);
        }
        public void AddItem_bm(DropDownList MyDropDownList, string id, int level, string sql)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT BM_ID,BM_MC FROM BM WHERE BM_SJBM=" + id + " " + sql + " ORDER BY BM_ID");
            string Str1 = "";
            int i = 0;
            for (i = 1; i <= level; i++)
            {
                Str1 = Str1 + "|—";
            }
            while (dr.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = Str1 + dr["BM_MC"].ToString();
                theItem.Value = dr["BM_ID"].ToString();
                MyDropDownList.Items.Add(theItem);
                AddItem_bm(MyDropDownList, dr["BM_ID"].ToString(), level + 1, sql);
            }
            dr.Close();
        }

        //下拉列表_用户
        public void Bind_DropDownList_yh(DropDownList MyDropDownList, string defaultValue, string defaultText, string sql)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT UI_ID,UI_DESC FROM YH WHERE UI_LX='企业' AND UI_STATUS='正常' " + sql + " ORDER BY UI_DESC");
            while (dr.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = dr["UI_DESC"].ToString();
                theItem.Value = dr["UI_ID"].ToString();
                MyDropDownList.Items.Add(theItem);
            }
            dr.Close();

            ListItem Item = new ListItem();
            Item.Text = defaultText;
            Item.Value = defaultValue;
            MyDropDownList.Items.Insert(0, Item);
        }

        //下拉列表_网盘
        public void Bind_DropDownList_disk(DropDownList MyDropDownList, string defaultValue, string defaultText)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT DIRID,NAME FROM HK_NETDISK_DIR WHERE PARENTID=0 AND USERID='" + HttpContext.Current.Session["userid"] + "'");
            while (dr.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = dr["NAME"].ToString();
                theItem.Value = dr["DIRID"].ToString();
                MyDropDownList.Items.Add(theItem);
                AddItem_disk(MyDropDownList, dr["DIRID"].ToString(), 1);
            }
            dr.Close();

            ListItem Item = new ListItem();
            Item.Text = defaultText;
            Item.Value = defaultValue;
            MyDropDownList.Items.Insert(0, Item);
        }
        public void AddItem_disk(DropDownList MyDropDownList, string id, int level)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT DIRID,NAME FROM HK_NETDISK_DIR WHERE PARENTID= " + id + " AND USERID='" + HttpContext.Current.Session["userid"] + "'");
            string Str1 = "";
            int i = 0;
            for (i = 1; i <= level; i++)
            {
                Str1 = Str1 + "|—";
            }
            while (dr.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = Str1 + dr["NAME"].ToString();
                theItem.Value = dr["DIRID"].ToString();
                MyDropDownList.Items.Add(theItem);
                AddItem_disk(MyDropDownList, dr["DIRID"].ToString(), level + 1);
            }
            dr.Close();
        }

        /// <summary>
        /// 下拉框(适用于大量数据的DropDownList绑定)
        /// </summary>
        /// <param name="dt">绑定的数据源</param>
        /// <param name="parentId">上一级的id名称</param>
        /// <param name="colId">值名称</param>
        /// <param name="colName">文本名称</param>
        /// <param name="drs">最上层的记录集合</param>
        /// <param name="ddl">下拉框</param>
        /// <param name="leveStr">层级的前缀</param>
        /// <param name="nextStr">层级的前缀的前缀</param>
        public void GetChild(DataTable dt, string parentId, string colId, string colName, DataRow[] drs, DropDownList ddl, string leveStr, string nextStr)
        {
            foreach (DataRow dr in drs)
            {
                string txt = dr[colName].ToString();
                if (leveStr.Length != 1)
                {
                    txt = leveStr + dr[colName].ToString();
                }
                ddl.Items.Add(new ListItem(txt, dr[colId].ToString()));
                DataRow[] cdrs = dt.Select(parentId + " ='" + dr[colId] + "'", colId + " asc");
                if (cdrs.Length != 0)
                {
                    string nextLevelStr = leveStr.Insert(0, nextStr);
                    GetChild(dt, parentId, colId, colName, cdrs, ddl, nextLevelStr, nextStr);
                }
            }
        }

        //纪录条数
        public int GetCount(string Sql)
        {
            int i = 0;
            SqlDataReader result = SqlHelper.ExecuteReader(Sql);
            while (result.Read())
            {
                i = result.GetInt32(0);
            }
            result.Close();
            return i;
        }

        //判断数据是否存在或重复
        public string CheckRepeat(string SQL)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader(SQL);
            if (dr.Read())
            {
                dr.Close();
                return "true";
            }
            else
            {
                dr.Close();
                return "false";
            }
        }

        //附件列表
        public void GetAtt(string strNumber, string strClass, string strPath, Label _Label)
        {
            _Label.Text = null;
            //int glTMP2 = 0;
            //_Label.Text += "<table width=100% border=0 cellspacing=0 cellpadding=1>";
            //_Label.Text += "<tr>";

            SqlDataReader dr_fj = SqlHelper.ExecuteReader("SELECT attName,attNewName FROM hk_AttUpload WHERE attKey='" + strNumber + "' AND attClass='" + strClass + "'");
            while (dr_fj.Read())
            {
                //_Label.Text += " <td width=100%>·<a href=../../AttDown.aspx?number=" + dr_fj["attNewName"].ToString() + "&fname=" + strPath + " target=_blank class=gvlink>" + dr_fj["attName"].ToString() + "</a></td>";
                _Label.Text += " <div>·<a href=../../AttDown.aspx?number=" + dr_fj["attNewName"].ToString() + "&fname=" + strPath + " target=_blank class=gvlink>" + dr_fj["attName"].ToString() + "</a></div>";

                //glTMP2 = glTMP2 + 1;
                //if (glTMP2 == 1)
                //{
                //    _Label.Text += "</tr><tr>";
                //    glTMP2 = 0;
                //}
            }
            //_Label.Text += " </table>";
            dr_fj.Close();
        }

        public void GetAttFj(string strNumber, string strClass, string strPath, Label _Label)
        {
            _Label.Text = null;
            var qy_fjylurl = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

            SqlDataReader dr_fj = SqlHelper.ExecuteReader("SELECT attName,attNewName FROM hk_AttUpload WHERE attKey='" + strNumber + "' AND attClass='" + strClass + "'");
            while (dr_fj.Read())
            {
                  _Label.Text += " <div><a href="+qy_fjylurl+ "Attach/portal/gg/" + dr_fj["attNewName"].ToString() + " target=_blank >" + dr_fj["attName"].ToString() + "</a></div>";

             
            }
            dr_fj.Close();
        }

        //根据类型ID获取名称
        public string IDtoName(string TableName, string FieldID, string FieldName, string strID)
        {
            string strName = null;
            string SQL_GetName = "SELECT " + FieldName + " AS Name FROM " + TableName + " WHERE " + FieldID + "='" + strID + "'";
            SqlDataReader dr = SqlHelper.ExecuteReader(SQL_GetName);
            if (dr.Read())
            {
                strName = dr["Name"].ToString();
            }
            dr.Close();
            return strName;
        }

        //根据类型名称获取ID
        public string NametoID(string TableName, string FieldID, string FieldName, string strID)
        {
            string strName = null;
            string SQL_GetName = "SELECT " + FieldID + " AS ID FROM " + TableName + " WHERE " + FieldName + "='" + strID + "'";
            SqlDataReader dr = SqlHelper.ExecuteReader(SQL_GetName);
            if (dr.Read())
            {
                strName = dr["ID"].ToString();
            }
            dr.Close();
            return strName;
        }

        //根据用户ID获取用户名称
        public string YhidToYhmc(string strID)
        {
            string strName = null;
            string SQL_GetName = "SELECT UI_DESC FROM YH WHERE UI_ID='" + strID + "'";
            SqlDataReader dr = SqlHelper.ExecuteReader(SQL_GetName);
            if (dr.Read())
            {
                strName = dr["UI_DESC"].ToString();
            }
            dr.Close();
            return strName;
        }

        //ListBox
        public void Bind_ListBox(System.Web.UI.WebControls.ListBox MyListBox, string SQL, string DataValueField, string DataTextField)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader(SQL);
            while (dr.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = dr[DataTextField].ToString();
                theItem.Value = dr[DataValueField].ToString();
                MyListBox.Items.Add(theItem);
            }
            dr.Close();
        }

        //有效出勤日期
        public void Bind_DropDownList_Kq(DropDownList MyDropDownList)
        {
            ArrayList myList = new ArrayList();

            for (int i = 1; i < 32; i++) myList.Add(i.ToString());

            MyDropDownList.DataSource = myList;
            MyDropDownList.DataBind();
        }

        //初始化年份下拉列表
        public void Bind_DropDownList_YearForSa(System.Web.UI.WebControls.DropDownList MyDropDownList, int _Begin, int _End)
        {
            ArrayList myList = new ArrayList();
            //myList.Add("----");

            for (int i = _Begin; i <= _End; i++) myList.Add(i.ToString());

            MyDropDownList.DataSource = myList;
            MyDropDownList.DataBind();
        }

        //初始化月份下拉列表
        public void Bind_DropDownList_MonthForSa(System.Web.UI.WebControls.DropDownList MyDropDownList)
        {
            ArrayList myList = new ArrayList();
            //myList.Add("----");

            for (int i = 1; i < 13; i++) myList.Add(i.ToString());

            MyDropDownList.DataSource = myList;
            MyDropDownList.DataBind();
        }
    }
}
