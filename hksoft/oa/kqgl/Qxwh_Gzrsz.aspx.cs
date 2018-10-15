using System;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Qxwh_Gzrsz : System.Web.UI.Page
    {
        protected string indaycolor;    //工作日
        protected string outdaycolor;   //休息日

        protected void Page_Load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("3");

            indaycolor = "red";
            outdaycolor = "#ffff00";

            if (!IsPostBack)
            {
                hkdb.PassTo("11712", "0");

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    year.SelectedValue = string.Format("{0:yyyy}", DateTime.Now);

                    string begintime = year.SelectedValue + "-01-01";
                    string endtime = year.SelectedValue + "-12-31";

                    //页面绑定
                    BindData(Request.QueryString["id"].ToString(), begintime, endtime);
                }
            }
        }

        public void BindData(string stryhid,string begintime, string endtime)
        {
            int j = 0;

            SqlConnection cnn = default(SqlConnection);
            SqlCommand cmd = default(SqlCommand);
            SqlDataReader dr = default(SqlDataReader);
            cnn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["haokeDataLink"]);
            //得到年历数据 
            cmd = new SqlCommand("SELECT * FROM OA_KQ_WorkDate WHERE YHID='" + stryhid + "' AND RQ BETWEEN '" + begintime + "' AND '" + endtime + "' ORDER BY RQ", cnn);
            cnn.Open();
            dr = cmd.ExecuteReader();
            bool outwhile = false;

            while (!outwhile)
            {
                HtmlTableRow row = new HtmlTableRow();
                row.Height = "30";
                //设置行高 
                while (row.Cells.Count < 7)
                {
                    //如果列数小于7则继续（7列为一行） 
                    if (!dr.Read())
                    {
                        //如果取到了数据 
                        //填补空余列 
                        int blankcells = 7 - row.Cells.Count;
                        int i = 0;
                        for (i = 0; i <= blankcells - 1; i++)
                        {
                            HtmlTableCell tmpcell = new HtmlTableCell();
                            tmpcell.InnerHtml = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                            row.Cells.Add(tmpcell);
                        }
                        daytable.Rows.Add(row);
                        outwhile = true;
                        break; // TODO: might not be correct. Was : Exit While 
                    }
                    HtmlTableCell col = new HtmlTableCell();

                    switch (DateTime.Parse(dr[2].ToString()).DayOfWeek.ToString())
                    {
                        case "Monday":
                            j = 1;
                            break;
                        case "Tuesday":
                            j = 2;
                            break;
                        case "Wednesday":
                            j = 3;
                            break;
                        case "Thursday":
                            j = 4;
                            break;
                        case "Friday":
                            j = 5;
                            break;
                        case "Saturday":
                            j = 6;
                            break;
                        case "Sunday":
                            j = 7;
                            break;
                        default:
                            break;
                    }
                    col.ID = dr["wdID"].ToString();
                    col.Align = "center";
                    if (dr["ynSB"].ToString() == "Y")
                    {
                        //根据该日是否需要上班，设置单元格背景色 
                        col.Style.Add("background-color", indaycolor);
                    }
                    else
                    {
                        col.Style.Add("background-color", outdaycolor);
                    }
                    col.InnerText = DateTime.Parse(dr["rq"].ToString()).Month.ToString() + "-" + DateTime.Parse(dr["rq"].ToString()).Day.ToString();

                    //如果当前日期紧接前面的日期就添加列 
                    if (row.Cells.Count + 1 == j)
                    {
                        col.Style.Add("cursor", "hand");
                        row.Cells.Add(col);
                        col.Attributes["onclick"] = "Click_Cell(this);";
                    }
                    else
                    {
                        int blankcell = j - row.Cells.Count - 1;
                        //补充缺掉的cell 
                        if (blankcell > 0)
                        {
                            int k = 0;
                            for (k = 0; k <= blankcell - 1; k++)
                            {
                                HtmlTableCell tmpcol = new HtmlTableCell();
                                //tmpcol.BgColor = outdaycolor; 
                                tmpcol.InnerText = "";
                                row.Cells.Add(tmpcol);
                            }
                            col.Style.Add("cursor", "hand");
                            row.Cells.Add(col);
                            col.Attributes["onclick"] = "Click_Cell(this);";
                        }
                        else
                        {

                            blankcell = j + 6 - row.Cells.Count;
                            int k = 0;
                            for (k = 0; k <= blankcell - 1; k++)
                            {
                                if (row.Cells.Count == 7)
                                {
                                    daytable.Rows.Add(row);
                                }
                                else
                                {
                                    HtmlTableCell tmpcol = new HtmlTableCell();
                                    //tmpcol.BgColor = outdaycolor; 
                                    tmpcol.InnerText = "";
                                    row.Cells.Add(tmpcol);
                                }
                                col.Style.Add("cursor", "hand");
                                row.Cells.Add(col);
                                col.Attributes["onclick"] = "if(this.style.backgroundColor=='" + indaycolor + "') this.style.backgroundColor = '" + outdaycolor + "';else this.style.backgroundColor = '" + indaycolor + "';Click_Cell(this);this.blur();";
                            }
                        }
                    }
                    //添加完列判断是否需要添加行 
                    if (row.Cells.Count == 7)
                    {
                        daytable.Rows.Add(row);
                    }
                }
            }
            dr.Close();
            cnn.Close();
        }

        protected void btnsubmit_Click(object sender, System.EventArgs e)
        {
            string tmpstr = hcellstatus.Value;
            string indaystr = "";
            string outdaystr = "";
            string[] arrdate = tmpstr.Split(',');
            string[] tmp = new string[3];

            int i = 0;
            for (i = 0; i <= arrdate.Length - 1; i++)
            {
                if (!string.IsNullOrEmpty(arrdate[i]))
                {
                    tmp = arrdate[i].Split(':');
                    if (Int32.Parse(tmp[1].ToString()) % 2 == 0)
                    {
                        //偶数上班日期 
                        indaystr = indaystr + tmp[0] + ",";
                    }
                    else
                    {
                        outdaystr = outdaystr + tmp[0] + ",";
                    }
                }
            }

            if (outdaystr.Length == 0)
            {
                outdaystr = "";
            }
            else
            {
                outdaystr = outdaystr.Substring(0, outdaystr.Length - 1);
            }
            if (indaystr.Length == 0)
            {
                indaystr = "";
            }
            else
            {
                indaystr = indaystr.Substring(0, indaystr.Length - 1);
            }

            if (!string.IsNullOrEmpty(indaystr))
            {
                SqlHelper.ExecuteSql("UPDATE OA_KQ_WorkDate SET ynSB='Y' WHERE wdID IN(" + indaystr + ")");
            }
            if (!string.IsNullOrEmpty(outdaystr))
            {
                SqlHelper.ExecuteSql("UPDATE OA_KQ_WorkDate SET ynSB='N' WHERE wdID IN(" + outdaystr + ")");
            }
            daytable.Visible = false;
            btnsubmit.Visible = false;
            mydb.Alert_Close("保存成功！");
        }

        protected void year_SelectedIndexChanged(object sender, EventArgs e)
        {
            string begintime = year.SelectedValue + "-01-01";
            string endtime = year.SelectedValue + "-12-31";

            //页面绑定
            BindData(Request.QueryString["id"].ToString(), begintime, endtime);
        } 
    }
}
