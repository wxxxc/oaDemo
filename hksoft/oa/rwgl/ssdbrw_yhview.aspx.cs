using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.rwgl
{
    public partial class ssdbrw_yhview : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10116", "0");
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                lblAttachSize.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT P_STRING FROM hk_CSDA WHERE PARAMT='P_fj_size'"));

                if (Request.QueryString["jszt"] != "�ѽ���")
                {
                    SSBtn.Visible = false;
                }

                //����
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                //dp�� 
                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT A.*,B.UI_DESC,C.MC AS RWXZ_MC FROM OA_RWD01 A LEFT OUTER JOIN YH B ON (A.FBR=B.UI_ID) LEFT OUTER JOIN HK_ZDYLX C ON(A.RWXZ=C.ID) WHERE RWID='" + hkdb.GetStr(Request.QueryString["rwid"].ToString()) + "'");
                if (datar.Read())
                {

                    rwly.Text = datar["source"].ToString();
                    rwdh.Text = datar["rwdh"].ToString();
                    lblrwbt.Text = datar["rwbt"].ToString();
                    lbljjcd.Text = datar["jjcd"].ToString();
                    lblrwxz.Text = datar["RWXZ_MC"].ToString();
                    lbljsdx.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["jsdx"].ToString() + "','1'"));
                    qtld.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["qtld"].ToString() + "','1'"));
                    zrld.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["zrld"].ToString() + "','1'"));
                    zrr.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + datar["zrr"].ToString() + "','1'"));
                    lblksrq.Text = datar["ksrq"].ToString();
                    lbljzrq.Text = datar["jzrq"].ToString();
                    lblnr.Text = hkdb.GetStrTeOut(datar["rwnr"].ToString());
                    lblynxs.Text = datar["ynxs"].ToString();
                    savefj.Text = datar["fjmc"].ToString();

                    fqsj.Text = string.Format("{0:d}", datar["fbsj"]);
                    fbr.Text = datar["fbr"].ToString();
                    fbrmc.Text = datar["ui_desc"].ToString();
                    savefj.Text = datar["fjmc"].ToString();
                    savelj.Text = datar["fjlj"].ToString();
                    savefj.NavigateUrl = (datar["fjlj"] == System.DBNull.Value ? "" : "../.." + datar["fjlj"]) + datar["fjmc"].ToString();

                    datar.Close();

                    if (lblynxs.Text == "��")
                    {
                        Panelrq.Visible = true;
                    }

                    SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.*,B.UI_DESC FROM OA_RWD02 A LEFT OUTER JOIN YH B ON (A.CLR=B.UI_ID) WHERE JSID='" + hkdb.GetStr(Request.QueryString["jsid"].ToString()) + "'");
                    if (dr.Read())
                    {
                        //lblfpxs.Text = dr["fpxs"].ToString();
                        //lblfpry.Text = Convert.ToString(SqlHelper.ExecuteScalar("exec sp_IdToName '" + dr["fpry"].ToString() + "','1'"));
                        //lblfpsm.Text = dr["fpsm"].ToString();
                        wcqk.Text = dr["bzsm"].ToString().ToString();
                        wcsj.Text = string.Format("{0:d}", dr["clsj"]);
                        wcrmc.Text = dr["ui_desc"].ToString().ToString();
                        savefj_yh.Text = dr["fjmc"].ToString();
                        savelj_yh.Text = dr["fjlj"].ToString();
                        savefj_yh.NavigateUrl = (dr["fjlj"] == System.DBNull.Value ? "" : "../.." + dr["fjlj"]) + dr["fjmc"].ToString();
                    }
                    dr.Close();

                    //������Դҳ������ ��� �������
                    if (Request.QueryString["type"] == "yjs")    //����Ǵ� �ѽ��� ҳ�����������
                    {
                        p_wcqk.Visible = true;
                    }
                    else
                    {
                        p_xx.Visible = false;
                    }
                }
                else
                {
                    datar.Close();
                    mydb.Alert_Close("�˼�¼������,�����ѱ�ɾ����");
                }
            }
        }

        //���� 
        protected void SS_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["jsid"]))
            {
                string FileName = "";
                string FileVisualPathStr = "";
                string UserName = this.Session["userid"].ToString();
                string PathStr = null;
                string type = null;

                //�жϸ��� 
                if (!string.IsNullOrEmpty(fj.PostedFile.FileName.Trim()))
                {
                    try
                    {
                        PathStr = fj.PostedFile.FileName;

                        if (fj.PostedFile.ContentLength < 1024 * int.Parse(lblAttachSize.Text))
                        {
                            type = PathStr.Substring((PathStr.LastIndexOf(".") + 1));
                            FileName = System.IO.Path.GetFileName(fj.PostedFile.FileName);
                            //if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\oa\\rw\\" + UserName)))
                            //{
                            //    System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\oa\\rw\\" + UserName));
                            //}
                            Random TempNameInt = new Random();
                            string NewDocDirName = TempNameInt.Next(100000000).ToString();
                            if (!System.IO.Directory.Exists((Server.MapPath("..\\..\\") + "Attach\\oa\\rw\\" + UserName + "\\" + NewDocDirName)))
                            {
                                System.IO.Directory.CreateDirectory((Server.MapPath("..\\..\\") + "Attach\\oa\\rw\\" + UserName + "\\" + NewDocDirName));
                            }
                            TempNameInt = null;
                            fj.PostedFile.SaveAs((Server.MapPath("..\\..\\") + "Attach\\oa\\rw\\" + UserName + "\\" + NewDocDirName + "\\" + FileName));
                            FileVisualPathStr = "\\Attach\\oa\\rw\\" + UserName + "\\" + NewDocDirName + "\\";
                        }
                        else
                        {
                            mydb.Alert("������С���� " + lblAttachSize.Text + " KB�����ƣ�");
                        }
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }

                SqlHelper.ExecuteSql("update OA_RWD02 set jszt='������',clr='" + this.Session["userid"] + "',clsj=GETDATE(),fjmc='" + FileName + "',fjlj='" + FileVisualPathStr + "',bzsm='" + hkdb.GetStr(wcqk.Text) + "' where jsid='" + hkdb.GetStr(Request.QueryString["jsid"].ToString()) + "'");

                //Msg 
                if (xxtz.Checked == true | dxtz.Checked == true)
                {
                    string message = "[" + hkdb.GetStr(rwdh.Text) + "]" + lblrwbt.Text + ";�����Ѿ����������!" + this.Session["username"].ToString();
                    string templateParam = "{\"name\":\"" + lblrwbt.Text + "\",\"status\":" + "\"������\"" + "}";
                    hkdb.SendAliSMS(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), fbr.Text, message, templateParam);
                    //hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), fbr.Text, message);
                    mydb.Alert_Close("���ɹ�֪ͨ���񷢲��ˣ�");
                }

                SSBtn.Visible = false;
                
                if (Request.QueryString["flag"] != null && Request.QueryString["flag"].Equals("index"))
                {
                    mydb.Alert_Reload_Close("�ѳɹ��������������Ⱥ����������");
                }
                else
                {
                    mydb.Alert_Refresh_Close("�ѳɹ��������������Ⱥ����������", "wddbrwy.aspx");
                }
            }
            else
            {
                mydb.Alert("����ѡ�д���������ִ������");
            }
        }
    }
}
