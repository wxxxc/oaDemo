using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.rwgl
{
    public partial class shdbrw_yhview : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                hkdb.PassTo("10302", "0");
                qy_fjylurl.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT qy_fjylurl FROM qy WHERE qy_id='001'"));

                //����
                dxtz.Visible = Convert.ToBoolean(hkdb.VeriSms());

                SqlDataReader datar = SqlHelper.ExecuteReader("SELECT A.*,B.UI_DESC,C.MC AS RWXZ_MC FROM OA_RWD01 A LEFT OUTER JOIN YH B ON (A.FBR=B.UI_ID) LEFT OUTER JOIN HK_ZDYLX C ON(A.RWXZ=C.ID) WHERE A.RWID='" + hkdb.GetStr(Request.QueryString["rwid"].ToString()) + "' AND RWZT='�ѷ���'");
                if (datar.Read())
                {
                    rwidstr.Text = datar["rwid"].ToString();

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

                    fbrmc.Text = datar["ui_desc"].ToString();
                    fqsj.Text = string.Format("{0:d}", datar["fbsj"]);
                    savefj.Text = datar["fjmc"].ToString();
                    savefj.NavigateUrl = (datar["fjlj"] == System.DBNull.Value ? "" : "../.." + datar["fjlj"]) + datar["fjmc"].ToString();

                    datar.Close();

                    if (lblynxs.Text == "��")
                    {
                        Panelrq.Visible = true;
                    }

                    //ҳ��� 
                    GridViewBind();

                    GridViewBind2();
                    GridViewBind3();
                    GridViewBind4();
                }
                else
                {
                    datar.Close();
                    mydb.Alert_Close("�˼�¼������,�����ѱ���ɻ�ɾ����");
                    return;
                }
            }
        }

        //gv�� 
        public void GridViewBind()
        {
            string Str1 = " where ssrwid='" + hkdb.GetStr(rwidstr.Text) + "' ";

            DataSet ds = SqlHelper.ExecuteDs("select a.jsid,a.jszt,a.clsj,a.bzsm,a.fjlj,a.fjmc,a.fpxs,a.fpsm,case when(a.fjmc=''or a.fjmc is null) then 'n' else 'down' end as fjmc2,b.ui_desc from OA_RWD02 a left outer join yh b on (a.jsr=b.ui_id)" + Str1 + "order by jssj desc");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }


        public void GridViewBind2()
        {
            string str_qtld = Convert.ToString(SqlHelper.ExecuteScalar("select QTLD from wit_soft.dbo.OA_Rwd01 WHERE rwid ='" + hkdb.GetStr(rwidstr.Text) + "'"));
            string[] arr_qtld = str_qtld.Split(',');
            string con_qtld = "";
            for (int i = 0; i < arr_qtld.Length; i++)
            {
                con_qtld += "'" + arr_qtld[i] + "'" + ",";
            }
            con_qtld = con_qtld.Substring(0, con_qtld.Length - 1);
            //object ds = SqlHelper.ExecuteScalar("select QTLD from wit_soft.dbo.OA_Rwd01 WHERE rwid ='" + hkdb.GetStr(rwidstr.Text) + "'");

            DataSet DS = SqlHelper.ExecuteDs("SELECT * FROM wit_soft.DBO.YH WHERE ui_id IN(" + con_qtld + ")");
            GridView2.DataSource = DS;
            GridView2.DataBind();
        }
        public void GridViewBind3()
        {
            string str_qtld = Convert.ToString(SqlHelper.ExecuteScalar("select zrld from wit_soft.dbo.OA_Rwd01 WHERE rwid ='" + hkdb.GetStr(rwidstr.Text) + "'"));
            string[] arr_qtld = str_qtld.Split(',');
            string con_qtld = "";
            for (int i = 0; i < arr_qtld.Length; i++)
            {
                con_qtld += "'" + arr_qtld[i] + "'" + ",";
            }
            con_qtld = con_qtld.Substring(0, con_qtld.Length - 1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM wit_soft.DBO.YH WHERE ui_id IN(" + con_qtld + ")");
            GridView3.DataSource = ds;
            GridView3.DataBind();
        }
        public void GridViewBind4()
        {
            string str_qtld = Convert.ToString(SqlHelper.ExecuteScalar("select zrr from wit_soft.dbo.OA_Rwd01 WHERE rwid ='" + hkdb.GetStr(rwidstr.Text) + "'"));
            string[] arr_qtld = str_qtld.Split(',');
            string con_qtld = "";
            for (int i = 0; i < arr_qtld.Length; i++)
            {
                con_qtld += "'" + arr_qtld[i] + "'" + ",";
            }
            con_qtld = con_qtld.Substring(0, con_qtld.Length - 1);
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM wit_soft.DBO.YH WHERE ui_id IN(" + con_qtld + ")");
            GridView4.DataSource = ds;
            GridView4.DataBind();
        }



        //����
        protected void Send_Click1(object sender, EventArgs e)
        {
            string cal = "";
            string ca2 = "";
            string ca3 = "";
            string ca4 = "";

            string mestr = "";
            int i = 0;
            for (i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Rows[i].Cells[1].FindControl("del");


                if (cb.Checked == true)
                {
                    if (string.IsNullOrEmpty(cal))
                    {
                        cal = GridView1.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        cal = cal + "," + GridView1.DataKeys[i].Value.ToString();
                    }
                }
            }
            for (i = 0; i <= GridView2.Rows.Count - 1; i++)
            {
                CheckBox cb1 = (CheckBox)GridView2.Rows[i].Cells[1].FindControl("del1");
                if (cb1.Checked == true)
                {
                    if (string.IsNullOrEmpty(ca2))
                    {
                        ca2 = GridView2.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        ca2 = ca2 + "," + GridView2.DataKeys[i].Value.ToString();
                    }
                }
            }
            for (i = 0; i <= GridView3.Rows.Count - 1; i++)
            {
                CheckBox cb2 = (CheckBox)GridView3.Rows[i].Cells[1].FindControl("del2");
                if (cb2.Checked == true)
                {
                    if (string.IsNullOrEmpty(ca3))
                    {
                        ca3 = GridView3.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        ca3 = ca3 + "," + GridView3.DataKeys[i].Value.ToString();
                    }
                }
            }

            for (i = 0; i <= GridView4.Rows.Count - 1; i++)
            {

                CheckBox cb3 = (CheckBox)GridView4.Rows[i].Cells[1].FindControl("del3");
                if (cb3.Checked == true)
                {
                    if (string.IsNullOrEmpty(ca4))
                    {
                        ca4 = GridView4.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        ca4 = ca4 + "," + GridView4.DataKeys[i].Value.ToString();
                    }
                }
            }
            if (!string.IsNullOrEmpty(cal))
            {
                int j = 0;
                for (j = 0; j < (cal.Split(',')).Length; j++)
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select jsid,jsr from OA_RWD02 where jsid='" + cal.Split(',')[j] + "'");
                    if (datar.Read())
                    {
                        mestr = mestr + "," + datar["jsr"].ToString();
                    }
                    datar.Close();
                }
            }

            if (!string.IsNullOrEmpty(ca2))
            {
                string message = "�������[" + hkdb.GetStr(rwdh.Text) + "]" + lblrwbt.Text + ";��������!" + this.Session["username"].ToString();
                string templateParam = "{\"name\":\"" + lblrwbt.Text + "\",\"status\":" + "\"������\"" + "}";
                hkdb.SendAliSMS(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), ca2, message, templateParam);
                var arr = ca2.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                for (i = 0; i < arr.Length; i++)
                {
                    string s = Convert.ToString(SqlHelper.ExecuteScalar("select score from yh WHERE ui_id ='" + arr[i] + "'"));
                    int ss = Convert.ToInt32(s);
                    SqlHelper.ExecuteSql("Update yh set score='" + (ss - 3) + "' WHERE ui_id='" + arr[i] + "'");
                    SqlHelper.ExecuteSql("insert into OA_RwPunish (rwid,reason,person,createuser,createtime) values ('" + hkdb.GetStr(rwidstr.Text) + "','" + hkdb.GetStr(reason.Text) + "','" + arr[i] + "','" + this.Session["userid"] + "', GETDATE())");
                }
                mydb.Alert_Close("���ɹ�����");

            }
            if (!string.IsNullOrEmpty(ca3))
            {
                string message = "�������[" + hkdb.GetStr(rwdh.Text) + "]" + lblrwbt.Text + ";��������!" + this.Session["username"].ToString();
                string templateParam = "{\"name\":\"" + lblrwbt.Text + "\",\"status\":" + "\"������\"" + "}";
                hkdb.SendAliSMS(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), ca3, message, templateParam);
                var arr = ca3.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                for (i = 0; i < arr.Length; i++)
                {
                    string s = Convert.ToString(SqlHelper.ExecuteScalar("select score from yh WHERE ui_id ='" + arr[i] + "'"));
                    int ss = Convert.ToInt32(s);
                    SqlHelper.ExecuteSql("Update yh set score='" + (ss - 3) + "' WHERE ui_id='" + arr[i] + "'");
                    SqlHelper.ExecuteSql("insert into OA_RwPunish (rwid,reason,person,createuser,createtime) values ('" + hkdb.GetStr(rwidstr.Text) + "','" + hkdb.GetStr(reason.Text) + "','" + arr[i] + "','" + this.Session["userid"] + "', GETDATE())");

                }
                mydb.Alert_Close("���ɹ�����");
            }
            if (!string.IsNullOrEmpty(ca4))
            {
                string message = "�������[" + hkdb.GetStr(rwdh.Text) + "]" + lblrwbt.Text + ";��������!" + this.Session["username"].ToString();
                string templateParam = "{\"name\":\"" + lblrwbt.Text + "\",\"status\":" + "\"������\"" + "}";
                hkdb.SendAliSMS(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), ca4, message, templateParam);
                var arr = ca4.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                for (i = 0; i < arr.Length; i++)
                {
                    string s = Convert.ToString(SqlHelper.ExecuteScalar("select score from yh WHERE ui_id ='" + arr[i] + "'"));
                    int ss = Convert.ToInt32(s);
                    SqlHelper.ExecuteSql("Update yh set score='" + (ss - 3) + "' WHERE ui_id='" + arr[i] + "'");
                    SqlHelper.ExecuteSql("insert into OA_RwPunish (rwid,reason,person,createuser,createtime) values ('" + hkdb.GetStr(rwidstr.Text) + "','" + hkdb.GetStr(reason.Text) + "','" + arr[i] + "','" + this.Session["userid"] + "', GETDATE())");

                }
                mydb.Alert_Close("���ɹ�����");
            }

            if (string.IsNullOrEmpty(mestr))
            {
                //mydb.Alert("����ѡ����ִ������");
            }
            else
            {
                string message = "�������[" + hkdb.GetStr(rwdh.Text) + "]" + lblrwbt.Text + ";��������!" + this.Session["username"].ToString();
                string templateParam = "{\"name\":\"" + lblrwbt.Text + "\",\"status\":" + "\"������\"" + "}";
                hkdb.SendAliSMS(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), mestr.Substring(1), message, templateParam);
                var arr = mestr.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                for (i = 0; i < arr.Length; i++)
                {
                    string s = Convert.ToString(SqlHelper.ExecuteScalar("select score from yh WHERE ui_id ='" + arr[i] + "'"));
                    int ss = Convert.ToInt32(s);
                    SqlHelper.ExecuteSql("Update yh set score='" + (ss - 3) + "' WHERE ui_id='" + arr[i] + "'");
                    SqlHelper.ExecuteSql("insert into OA_RwPunish (rwid,reason,person,createuser,createtime) values ('" + hkdb.GetStr(rwidstr.Text) + "','" + hkdb.GetStr(reason.Text) + "','" + arr[i] + "','" + this.Session["userid"] + "', GETDATE())");

                }
                mydb.Alert_Close("���ɹ�����");
            }



        }
        //���ͨ�� 
        protected void Yes_Click(object sender, EventArgs e)
        {
            string cal1 = "";
            int i1 = 0;
            string mestr1 = "";
            for (i1 = 0; i1 <= GridView1.Rows.Count - 1; i1++)
            {
                CheckBox cb = (CheckBox)GridView1.Rows[i1].Cells[1].FindControl("del");


                if (cb.Checked == true)
                {
                    if (string.IsNullOrEmpty(cal1))
                    {
                        cal1 = GridView1.DataKeys[i1].Value.ToString();
                    }
                    else
                    {
                        cal1 = cal1 + "," + GridView1.DataKeys[i1].Value.ToString();
                    }
                }
            }

            if (!string.IsNullOrEmpty(cal1))
            {
                int j = 0;
                for (j = 0; j < (cal1.Split(',')).Length; j++)
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select jsid,jsr from OA_RWD02 where jsid='" + cal1.Split(',')[j] + "'");
                    if (datar.Read())
                    {
                        mestr1 = mestr1 + "," + datar["jsr"].ToString();
                    }
                    datar.Close();
                }
                //��������
                string rwpf = Convert.ToString(SqlHelper.ExecuteScalar("select p_string from hk_Csda where paramt = 'p_rwpf'"));
                string[] arr_rwpf = rwpf.Split('|');
                string rwpf_val = "0";
                switch (sppj.SelectedValue)
                {
                    case "��":
                        rwpf_val = arr_rwpf[0];
                        break;
                    case "��":
                        rwpf_val = arr_rwpf[1];
                        break;
                    case "��":
                        rwpf_val = arr_rwpf[2];
                        break;
                    case "��":
                        rwpf_val = arr_rwpf[3];
                        break;
                    default:
                        rwpf_val = "0";
                        break;

                }
                var cal_tt = mestr1.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                int ii = 0;
                if (sppj.SelectedValue=="��")
                {
                    for (ii = 0; ii < cal_tt.Length; ii++)
                    {
                        string s = Convert.ToString(SqlHelper.ExecuteScalar("select score from yh WHERE ui_id ='" + cal_tt[ii] + "'"));
                        int ss = Convert.ToInt32(s);
                        SqlHelper.ExecuteSql("Update yh set score='" + (ss +10) + "' WHERE ui_id='" + cal_tt[ii] + "'");
                    }
                    SqlHelper.ExecuteSql("update OA_RWD02 set jszt='�Ѱ��',spr='" + this.Session["userid"] + "',spsj=getdate(),spyj='" + hkdb.GetStr(spyj.Text) + "',sppj='" + sppj.SelectedValue + "',sppf='" + rwpf_val + "' where jszt<>'δ����' and jsid in ('" + cal1 + "')");
                }
                 if (sppj.SelectedValue == "��")
                {
                    for (ii = 0; ii < cal_tt.Length; ii++)
                    {
                        string s = Convert.ToString(SqlHelper.ExecuteScalar("select score from yh WHERE ui_id ='" + cal_tt[ii] + "'"));
                        int ss = Convert.ToInt32(s);
                        SqlHelper.ExecuteSql("Update yh set score='" + (ss + 5) + "' WHERE ui_id='" + cal_tt[ii] + "'");
                    }
                    SqlHelper.ExecuteSql("update OA_RWD02 set jszt='�Ѱ��',spr='" + this.Session["userid"] + "',spsj=getdate(),spyj='" + hkdb.GetStr(spyj.Text) + "',sppj='" + sppj.SelectedValue + "',sppf='" + rwpf_val + "' where jszt<>'δ����' and jsid in ('" + cal1 + "')");
                }
                 if (sppj.SelectedValue == "��")
                {
                    for (ii = 0; ii < cal_tt.Length; ii++)
                    {
                        string s = Convert.ToString(SqlHelper.ExecuteScalar("select score from yh WHERE ui_id ='" + cal_tt[ii] + "'"));
                        int ss = Convert.ToInt32(s);
                        SqlHelper.ExecuteSql("Update yh set score='" + (ss + 0) + "' WHERE ui_id='" + cal_tt[ii] + "'");
                    }
                    SqlHelper.ExecuteSql("update OA_RWD02 set jszt='�Ѱ��',spr='" + this.Session["userid"] + "',spsj=getdate(),spyj='" + hkdb.GetStr(spyj.Text) + "',sppj='" + sppj.SelectedValue + "',sppf='" + rwpf_val + "' where jszt<>'δ����' and jsid in ('" + cal1 + "')");
                }
                if (sppj.SelectedValue == "��")
                {
                    for (ii = 0; ii < cal_tt.Length; ii++)
                    {
                        string s = Convert.ToString(SqlHelper.ExecuteScalar("select score from yh WHERE ui_id ='" + cal_tt[ii] + "'"));
                        int ss = Convert.ToInt32(s);
                        SqlHelper.ExecuteSql("Update yh set score='" + (ss - 5) + "' WHERE ui_id='" + cal_tt[ii] + "'");
                    }
                    SqlHelper.ExecuteSql("update OA_RWD02 set jszt='�Ѱ��',spr='" + this.Session["userid"] + "',spsj=getdate(),spyj='" + hkdb.GetStr(spyj.Text) + "',sppj='" + sppj.SelectedValue + "',sppf='" + rwpf_val + "' where jszt<>'δ����' and jsid in ('" + cal1 + "')");
                }
            }
            else
            {
                mydb.Alert("���ʧ��,����ѡ�������Ա��");
            }

            //Msg
            string cal = "";
            string mestr = "";
            int i = 0;
            for (i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Rows[i].Cells[1].FindControl("del");
                if (cb.Checked == true)
                {
                    if (string.IsNullOrEmpty(cal))
                    {
                        cal = GridView1.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        cal = cal + "," + GridView1.DataKeys[i].Value.ToString();
                    }
                }
            }

            if (!string.IsNullOrEmpty(cal))
            {
                int j = 0;
                for (j = 0; j < (cal.Split(',')).Length; j++)
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select jsid,jsr from OA_RWD02 where jsid='" + cal.Split(',')[j] + "'");
                    if (datar.Read())
                    {
                        mestr = mestr + "," + datar["jsr"].ToString();
                    }
                    datar.Close();
                }
            }

            if (string.IsNullOrEmpty(mestr))
            {
                mydb.Alert("���ʧ��,����ѡ�������Ա��");
            }
            else
            {
                //Msg 
                if (xxtz.Checked == true | dxtz.Checked == true)
                {
                    string message = "�������[" + hkdb.GetStr(rwdh.Text) + "]" + lblrwbt.Text + ";�����Ѿ����ͨ��!" + this.Session["username"].ToString();
                    string templateParam = "{\"name\":\"" + lblrwbt.Text + "\",\"status\":" + "\"���ͨ��\"" + "}";
                    //hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), mestr.Substring(1), message);
                    hkdb.SendAliSMS(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), mestr.Substring(1), message, templateParam);
                }
                spyj.Text = "";

                GridViewBind();
                mydb.Alert_Refresh("����ͨ�������ɹ���", "shdbrw.aspx");
            }
        }

        //����˻� 
        protected void No_Click(object sender, EventArgs e)
        {
            string cal_t = "";
            int i_t = 0;
            for (i_t = 0; i_t <= GridView1.Rows.Count - 1; i_t++)
            {
                CheckBox cb_t = (CheckBox)GridView1.Rows[i_t].Cells[1].FindControl("del");
                if (cb_t.Checked == true)
                {
                    if (string.IsNullOrEmpty(cal_t))
                    {
                        cal_t = GridView1.DataKeys[i_t].Value.ToString();
                    }
                    else
                    {
                        cal_t = cal_t + "','" + GridView1.DataKeys[i_t].Value.ToString();
                    }
                }
            }
            if (!string.IsNullOrEmpty(cal_t))
            {
                SqlHelper.ExecuteSql("update OA_RWD02 set jszt='����˻�',spr='" + this.Session["userid"] + "',spsj=getdate(),spyj='" + hkdb.GetStr(spyj.Text) + "',sppj='" + sppj.SelectedValue + "',thcs=thcs+1 where jszt not in('δ����','����˻�') and jsid in ('" + cal_t + "')");
            }
            else
            {
                mydb.Alert("���ʧ��,����ѡ�������Ա��");
            }

            //Msg
            string cal = "";
            string mestr = "";
            int i = 0;
            for (i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Rows[i].Cells[1].FindControl("del");
                if (cb.Checked == true)
                {
                    if (string.IsNullOrEmpty(cal))
                    {
                        cal = GridView1.DataKeys[i].Value.ToString();
                    }
                    else
                    {
                        cal = cal + "," + GridView1.DataKeys[i].Value.ToString();
                    }
                }
            }

            if (!string.IsNullOrEmpty(cal))
            {
                int j = 0;
                for (j = 0; j < (cal.Split(',')).Length; j++)
                {
                    SqlDataReader datar = SqlHelper.ExecuteReader("select jsid,jsr from OA_RWD02 where jsid='" + cal.Split(',')[j] + "'");
                    if (datar.Read())
                    {
                        mestr = mestr + "," + datar["jsr"].ToString();
                    }
                    datar.Close();
                }
            }

            if (string.IsNullOrEmpty(mestr))
            {
                mydb.Alert("���ʧ��,����ѡ�������Ա��");
            }
            else
            {
                //Msg 
                if (xxtz.Checked == true | dxtz.Checked == true)
                {
                    string message = "���棺�������[" + hkdb.GetStr(rwdh.Text) + "]" + lblrwbt.Text + ";�����Ѿ�������˻أ������½��ա���������!" + this.Session["username"].ToString();
                    string templateParam = "{\"name\":\"" + lblrwbt.Text + "\",\"status\":" + "\"����˻�\"" + "}";
                    hkdb.SendAliSMS(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), mestr.Substring(1), message, templateParam);
                    //hkdb.SendMsg(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), mestr.Substring(1), message);
                }

                spyj.Text = "";
                GridViewBind();
                mydb.Alert_Refresh("�����˻ز����ɹ���", "shdbrw.aspx");
            }

        }

        //������� 
        protected void Ok_Click(object sender, EventArgs e)
        {
            int str1 = 0;
            str1 = (int)SqlHelper.ExecuteScalar("select count(*) from OA_RWD02 where ssrwid='" + hkdb.GetStr(Request.QueryString["rwid"].ToString()) + "' and jszt<>'�Ѱ��'");
            if (str1 > 0)
            {
                mydb.Alert("��ǰ�����»���δ���ļ�¼�����ܱ����ɣ�");
            }
            else
            {
                string cal = "";
                string mestr = "";
                int i = 0;
                for (i = 0; i <= GridView1.Rows.Count - 1; i++)
                {
                    CheckBox cb = (CheckBox)GridView1.Rows[i].Cells[1].FindControl("del");
                    if (cb.Checked == true)
                    {
                        if (string.IsNullOrEmpty(cal))
                        {
                            cal = GridView1.DataKeys[i].Value.ToString();
                        }
                        else
                        {
                            cal = cal + "," + GridView1.DataKeys[i].Value.ToString();
                        }
                    }
                }

                if (!string.IsNullOrEmpty(cal))
                {
                    int j = 0;
                    for (j = 0; j < (cal.Split(',')).Length; j++)
                    {
                        SqlDataReader datar = SqlHelper.ExecuteReader("select jsid,jsr from OA_RWD02 where jsid='" + cal.Split(',')[j] + "'");
                        if (datar.Read())
                        {
                            mestr = mestr + "," + datar["jsr"].ToString();
                        }
                        datar.Close();
                    }
                }
                if (string.IsNullOrEmpty(mestr))
                {
                    mydb.Alert("����ѡ�������Ա��");
                }
                else
                {
                    string message = "�������[" + hkdb.GetStr(rwdh.Text) + "]" + lblrwbt.Text + ";�����Ѿ����!" + this.Session["username"].ToString();
                    string templateParam = "{\"name\":\"" + lblrwbt.Text + "\",\"status\":" + "\"�Ѱ��\"" + "}";
                    hkdb.SendAliSMS(xxtz.Checked, dxtz.Checked, this.Session["userid"].ToString(), mestr.Substring(1), message, templateParam);
                    SqlHelper.ExecuteSql("update OA_RWD01 set rwzt='�����',wcsj=getdate() where rwdh='" + hkdb.GetStr(rwdh.Text) + "'");
                    mydb.Alert_Refresh_Close("�����ѳɹ���ɣ�", "shdbrw.aspx");
                }
            }
        }

        //gv�д��� 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }
        public string isshowfj(string path)
        {
            string display = "";
            if (path == "../.." || path == "")
            {
                display = "display:none";
            }
            else
            {
                display = "display:block";
            }
            return display;
        }
    }
}
