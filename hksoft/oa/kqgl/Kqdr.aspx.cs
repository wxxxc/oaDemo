using System;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Kqdr : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            //加载提示
            mydb.PageWait();

            if (!IsPostBack)
            {
                hkdb.PassTo("11713", "0");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile == false)
            {
                mydb.Alert("导入失败,请选择Excel文件！");
                return;
            }

            string IsXls = System.IO.Path.GetExtension(FileUpload1.FileName).ToString().ToLower();
            if (IsXls != ".xls")
            {
                mydb.Alert("导入失败,仅支持扩展名为.xls的文件！");
                return;
            }

            string filename = DateTime.Now.ToString("yyyymmddhhMMss") + FileUpload1.FileName;
            string savePath = Server.MapPath(("..\\..\\Temp\\oa\\") + filename);
            FileUpload1.SaveAs(savePath);
            DataSet ds = ExecleDs(savePath, filename);

            if (ds != null)
            {
                DataRow[] dr = ds.Tables[0].Select();
                int rowsnum = ds.Tables[0].Rows.Count;
                if (rowsnum == 0)
                {
                    mydb.Alert("导入失败,此Excel表中无任何数据！");
                }
                else
                {
                    int j = 0;
                    int k = 0;

                    Random g = new Random();
                    string rad = g.Next(10000).ToString();
                    Number.Text = "" + System.DateTime.Now.Year.ToString() + "" + System.DateTime.Now.Month.ToString() + "" + System.DateTime.Now.Day.ToString() + "" + System.DateTime.Now.Hour.ToString() + "" + System.DateTime.Now.Minute.ToString() + "" + System.DateTime.Now.Second.ToString() + "" + System.DateTime.Now.Millisecond.ToString() + "" + rad + "";

                    for (int i = 0; i < dr.Length; i++)
                    {
                        if (!string.IsNullOrEmpty(dr[i]["人员编号"].ToString()) && !string.IsNullOrEmpty(dr[i]["考勤日期"].ToString()))
                        {
                            string rybh = hkdb.GetStr(dr[i]["人员编号"].ToString().Trim());
                            string xm = hkdb.GetStr(dr[i]["姓名"].ToString().Trim());
                            string kqrq = hkdb.GetStr(dr[i]["考勤日期"].ToString().Trim());
                            string sb1 = hkdb.GetStr(dr[i]["上班1"].ToString().Trim());
                            string xb2 = hkdb.GetStr(dr[i]["下班2"].ToString().Trim());
                            string sb3 = hkdb.GetStr(dr[i]["上班3"].ToString().Trim());
                            string xb4 = hkdb.GetStr(dr[i]["下班4"].ToString().Trim());
                            string sb5 = hkdb.GetStr(dr[i]["上班5"].ToString().Trim());
                            string xb6 = hkdb.GetStr(dr[i]["下班6"].ToString().Trim());

                            //更新
                            SqlDataReader dr_a = SqlHelper.ExecuteReader("SELECT * FROM OA_KQXX WHERE RYBH='" + rybh + "' AND KQRQ='" + kqrq + "'");
                            if (dr_a.Read())
                            {
                                dr_a.Close();
                                //SqlHelper.ExecuteSql("UPDATE OA_KQXX SET xm='" + xm + "',sb1='" + sb1 + "',xb2='" + xb2 + "',sb3='" + sb3 + "',xb4='" + xb4 + "',sb5='" + sb5 + "',xb6='" + xb6 + "',sb1_old='" + sb1 + "',xb2_old='" + xb2 + "',sb3_old='" + sb3 + "',xb4_old='" + xb4 + "',sb5_old='" + sb5 + "',xb6_old='" + xb6 + "',sjm='" + Number.Text + "',czr='" + this.Session["UserID"] + "',czsj=GETDATE() WHERE RYBH='" + rybh + "' AND KQRQ='" + kqrq + "'");

                                j = j + 1;
                            }
                            else
                            {
                                dr_a.Close();
                                SqlHelper.ExecuteSql("INSERT INTO OA_KQXX(rybh,xm,kqrq,sb1,xb2,sb3,xb4,sb5,xb6,sb1_old,xb2_old,sb3_old,xb4_old,sb5_old,xb6_old,sjm,czr,czsj) VALUES "
                                    + "('" + rybh + "','" + xm + "','" + kqrq + "','" + sb1 + "','" + xb2 + "','" + sb3 + "','" + xb4 + "','" + sb5 + "','" + xb6 + "','" + sb1 + "','" + xb2 + "','" + sb3 + "','" + xb4 + "','" + sb5 + "','" + xb6 + "','" + hkdb.GetStr(Number.Text) + "','" + this.Session["userid"] + "',GETDATE())");

                                k = k + 1;
                            }
                        }
                    }

                    //一、首先处理员工的特殊考勤、免签到、免签退
                    SqlDataReader dr2 = SqlHelper.ExecuteReader("SELECT A.RYBH,B.YHID,A.XM,A.KQRQ,A.SB1,A.XB2,A.SB3,A.XB4,A.SB5,A.XB6,B.TSKQRY FROM OA_KQXX A LEFT OUTER JOIN OA_KQ_QX B ON(A.RYBH=B.KQID) LEFT OUTER JOIN YH C ON(B.YHID=C.UI_ID) WHERE SJM='" + hkdb.GetStr(Number.Text) + "' AND B.YHID<>'' AND C.UI_ID<>'' ORDER BY RYBH");
                    while (dr2.Read())
                    {
                        //1.判断每个人员导入的考勤日期是否维护了上班日
                        SqlDataReader dr3 = SqlHelper.ExecuteReader("SELECT YNSB FROM OA_KQ_WorkDate WHERE YHID='" + dr2["YHID"].ToString() + "' AND RQ='" + dr2["KQRQ"].ToString() + "'");
                        if (dr3.Read())
                        {
                            //如果上班则继续，如果休息则忽略
                            if (dr3["YNSB"].ToString() == "Y")
                            {
                                dr3.Close();
                                //更新该条记录的上班状态为是
                                SqlHelper.ExecuteSql("UPDATE OA_KQXX SET YNSBR='是' WHERE RYBH='" + dr2["RYBH"].ToString() + "' AND KQRQ='" + dr2["KQRQ"].ToString() + "' AND SJM='" + hkdb.GetStr(Number.Text) + "'");


                                //2.判断每个人员的班次时间，如果存在多个班次则取第1条，如果不存在班次则忽略
                                SqlDataReader dr4 = SqlHelper.ExecuteReader("SELECT TOP 1 DjType_1,DjTime_1,DjType_2,DjTime_2,DjType_3,DjTime_3,DjType_4,DjTime_4,DjType_5,DjTime_5,DjType_6,DjTime_6 FROM OA_KQ_AttenTime WHERE CHARINDEX('" + dr2["YHID"].ToString() + "',SyUsername)>0 AND QyType='正常'");
                                if (dr4.Read())
                                {
                                    //如果是非特殊考勤人员则继续
                                    if (dr2["TSKQRY"].ToString() == "否")
                                    {
                                        //3.特殊处理：针对下午下班超时打卡，则记录成下午正常下班
                                        //打到了晚上上班时
                                        if (dr4["DjType_4"].ToString() == "下班" && dr2["XB4"].ToString() == "" && dr4["DjType_5"].ToString() == "无" && dr2["SB5"].ToString() != "")
                                        {
                                            SqlHelper.ExecuteSql("UPDATE OA_KQXX SET XB4='" + dr2["SB5"].ToString() + "' WHERE RYBH='" + dr2["RYBH"].ToString() + "' AND KQRQ='" + dr2["KQRQ"].ToString() + "' AND SJM='" + hkdb.GetStr(Number.Text) + "'");
                                        }
                                        //打到了晚上下班时
                                        if (dr4["DjType_4"].ToString() == "下班" && dr2["XB4"].ToString() == "" && dr4["DjType_6"].ToString() == "无" && dr2["XB6"].ToString() != "")
                                        {
                                            SqlHelper.ExecuteSql("UPDATE OA_KQXX SET XB4='" + dr2["XB6"].ToString() + "' WHERE RYBH='" + dr2["RYBH"].ToString() + "' AND KQRQ='" + dr2["KQRQ"].ToString() + "' AND SJM='" + hkdb.GetStr(Number.Text) + "'");
                                        }



                                        //4.判断如果是上班免签到且下班已打卡，则自动填写为上班标准时间，否则为旷工（忽略不记录上班时间）
                                        if (dr4["DjType_1"].ToString() == "免签到" && !string.IsNullOrEmpty(dr2["XB2"].ToString()))
                                        {
                                            SqlHelper.ExecuteSql("UPDATE OA_KQXX SET SB1='" + dr4["DjTime_1"].ToString() + "' WHERE RYBH='" + dr2["RYBH"].ToString() + "' AND KQRQ='" + dr2["KQRQ"].ToString() + "' AND SJM='" + hkdb.GetStr(Number.Text) + "'");
                                        }
                                        if (dr4["DjType_3"].ToString() == "免签到" && !string.IsNullOrEmpty(dr2["XB4"].ToString()))
                                        {
                                            SqlHelper.ExecuteSql("UPDATE OA_KQXX SET SB3='" + dr4["DjTime_3"].ToString() + "' WHERE RYBH='" + dr2["RYBH"].ToString() + "' AND KQRQ='" + dr2["KQRQ"].ToString() + "' AND SJM='" + hkdb.GetStr(Number.Text) + "'");
                                        }
                                        if (dr4["DjType_5"].ToString() == "免签到" && !string.IsNullOrEmpty(dr2["XB6"].ToString()))
                                        {
                                            SqlHelper.ExecuteSql("UPDATE OA_KQXX SET SB5='" + dr4["DjTime_5"].ToString() + "' WHERE RYBH='" + dr2["RYBH"].ToString() + "' AND KQRQ='" + dr2["KQRQ"].ToString() + "' AND SJM='" + hkdb.GetStr(Number.Text) + "'");
                                        }



                                        //5.判断如果是下班免签退且上班已打卡，则自动填写为下班标准时间，否则为旷工（忽略不记录下时间）
                                        if (dr4["DjType_2"].ToString() == "免签退" && !string.IsNullOrEmpty(dr2["SB1"].ToString()))
                                        {
                                            SqlHelper.ExecuteSql("UPDATE OA_KQXX SET XB2='" + dr4["DjTime_2"].ToString() + "' WHERE RYBH='" + dr2["RYBH"].ToString() + "' AND KQRQ='" + dr2["KQRQ"].ToString() + "' AND SJM='" + hkdb.GetStr(Number.Text) + "'");
                                        }
                                        if (dr4["DjType_4"].ToString() == "免签退" && !string.IsNullOrEmpty(dr2["SB3"].ToString()))
                                        {
                                            SqlHelper.ExecuteSql("UPDATE OA_KQXX SET XB4='" + dr4["DjTime_4"].ToString() + "' WHERE RYBH='" + dr2["RYBH"].ToString() + "' AND KQRQ='" + dr2["KQRQ"].ToString() + "' AND SJM='" + hkdb.GetStr(Number.Text) + "'");
                                        }
                                        if (dr4["DjType_6"].ToString() == "免签退" && !string.IsNullOrEmpty(dr2["SB5"].ToString()))
                                        {
                                            SqlHelper.ExecuteSql("UPDATE OA_KQXX SET XB6='" + dr4["DjTime_6"].ToString() + "' WHERE RYBH='" + dr2["RYBH"].ToString() + "' AND KQRQ='" + dr2["KQRQ"].ToString() + "' AND SJM='" + hkdb.GetStr(Number.Text) + "'");
                                        }
                                    }

                                    dr4.Close();
                                }
                                else
                                {
                                    //如果尚未维护时间班次，则跳出并删除本次导入的数据
                                    dr4.Close();

                                    string strErr = dr2["YHID"].ToString() + dr2["XM"].ToString();
                                    dr2.Close();

                                    SqlHelper.ExecuteSql("DELETE FROM OA_KQXX WHERE SJM='" + hkdb.GetStr(Number.Text) + "'");
                                    mydb.Alert("导入失败，人员【" + strErr + "】尚未维护班次时间！");
                                    return;
                                }
                            }
                            else
                            {
                                dr3.Close();
                                //更新该条记录的上班状态为否
                                SqlHelper.ExecuteSql("UPDATE OA_KQXX SET YNSBR='否' WHERE RYBH='" + dr2["RYBH"].ToString() + "' AND KQRQ='" + dr2["KQRQ"].ToString() + "' AND SJM='" + hkdb.GetStr(Number.Text) + "'");
                            }
                        }
                        else
                        {
                            //如果尚未维护工作日，则跳出并删除本次导入的数据
                            dr3.Close();

                            string strErr = dr2["YHID"].ToString() + dr2["XM"].ToString();
                            dr2.Close();

                            SqlHelper.ExecuteSql("DELETE FROM OA_KQXX WHERE SJM='" + hkdb.GetStr(Number.Text) + "'");
                            mydb.Alert("导入失败，人员【" + strErr + "】尚未维护工作日！");
                            return;
                        }
                    }
                    dr2.Close();


                    //二、然后计算迟到、早退、旷工、无签到、无签退次数
                    //1.首先只取本次导入数据中YNSBR上班日为"是"、且非特殊考勤人员的记录，并按人员编号排序
                    SqlDataReader dr21 = SqlHelper.ExecuteReader("SELECT A.RYBH,B.YHID,A.XM,A.KQRQ,A.SB1,A.XB2,A.SB3,A.XB4,A.SB5,A.XB6 FROM OA_KQXX A LEFT OUTER JOIN OA_KQ_QX B ON(A.RYBH=B.KQID) LEFT OUTER JOIN YH C ON(B.YHID=C.UI_ID) WHERE SJM='" + hkdb.GetStr(Number.Text) + "' AND B.YHID<>'' AND C.UI_ID<>'' AND A.YNSBR='是' AND B.TSKQRY='否' ORDER BY RYBH");
                    while (dr21.Read())
                    {
                        //2.判断每个人员的班次时间，如果存在多个班次则取第1条，如果不存在班次则忽略
                        SqlDataReader dr41 = SqlHelper.ExecuteReader("SELECT TOP 1 DjType_1,DjTime_1,DjType_2,DjTime_2,DjType_3,DjTime_3,DjType_4,DjTime_4,DjType_5,DjTime_5,DjType_6,DjTime_6 FROM OA_KQ_AttenTime WHERE CHARINDEX('" + dr21["YHID"].ToString() + "',SyUsername)>0 AND QyType='正常'");
                        if (dr41.Read())
                        {
                            int iSb1wqd = 0;    //上班1无签到
                            int iXb2wqt = 0;    //下班2无签退
                            int iSb3wqd = 0;    //上班3无签到
                            int iXb4wqt = 0;    //下班4无签退
                            int iSb5wqd = 0;    //上班5无签到
                            int iXb6wqt = 0;    //下班6无签退

                            int iWqdcs1 = 0; //未签到次数1
                            int iCdcs1 = 0;  //迟到次数1
                            int iWqtcs1 = 0; //未签退次数1
                            int iZtcs1 = 0;  //早退次数1
                            int iKgcs1 = 0;  //旷工次数1

                            int iWqdcs2 = 0; //未签到次数2
                            int iCdcs2 = 0;  //迟到次数2
                            int iWqtcs2 = 0; //未签退次数2
                            int iZtcs2 = 0;  //早退次数2
                            int iKgcs2 = 0;  //旷工次数2

                            int iWqdcs3 = 0; //未签到次数3
                            int iCdcs3 = 0;  //迟到次数3
                            int iWqtcs3 = 0; //未签退次数3
                            int iZtcs3 = 0;  //早退次数3
                            int iKgcs3 = 0;  //旷工次数3

                            //3.根据各上班班次计算无签到、迟到
                            //上班一
                            if (dr41["DjType_1"].ToString() != "无")
                            {
                                //无签到次数
                                if (!string.IsNullOrEmpty(dr21["SB1"].ToString()))
                                {
                                    //已签到,则继续计算迟到次数
                                    if (DateTime.Parse("1900-01-01 " + dr21["SB1"].ToString() + ":00") > DateTime.Parse("1900-01-01 " + dr41["DjTime_1"].ToString() + ":00"))
                                    {
                                        iCdcs1 += 1;
                                    }
                                }
                                else
                                {
                                    //未签到
                                    iWqdcs1 += 1;
                                    iSb1wqd = 1;
                                }
                            }
                            //上班三
                            if (dr41["DjType_3"].ToString() != "无")
                            {
                                //无签到次数
                                if (!string.IsNullOrEmpty(dr21["SB3"].ToString()))
                                {
                                    //已签到,则继续计算迟到次数
                                    if (DateTime.Parse("1900-01-01 " + dr21["SB3"].ToString() + ":00") > DateTime.Parse("1900-01-01 " + dr41["DjTime_3"].ToString() + ":00"))
                                    {
                                        iCdcs2 += 1;
                                    }
                                }
                                else
                                {
                                    //未签到
                                    iWqdcs2 += 1;
                                    iSb3wqd = 1;
                                }
                            }
                            //上班五
                            if (dr41["DjType_5"].ToString() != "无")
                            {
                                //无签到次数
                                if (!string.IsNullOrEmpty(dr21["SB5"].ToString()))
                                {
                                    //已签到,则继续计算迟到次数
                                    if (DateTime.Parse("1900-01-01 " + dr21["SB5"].ToString() + ":00") > DateTime.Parse("1900-01-01 " + dr41["DjTime_5"].ToString() + ":00"))
                                    {
                                        iCdcs3 += 1;
                                    }
                                }
                                else
                                {
                                    //未签到
                                    iWqdcs3 += 1;
                                    iSb5wqd = 1;
                                }
                            }




                            //4.根据各下班班次计算无签退、早退
                            //下班二
                            if (dr41["DjType_2"].ToString() != "无")
                            {
                                //无签退次数
                                if (!string.IsNullOrEmpty(dr21["XB2"].ToString()))
                                {
                                    //已签退,则继续计算早退次数
                                    if (DateTime.Parse("1900-01-01 " + dr21["XB2"].ToString() + ":00") < DateTime.Parse("1900-01-01 " + dr41["DjTime_2"].ToString() + ":00"))
                                    {
                                        iZtcs1 += 1;
                                    }
                                }
                                else
                                {
                                    //未签退
                                    iWqtcs1 += 1;
                                    iXb2wqt = 1;
                                }

                                //如果是无签到+无签退，则记为旷工，同时不再记录无签到和无签退
                                if (iSb1wqd == 1 && iXb2wqt == 1)
                                {
                                    iKgcs1 += 1;
                                    iWqdcs1 += -1;
                                    iWqtcs1 += -1;
                                }
                            }
                            //下班四
                            if (dr41["DjType_4"].ToString() != "无")
                            {
                                //无签退次数
                                if (!string.IsNullOrEmpty(dr21["XB4"].ToString()))
                                {
                                    //已签退,则继续计算早退次数
                                    if (DateTime.Parse("1900-01-01 " + dr21["XB4"].ToString() + ":00") < DateTime.Parse("1900-01-01 " + dr41["DjTime_4"].ToString() + ":00"))
                                    {
                                        iZtcs2 += 1;
                                    }
                                }
                                else
                                {
                                    //未签退
                                    iWqtcs2 += 1;
                                    iXb4wqt = 1;
                                }

                                //如果是无签到+无签退，则记为旷工，同时不在记录无签到和无签退
                                if (iSb3wqd == 1 && iXb4wqt == 1)
                                {
                                    iKgcs2 += 1;
                                    iWqdcs2 += -1;
                                    iWqtcs2 += -1;
                                }
                            }
                            //下班六
                            if (dr41["DjType_6"].ToString() != "无")
                            {
                                //无签退次数
                                if (!string.IsNullOrEmpty(dr21["XB6"].ToString()))
                                {
                                    //已签退,则继续计算早退次数
                                    if (DateTime.Parse("1900-01-01 " + dr21["XB6"].ToString() + ":00") < DateTime.Parse("1900-01-01 " + dr41["DjTime_6"].ToString() + ":00"))
                                    {
                                        iZtcs3 += 1;
                                    }
                                }
                                else
                                {
                                    //未签退
                                    iWqtcs3 += 1;
                                    iXb6wqt = 1;
                                }

                                //如果是无签到+无签退，则记为旷工，同时不在记录无签到和无签退
                                if (iSb5wqd == 1 && iXb6wqt == 1)
                                {
                                    iKgcs3 += 1;
                                    iWqdcs3 += -1;
                                    iWqtcs3 += -1;
                                }
                            }

                            //更新考勤信息
                            SqlHelper.ExecuteSql("UPDATE OA_KQXX SET Sb1_wqd='" + iSb1wqd + "',Xb2_wqt='" + iXb2wqt + "',Sb3_wqd='" + iSb3wqd + "',Xb4_wqt='" + iXb4wqt + "',Sb5_wqd='" + iSb5wqd + "',Xb6_wqt='" + iXb6wqt + "',CDCS1='" + iCdcs1 + "',ZTCS1='" + iZtcs1 + "',KGCS1='" + iKgcs1 + "',WQDCS1='" + iWqdcs1 + "',WQTCS1='" + iWqtcs1 + "',CDCS2='" + iCdcs2 + "',ZTCS2='" + iZtcs2 + "',KGCS2='" + iKgcs2 + "',WQDCS2='" + iWqdcs2 + "',WQTCS2='" + iWqtcs2 + "',CDCS3='" + iCdcs3 + "',ZTCS3='" + iZtcs3 + "',KGCS3='" + iKgcs3 + "',WQDCS3='" + iWqdcs3 + "',WQTCS3='" + iWqtcs3 + "' WHERE RYBH='" + dr21["RYBH"].ToString() + "' AND KQRQ='" + dr21["KQRQ"].ToString() + "' AND SJM='" + hkdb.GetStr(Number.Text) + "'");
                        }
                        dr41.Close();
                    }
                    dr21.Close();

                    mydb.Alert("导入成功！其中：新增考勤信息【" + k + "】条，有【" + j + "】条考勤记录由于重复而被系统忽略导入!");
                }
            }
            else
            {
                mydb.Alert("导入失败！Excel标签名称尚未重命名为小写字母a 或选错了Excel文档，请检查后重试！");
            }
        }

        public DataSet ExecleDs(string filenameurl, string table)
        {
            string strConn = "Provider=Microsoft.Jet.OleDb.4.0;" + "data source=" + filenameurl + ";Extended Properties='Excel 8.0; HDR=YES; IMEX=1'";
            OleDbConnection conn = new OleDbConnection(strConn);
            conn.Open();

            DataTable dtSheetName = conn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, new object[] { null, null, null, "Table" });
            string[] strTableNames = new string[dtSheetName.Rows.Count];
            int m = 0;
            for (int k = 0; k < dtSheetName.Rows.Count; k++)
            {
                strTableNames[k] = dtSheetName.Rows[k]["TABLE_NAME"].ToString();
                if (strTableNames[k] == "a$")
                {
                    m = 1;
                    break;
                }
            }

            if (m == 1)
            {
                DataSet ds = new DataSet();
                OleDbDataAdapter odda = new OleDbDataAdapter("select * from [a$]", conn);
                odda.Fill(ds, table);
                conn.Close();
                return ds;
            }
            else
            {
                conn.Close();
                return null;
            }
        }
    }
}
