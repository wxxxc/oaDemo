using System;
using System.Data;
using System.Data.SqlClient;
using FineUI;

namespace haoke365
{
    public class BindFine
    {
        //绑定常规下拉列表(有空行)
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

        //绑定常规下拉列表(无空行)
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


        //绑定部门下拉列表
        public void Bind_DropDownList_bm(DropDownList MyDropDownList)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT BM_ID,BM_MC FROM BM WHERE BM_SJBM=0 ORDER BY BM_ID");
            while (dr.Read())
            {
                ListItem theItem = new ListItem();
                theItem.Text = dr["BM_MC"].ToString();
                theItem.Value = dr["BM_ID"].ToString();
                MyDropDownList.Items.Add(theItem);
                AddItem_bm(MyDropDownList, dr["BM_ID"].ToString(), 1);
            }
            dr.Close();

            ListItem Item = new ListItem();
            Item.Text = "";
            Item.Value = "";
            MyDropDownList.Items.Insert(0, Item);
        }
        public void AddItem_bm(DropDownList MyDropDownList, string id, int level)
        {
            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT BM_ID,BM_MC FROM BM WHERE BM_SJBM=" + id + " ORDER BY BM_ID");
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
                AddItem_bm(MyDropDownList, dr["BM_ID"].ToString(), level + 1);
            }
            dr.Close();
        }

        //绑定附件列表
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

        //分页和排序
        public DataTable GetPagedDataTable(string sql,Grid grid)
        {
            int pageIndex = grid.PageIndex;
            int pageSize = grid.PageSize;

            string sortField = grid.SortField;
            string sortDirection = grid.SortDirection;

            DataTable table2 = SqlHelper.ExecuteDt(sql);

            DataView view2 = table2.DefaultView;
            view2.Sort = String.Format("{0} {1}", sortField, sortDirection);

            DataTable table = view2.ToTable();

            DataTable paged = table.Clone();

            int rowbegin = pageIndex * pageSize;
            int rowend = (pageIndex + 1) * pageSize;
            if (rowend > table.Rows.Count)
            {
                rowend = table.Rows.Count;
            }

            for (int i = rowbegin; i < rowend; i++)
            {
                paged.ImportRow(table.Rows[i]);
            }

            return paged;
        }

        //分页和不排序
        public DataTable GetPagedDataTable_NoSort(string sql, Grid grid)
        {
            int pageIndex = grid.PageIndex;
            int pageSize = grid.PageSize;

            //string sortField = grid.SortField;
            //string sortDirection = grid.SortDirection;

            DataTable table2 = SqlHelper.ExecuteDt(sql);

            DataView view2 = table2.DefaultView;
            //view2.Sort = String.Format("{0} {1}", sortField, sortDirection);

            DataTable table = view2.ToTable();

            DataTable paged = table.Clone();

            int rowbegin = pageIndex * pageSize;
            int rowend = (pageIndex + 1) * pageSize;
            if (rowend > table.Rows.Count)
            {
                rowend = table.Rows.Count;
            }

            for (int i = rowbegin; i < rowend; i++)
            {
                paged.ImportRow(table.Rows[i]);
            }

            return paged;
        }

        //不分页和不排序
        public DataTable GetDataTable(string sql, Grid grid)
        {
            DataTable table2 = SqlHelper.ExecuteDt(sql);

            return table2;
        }

        //判断数据是否重复
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
    }
}
