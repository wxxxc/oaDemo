using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro
{
    public partial class Dbsy : System.Web.UI.Page
    {
        BindData bd = new BindData();

        public string sDbsy_p, sDbsy_e;
        protected void page_load(object sender, EventArgs e)
        {
            mydb hkdb = new mydb();
            hkdb.VeriSess("1");

            if (!IsPostBack)
            {
                //物业
                if (bd.CheckRepeat("SELECT Xh FROM hk_Init WHERE ProduID='F' AND ChildVersion='0'") == "true")
                {
                    lblpms.Text = "0";
                    sDbsy_p = "pms";
                }
                else
                {
                    lblpms.Text = "1";
                    sDbsy_p = "pms2";
                }

                //资产
                if (bd.CheckRepeat("SELECT Xh FROM hk_Init WHERE ProduID='E' AND ChildVersion='0'") == "true")
                {
                    lbleam.Text = "0";
                    sDbsy_e = "eam";
                }
                else
                {
                    lbleam.Text = "1";
                    sDbsy_e = "eam2";
                }

                GridViewBind();
            }
        }

        //绑定子程序 
        public void GridViewBind()
        {
            string Str1 = "";

            //物业、资产
            if (lblpms.Text == "0" | lbleam.Text == "0")
            {
                //判断公司
                if (this.Session["qyid"].ToString() != "001")
                {
                    Str1 = Str1 + " and f.ssgs ='" + this.Session["qyid"] + "'";
                }
            }

            SqlDataReader dr = SqlHelper.ExecuteReader("SELECT A.sstdid,B.topn,B.days FROM hk_Groups_ToDo A LEFT OUTER JOIN hk_ToDo B ON(A.SSTDID=B.ID) WHERE ssgid in(SELECT ssgid FROM v_Groups_User WHERE ui_id='" + this.Session["userid"] + "')");
            while (dr.Read())
            {
                switch (dr["sstdid"].ToString())
                {
                    case "m01":  //审批商品招商
                        m01_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*)as nums from SC_ZSDA_SP where zt='送审中' "));
                        img_m01.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (m01_count.Text != "0")
                        {
                            m01_count.ForeColor = System.Drawing.Color.White;
                            m01_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_m01 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " a.id,a.gsmc,a.sqr,a.sqsj,b.ui_desc from SC_ZSDA_SP a left outer join yh b on (a.sqr=b.ui_id) where zt='送审中'");
                        GridView_m01.DataSource = ds_m01;
                        GridView_m01.DataBind();
                        m01p.Visible = true;
                        break;
                    case "m02":  //审批业务招商
                        m02_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*)as nums from SC_ZSDA_YW where zt='送审中'"));
                        img_m02.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (m02_count.Text != "0")
                        {
                            m02_count.ForeColor = System.Drawing.Color.White;
                            m02_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_m02 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " a.id,a.gsmc,a.sqr,a.sqsj,b.ui_desc from SC_ZSDA_YW a left outer join yh b on (a.sqr=b.ui_id) where zt='送审中'");
                        GridView_m02.DataSource = ds_m02;
                        GridView_m02.DataBind();
                        m02p.Visible = true;
                        break;
                    case "m03":  //审批设备招商
                        m03_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*)as nums from SC_ZSDA_SB where zt='送审中'"));
                        img_m03.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (m03_count.Text != "0")
                        {
                            m03_count.ForeColor = System.Drawing.Color.White;
                            m03_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_m03 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " a.id,a.csmc,a.sqr,a.sqsj,b.ui_desc from SC_ZSDA_SB a left outer join yh b on (a.sqr=b.ui_id) where zt='送审中'");
                        GridView_m03.DataSource = ds_m03;
                        GridView_m03.DataBind();
                        m03p.Visible = true;
                        break;
                    case "m04":  //审批新品申请
                        m04_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*) as nums from SC_XPDA01 where xp_zt='送审中'"));
                        img_m04.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (m04_count.Text != "0")
                        {
                            m04_count.ForeColor = System.Drawing.Color.White;
                            m04_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_m04 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " a.xp_txm,a.xp_qc,a.xp_ssfl,xp_sqr,xp_sqsj,b.ui_desc,d.ui_gys,c.mc,e.cs_mc from SC_XPDA01 a left outer join yh b on (a.xp_sqr=b.ui_id) left outer join hk_ZDYLX c on (a.xp_ssfl=c.id) left outer join yh_scm d on(b.ui_id=d.ssyhid) left outer join SC_CS e on (d.ui_gys=e.cs_id) where xp_zt='送审中'");
                        GridView_m04.DataSource = ds_m04;
                        GridView_m04.DataBind();
                        m04p.Visible = true;
                        break;



                    case "m05":  //到期供应商帐户
                        m05_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*)as nums from yh where ui_lx='供应商' and ui_status='正常' and ui_edate<=getdate()+" + dr["days"].ToString() + " and ui_edate>getdate()"));
                        img_m05.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        if (m05_count.Text != "0")
                        {
                            m05_count.ForeColor = System.Drawing.Color.White;
                            m05_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_m05 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " ui_id,ui_desc,ui_gys,ui_yddh,ui_mail,ui_edate,e.cs_mc from yh a left outer join yh_scm d on(a.ui_id=d.ssyhid) left outer join SC_CS e on (d.ui_gys=e.cs_id) where ui_lx='供应商' and ui_status='正常' and ui_edate<=getdate()+" + dr["days"].ToString() + " and ui_edate>getdate()");
                        GridView_m05.DataSource = ds_m05;
                        GridView_m05.DataBind();
                        m05p.Visible = true;
                        break;



                    case "m06": //未被查收订单
                        m06_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*) as nums from SC_DHD01 a left outer join SC_DHD_QR b on (a.dd_id=b.dd_id) where (b.dd_cszt='Χ' or b.dd_cszt is null)"));
                        img_m06.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (m06_count.Text != "0")
                        {
                            m06_count.ForeColor = System.Drawing.Color.White;
                            m06_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_m06 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " a.dd_id,a.dd_md,a.dd_gys,a.dd_dhrq,b.cs_mc,c.md_mc from SC_DHD01 a left outer join SC_CS b on (a.dd_gys=b.cs_id) left outer join SC_MD c on (a.dd_md=c.md_id) left outer join SC_DHD_QR e on (a.dd_id=e.dd_id) where (e.dd_cszt='Χ' or e.dd_cszt is null)");
                        GridView_m06.DataSource = ds_m06;
                        GridView_m06.DataBind();
                        m06p.Visible = true;
                        break;
                    case "m07":  //未被确认的经销对帐单
                        m07_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*)as nums from SC_JXDZ01 a left outer join SC_JXDZ_QR d on (a.jx01_id=d.jxdz_id) where jxdz_qrzt is null"));
                        img_m07.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (m07_count.Text != "0")
                        {
                            m07_count.ForeColor = System.Drawing.Color.White;
                            m07_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_m07 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " a.jx01_id,a.jx01_gys,a.jx01_date,a.jx01_bz,b.cs_mc from SC_JXDZ01 a left outer join SC_CS b on (a.jx01_gys=b.cs_id) left outer join SC_JXDZ_QR d on (a.jx01_id=d.jxdz_id) where jxdz_qrzt is null");
                        GridView_m07.DataSource = ds_m07;
                        GridView_m07.DataBind();
                        m07p.Visible = true;
                        break;
                    case "m08":  //未被确认的联营对帐单
                        m08_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*)as nums from SC_LYDZ01 a left outer join SC_LYDZ_QR d on (a.ly01_id=d.lydz_id) where lydz_qrzt is null"));
                        img_m08.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (m08_count.Text != "0")
                        {
                            m08_count.ForeColor = System.Drawing.Color.White;
                            m08_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_m08 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " a.ly01_id,a.ly01_gys,a.ly01_date,a.ly01_bz,b.cs_mc from SC_LYDZ01 a left outer join SC_CS b on (a.ly01_gys=b.cs_id) left outer join SC_LYDZ_QR d on (a.ly01_id=d.lydz_id) where lydz_qrzt is null");
                        GridView_m08.DataSource = ds_m08;
                        GridView_m08.DataBind();
                        m08p.Visible = true;
                        break;
                    case "m09":  //挂起经销对帐单
                        m09_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*)as nums from SC_JXDZ01 a left outer join SC_JXDZ_QR d on (a.jx01_id=d.jxdz_id) where jxdz_qrzt ='Χ'"));
                        img_m09.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (m09_count.Text != "0")
                        {
                            m09_count.ForeColor = System.Drawing.Color.White;
                            m09_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_m09 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " a.jx01_id,a.jx01_gys,a.jx01_date,b.cs_mc,d.jxdz_qrsm from SC_JXDZ01 a left outer join SC_CS b on (a.jx01_gys=b.cs_id) left outer join SC_JXDZ_QR d on (a.jx01_id=d.jxdz_id) where jxdz_qrzt ='Χ'");
                        GridView_m09.DataSource = ds_m09;
                        GridView_m09.DataBind();
                        m09p.Visible = true;
                        break;
                    case "m10":  //挂起联营对帐单
                        m10_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*)as nums from SC_LYDZ01 a left outer join SC_LYDZ_QR d on (a.ly01_id=d.lydz_id) where lydz_qrzt ='Χ'"));
                        img_m10.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (m10_count.Text != "0")
                        {
                            m10_count.ForeColor = System.Drawing.Color.White;
                            m10_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_m10 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " a.ly01_id,a.ly01_gys,a.ly01_date,b.cs_mc,d.lydz_qrsm from SC_LYDZ01 a left outer join SC_CS b on (a.ly01_gys=b.cs_id) left outer join SC_LYDZ_QR d on (a.ly01_id=d.lydz_id) where lydz_qrzt ='Χ'");
                        GridView_m10.DataSource = ds_m10;
                        GridView_m10.DataBind();
                        m10p.Visible = true;
                        break;


                    case "m11":  //到期厂商合同
                        m11_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*)as nums from SC_HT where ht_edate <= getdate()+" + dr["days"].ToString() + " and ht_edate>getdate()"));
                        img_m11.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        if (m11_count.Text != "0")
                        {
                            m11_count.ForeColor = System.Drawing.Color.White;
                            m11_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_m11 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " ht_id,ht_gys,ht_jyfs,ht_zt,ht_sdate,ht_edate,cs_mc from SC_HT a left outer join SC_CS b on (a.ht_gys=b.cs_id) where ht_edate <= getdate()+" + dr["days"].ToString() + " and ht_edate>getdate()");
                        GridView_m11.DataSource = ds_m11;
                        GridView_m11.DataBind();
                        m11p.Visible = true;
                        break;


                    case "o06":  //审批会议申请
                        o06_count.Text = SqlHelper.ExecuteScalar("select count(*) as nums from oa_hyqc where zt='送审中'").ToString();
                        img_o06.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (o06_count.Text != "0")
                        {
                            o06_count.ForeColor = System.Drawing.Color.White;
                            o06_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_o06 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " a.id,a.hyzt,a.kssj,a.fqr,d.hys_mc,e.ui_desc from oa_hyqc a left outer join oa_hys d on (a.zkdd=d.hys_id) left outer join yh e on (a.fqr=e.ui_id) where zt='送审中' order by a.fqsj desc");
                        GridView_o06.DataSource = ds_o06;
                        GridView_o06.DataBind();
                        o06p.Visible = true;
                        break;
                    case "o07":  //车辆申请 
                        o07_count.Text = SqlHelper.ExecuteScalar("select count(*) as nums from OA_CLSQ a left outer join yh b on (a.sqr=b.ui_id) left outer JOIN BM c on (a.sqbm=c.bm_id) where zt='审批中'").ToString();
                        img_o07.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (o07_count.Text != "0")
                        {
                            o07_count.ForeColor = System.Drawing.Color.White;
                            o07_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_o07 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " a.*,b.ui_desc,c.bm_mc from OA_CLSQ a left outer join yh b on (a.sqr=b.ui_id) left outer JOIN BM c on (a.sqbm=c.bm_id) where zt='审批中'");
                        GridView_o07.DataSource = ds_o07;
                        GridView_o07.DataBind();
                        o07p.Visible = true;
                        break;
                    case "o08":  //资源申请
                        o08_count.Text = SqlHelper.ExecuteScalar("select count(*) as nums from OA_ZYSQ a left outer JOIN BM b on (a.sybm=b.bm_id) left outer join OA_ZYDJ c on (a.sqzy=c.djid) where a.zt='审批中' and getdate()<sysj").ToString();
                        img_o08.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (o08_count.Text != "0")
                        {
                            o08_count.ForeColor = System.Drawing.Color.White;
                            o08_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_o08 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " a.*,b.bm_mc,c.zymc from OA_ZYSQ a left outer JOIN BM b on (a.sybm=b.bm_id) left outer join OA_ZYDJ c on (a.sqzy=c.djid) where a.zt='审批中' and getdate()<sysj");
                        GridView_o08.DataSource = ds_o08;
                        GridView_o08.DataBind();
                        o08p.Visible = true;
                        break;
                    case "o09": //个人计划审批
                        o09_count.Text = SqlHelper.ExecuteScalar("select count(*) from OA_GZJH01 where jhsx='0' and zt='审核中' and CHARINDEX('" + this.Session["userid"] + "',sprIDs)>0").ToString();
                        img_o09.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (o09_count.Text != "0")
                        {
                            o09_count.ForeColor = System.Drawing.Color.White;
                            o09_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_o09 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " a.jhid,a.ztmb,a.jhnf,a.jhyf,a.sprNames,c.ui_desc from OA_GZJH01 a left outer join yh c on (a.jhz=c.ui_id) where jhsx='0' and zt='审核中' and CHARINDEX('" + this.Session["userid"] + "',sprIDs)>0");
                        GridView_o09.DataSource = ds_o09;
                        GridView_o09.DataBind();
                        o09p.Visible = true;
                        break;
                    case "o10":  //部门计划审批
                        o10_count.Text = SqlHelper.ExecuteScalar("select count(*) from OA_GZJH01 where jhsx='1' and zt='审核中' and CHARINDEX('" + this.Session["userid"] + "',sprIDs)>0").ToString();
                        img_o10.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (o10_count.Text != "0")
                        {
                            o10_count.ForeColor = System.Drawing.Color.White;
                            o10_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_o10 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " a.jhid,a.ztmb,a.jhnf,a.jhyf,a.sprNames,c.ui_desc from OA_GZJH01 a left outer join yh c on (a.jhz=c.ui_id) where jhsx='1' and zt='审核中' and CHARINDEX('" + this.Session["userid"] + "',sprIDs)>0");
                        GridView_o10.DataSource = ds_o10;
                        GridView_o10.DataBind();
                        o10p.Visible = true;
                        break;
                    case "o12": //客户信息提醒
                        o12_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*) from ((select khid,gmr,gmrq,gmrdw,gmrzw,spmc,gmsl,syr,'30天'as tx from OA_KHDA01 Where gmrq<getdate()-30 and gmrq>getdate()-180 and hfqk1 is null) union (select khid,gmr,gmrq,gmrdw,gmrzw,spmc,gmsl,syr,'180天'as tx from OA_KHDA01 Where gmrq<getdate()-180 and gmrq>getdate()-300 and hfqk2 is null) union (select khid,gmr,gmrq,gmrdw,gmrzw,spmc,gmsl,syr,'300天'as tx from OA_KHDA01 Where gmrq<getdate()-300 and hfqk3 is null)) as oa_khda01"));
                        img_o12.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (o12_count.Text != "0")
                        {
                            o12_count.ForeColor = System.Drawing.Color.White;
                            o12_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_o12 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " * from ((select khid,gmr,gmrq,gmrdw,gmrzw,spmc,gmsl,syr,'30天'as tx from OA_KHDA01 Where gmrq<getdate()-30 and gmrq>getdate()-180 and hfqk1 is null) union (select khid,gmr,gmrq,gmrdw,gmrzw,spmc,gmsl,syr,'180天'as tx from OA_KHDA01 Where gmrq<getdate()-180 and gmrq>getdate()-300 and hfqk2 is null) union (select khid,gmr,gmrq,gmrdw,gmrzw,spmc,gmsl,syr,'300天'as tx from OA_KHDA01 Where gmrq<getdate()-300 and hfqk3 is null)) as oa_khda01 order by gmrq");
                        GridView_o12.DataSource = ds_o12;
                        GridView_o12.DataBind();
                        o12p.Visible = true;
                        break;
                    case "o21": //等待审批的年度费用计划
                        o21_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*) from YS_Ndjh01 where FormId='1' and (CHARINDEX('," + this.Session["userid"] + ",',','+JBRObjectId+',')>0)"));
                        img_o21.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (o21_count.Text != "0")
                        {
                            o21_count.ForeColor = System.Drawing.Color.White;
                            o21_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_o21 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " * from YS_Ndjh01 where FormId='1' and (CHARINDEX('," + this.Session["userid"] + ",',','+JBRObjectId+',')>0)");
                        GridView_o21.DataSource = ds_o21;
                        GridView_o21.DataBind();
                        o21p.Visible = true;
                        break;
                    case "o22": //等待审批的计划费用报销
                        o22_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*) from YS_Jhbx01 where FormId='2' and (CHARINDEX('," + this.Session["userid"] + ",',','+JBRObjectId+',')>0)"));
                        img_o22.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (o22_count.Text != "0")
                        {
                            o22_count.ForeColor = System.Drawing.Color.White;
                            o22_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_o22 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " * from YS_Jhbx01 where FormId='2' and (CHARINDEX('," + this.Session["userid"] + ",',','+JBRObjectId+',')>0)");
                        GridView_o22.DataSource = ds_o22;
                        GridView_o22.DataBind();
                        o22p.Visible = true;
                        break;
                    case "o23": //等待审批的直接费用报销
                        o23_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*) from YS_Zjbx01 where FormId='3' and (CHARINDEX('," + this.Session["userid"] + ",',','+JBRObjectId+',')>0)"));
                        img_o23.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (o23_count.Text != "0")
                        {
                            o23_count.ForeColor = System.Drawing.Color.White;
                            o23_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_o23 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " * from YS_Zjbx01 where FormId='3' and (CHARINDEX('," + this.Session["userid"] + ",',','+JBRObjectId+',')>0)");
                        GridView_o23.DataSource = ds_o23;
                        GridView_o23.DataBind();
                        o23p.Visible = true;
                        break;
                    case "o24": //等待审批的计划费用调整
                        o24_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*) from YS_Jhtz01 where FormId='4' and (CHARINDEX('," + this.Session["userid"] + ",',','+JBRObjectId+',')>0)"));
                        img_o24.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (o24_count.Text != "0")
                        {
                            o24_count.ForeColor = System.Drawing.Color.White;
                            o24_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_o24 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " * from YS_Jhtz01 where FormId='4' and (CHARINDEX('," + this.Session["userid"] + ",',','+JBRObjectId+',')>0)");
                        GridView_o24.DataSource = ds_o24;
                        GridView_o24.DataBind();
                        o24p.Visible = true;
                        break;
                    case "w01": //待办工作审批
                        string str_w01 = " WHERE (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+wUserIDs+',') > 0)";
                        //工作流
                        if (this.Session["UserID"].ToString() == "8888")
                        {
                            str_w01 = str_w01 + " AND (A.ynJQ='否' OR (A.ynJQ='是' AND wUserIDs='8888,'))";
                        }

                        w01_count.Text = SqlHelper.ExecuteScalar("SELECT count(*) FROM hk_Work A" + str_w01).ToString();
                        img_w01.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (w01_count.Text != "0")
                        {
                            w01_count.ForeColor = System.Drawing.Color.White;
                            w01_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_w01 = SqlHelper.ExecuteDs("SELECT TOP " + dr["topn"].ToString() + " A.*,B.fName,C.fnName,D.ui_desc FROM hk_Work A LEFT OUTER JOIN hk_Form B ON(A.FK_fid=B.fID) LEFT OUTER JOIN hk_WorkFlowNode C ON(A.FK_fnno=C.fnNo) LEFT OUTER JOIN yh D ON(A.PromoterID=D.ui_id) " + str_w01 + " ORDER BY A.wID DESC");
                        GridView_w01.DataSource = ds_w01;
                        GridView_w01.DataBind();
                        w01p.Visible = true;
                        break;
                    case "r01": //待审阅的分析结果
                        r01_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*)as nums from RPT_LOG a left outer join hk_Modu b on (a.bbid=b.modu_id) left outer join RPT_FL d on (b.modu_bbfl=d.flid) where a.llzt='未审阅' and d.glry='" + this.Session["userid"] + "'"));
                        img_r01.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (r01_count.Text != "0")
                        {
                            r01_count.ForeColor = System.Drawing.Color.White;
                            r01_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_r01 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " id,bbid,b.modu_mc,fxsj,fxr,substring(fxjg,1,20)+'...'as fxjg,c.ui_desc from RPT_LOG a left outer join hk_Modu b on (a.bbid=b.modu_id) left outer join yh c on (a.fxr=c.ui_id) left outer join RPT_FL d on (b.modu_bbfl=d.flid) where a.llzt='未审阅' and d.glry='" + this.Session["userid"] + "'");
                        GridView_r01.DataSource = ds_r01;
                        GridView_r01.DataBind();
                        r01p.Visible = true;
                        break;
                    case "r02": //尚未分析的报表
                        r02_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*) as nums from (select distinct a.modu_id from RPT_DY a LEFT OUTER JOIN RPT_DYFZ b on (a.fzid=b.fzid) where (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+b.Fzyhid+',')>0) and len(a.modu_id)=5)as c  left outer join (select bbid,max(fxsj)as fxsj from RPT_LOG where fxr='" + this.Session["userid"] + "' group by bbid)as d on (c.modu_id=d.bbid) left outer JOIN hk_Modu e on (c.modu_id=e.modu_id) where fxsj is null or fxsj not between convert(char(10),getdate(),020) and convert(char(10),getdate()+1,020)"));
                        img_r02.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (r02_count.Text != "0")
                        {
                            r02_count.ForeColor = System.Drawing.Color.White;
                            r02_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_r02 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " c.modu_id,d.fxsj,e.modu_mc,e.modu_wjlj from (select distinct a.modu_id from RPT_DY a LEFT OUTER JOIN RPT_DYFZ b on (a.fzid=b.fzid) where (CHARINDEX('," + this.Session["userid"].ToString() + ",',','+b.Fzyhid+',')>0) and len(a.modu_id)=5)as c left outer join (select bbid,max(fxsj)as fxsj from RPT_LOG where fxr='" + this.Session["userid"] + "' group by bbid)as d on (c.modu_id=d.bbid) left outer join hk_Modu e on (c.modu_id=e.modu_id) where fxsj is null or fxsj not between convert(char(10),getdate(),020) and convert(char(10),getdate()+1,020)");
                        GridView_r02.DataSource = ds_r02;
                        GridView_r02.DataBind();
                        r02p.Visible = true;
                        break;


                    case "f01": //租赁合同预警
                        img_f01.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        DataSet ds_f01 = SqlHelper.ExecuteDs("SELECT TOP " + dr["topn"].ToString() + " HTID,HTNO,B.ZHBM,B.ZHMC,F.LXR,QZRQ,TZRQ,ZQ,HTJE,ZMJ FROM ZH_ZLHT F LEFT OUTER JOIN ZH_TENANT B ON(F.SSZHID=B.ZHID) WHERE TZRQ BETWEEN convert(char(10),GETDATE(),020) AND convert(char(10),GETDATE()+" + dr["days"].ToString() + ",020) AND HTZT='已生效' " + Str1 + " ORDER BY TZRQ");
                        GridView_f01.DataSource = ds_f01;
                        GridView_f01.DataBind();
                        f01p.Visible = true;
                        break;
                    case "f02": //租金到期预警
                        img_f02.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        DataSet ds_f02 = SqlHelper.ExecuteDs("SELECT TOP " + dr["topn"].ToString() + " F.HTID,F.HTNO,F.QZRQ,F.TZRQ,F.ZQ,C.ZHBM,C.ZHMC,F.LXR,A.JZRQ FROM (SELECT SSHTID,MAX(JZRQ)AS JZRQ FROM ZH_ZJSQ WHERE SQZT='已收款' GROUP BY SSHTID) A LEFT OUTER JOIN ZH_ZLHT F ON(A.SSHTID=F.HTID) LEFT OUTER JOIN ZH_TENANT C ON(F.SSZHID=C.ZHID) WHERE F.HTZT='已生效' AND JZRQ BETWEEN convert(char(10),GETDATE(),020) AND convert(char(10),GETDATE()+" + dr["days"].ToString() + ",020) " + Str1 + " ORDER BY A.JZRQ");
                        GridView_f02.DataSource = ds_f02;
                        GridView_f02.DataBind();
                        f02p.Visible = true;
                        break;
                    case "f03": //物业费欠费预警
                        img_f03.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        DataSet ds_f03 = SqlHelper.ExecuteDs("EXEC sp_WY_FYJS_QFYJ '" + dr["topn"].ToString() + "','" + this.Session["qyid"] + "'");
                        GridView_f03.DataSource = ds_f03;
                        GridView_f03.DataBind();
                        f03p.Visible = true;
                        break;
                    case "f04": //物业费到期预警
                        img_f04.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        DataSet ds_f04 = SqlHelper.ExecuteDs("EXEC sp_WY_FYJS_SFYJ '" + this.Session["qyid"] + "','" + dr["days"].ToString() + "','" + dr["topn"].ToString() + "'");
                        GridView_f04.DataSource = ds_f04;
                        GridView_f04.DataBind();
                        f04p.Visible = true;
                        break;






                    case "f05": //待办理的投诉记录
                        f05_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*) as nums from zh_zhts a left outer join fc_cell b on a.cellcode=b.code left outer join FC_DY c on (b.ssdyid=c.dyid) left outer join FC_LG d on (c.sslgid=d.lgid) left outer join FC_LP f on (d.sslpid=f.lpid) where hfr IS NULL " + Str1));
                        img_f05.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (f05_count.Text != "0")
                        {
                            f05_count.ForeColor = System.Drawing.Color.White;
                            f05_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_f05 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " a.id,a.cellcode,a.tsr,a.tsnr,a.tsdate,a.jdr,a.lxdh,a.sljg,b.name as cellname,a.ksslsj,c.name as dyname,d.name as lgname,f.name as xqname,yjj,b.name,g.ui_desc from zh_zhts a left outer join fc_cell b on a.cellcode=b.cellid left outer join FC_DY c on (b.ssdyid=c.dyid) left outer join FC_LG d on (c.sslgid=d.lgid) left outer join FC_LP f on (d.sslpid=f.lpid) left outer join yh g on (a.ksslr=g.ui_id) where hfr IS NULL " + Str1 + " order by a.cjsj desc");
                        GridView_f05.DataSource = ds_f05;
                        GridView_f05.DataBind();
                        f05p.Visible = true;
                        break;
                    case "f06": //待办理的服务记录
                        f06_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*) as nums from zh_zhfw a left outer join fc_cell b on a.sscellid=b.cellid left outer join FC_DY c on (b.ssdyid=c.dyid) left outer join FC_LG d on (c.sslgid=d.lgid) left outer join FC_LP f on (d.sslpid=f.lpid) where hfr IS NULL " + Str1));
                        img_f06.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (f06_count.Text != "0")
                        {
                            f06_count.ForeColor = System.Drawing.Color.White;
                            f06_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_f06 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " a.*,(case when bs='2' then '业主录入' else '物业录入' end)as lb,(case when a.zt='待审批' then 'Fwdfp_View' when a.zt IN('审批通过','办理中') then 'Fwdbl_View' when a.zt='已办结' then 'Fwdhf_View' end)as pagename,b.name as cellname,c.name as dyname,d.name as lgname,f.name as xqname,g.lxmc from zh_zhfw a left outer join fc_cell b on a.sscellid=b.cellid left outer join FC_DY c on (b.ssdyid=c.dyid) left outer join FC_LG d on (c.sslgid=d.lgid) left outer join FC_LP f on (d.sslpid=f.lpid) left outer JOIN ZH_ZHFW_LX g on (a.fwlx=g.lxid) where hfr IS NULL " + Str1 + "order by a.cjsj desc");
                        GridView_f06.DataSource = ds_f06;
                        GridView_f06.DataBind();
                        f06p.Visible = true;
                        break;
                    case "f07": //待办理的装修记录
                        f07_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*) as nums from zh_zhzx a left outer join fc_cell b on a.cellcode=b.cellid left outer join FC_DY c on (b.ssdyid=c.dyid) left outer join FC_LG d on (c.sslgid=d.lgid) left outer join FC_LP f on (d.sslpid=f.lpid) where zt not in('已验收','已作废') " + Str1));
                        img_f07.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (f07_count.Text != "0")
                        {
                            f07_count.ForeColor = System.Drawing.Color.White;
                            f07_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_f07 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " a.id,a.cellcode,a.sqr,a.zxnr,a.sqdate,a.zxyj,a.wyj,a.zt,b.name as cellname,a.spdate,c.name as dyname,d.name as lgname,f.name as xqname,b.name,g.ui_desc from zh_zhzx a left outer join fc_cell b on a.cellcode=b.cellid left outer join FC_DY c on (b.ssdyid=c.dyid) left outer join FC_LG d on (c.sslgid=d.lgid) left outer join FC_LP f on (d.sslpid=f.lpid) left outer join yh g on (a.spr=g.ui_id) where zt not in('已验收','已作废') " + Str1 + "order by a.cjsj desc");
                        GridView_f07.DataSource = ds_f07;
                        GridView_f07.DataBind();
                        f07p.Visible = true;
                        break;
                    case "f08": //待办理的请修记录
                        f08_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select count(*)as nums from zh_zhqx a left outer join fc_cell b on a.cellcode=b.cellid left outer join FC_DY c on (b.ssdyid=c.dyid) left outer join FC_LG d on (c.sslgid=d.lgid) left outer join FC_LP f on (d.sslpid=f.lpid) where a.zt<>'已验收' " + Str1));
                        img_f08.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (f08_count.Text != "0")
                        {
                            f08_count.ForeColor = System.Drawing.Color.White;
                            f08_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_f08 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " a.id,a.cellcode,a.sqr,a.qxnr,a.sqdate,a.xlfy,a.zt,a.spyj,a.ysyj,b.name as cellname,a.spdate,c.name as dyname,d.name as lgname,f.name as xqname,b.name,g.ui_desc from zh_zhqx a left outer join fc_cell b on a.cellcode=b.cellid left outer join FC_DY c on (b.ssdyid=c.dyid) left outer join FC_LG d on (c.sslgid=d.lgid) left outer join FC_LP f on (d.sslpid=f.lpid) left outer join yh g on (a.spr=g.ui_id) where a.zt<>'已验收' " + Str1 + " order by a.cjsj desc");
                        GridView_f08.DataSource = ds_f08;
                        GridView_f08.DataBind();
                        f08p.Visible = true;
                        break;
                    case "e01": //低于安全库存数量的物品预警
                        e01_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select COUNT(*) as nums from AS_KC a left outer join AS_CK f on (a.ssckid=f.ckid) left outer join AS_WP c on (a.sswpid=c.wpid) left outer join AS_KCFZ e on (c.sskcfz=e.fzid) where c.zclx='9' and c.sskcfz<>'' and e.zdkcsl>a.kcsl " + Str1));
                        img_e01.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        if (e01_count.Text != "0")
                        {
                            e01_count.ForeColor = System.Drawing.Color.White;
                            e01_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_e01 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " a.ssckid,a.sswpid,a.kcsl,a.kcje,f.ckmc,c.wpbm,c.wptxm,c.wpmc,c.ssfl,d.fl_mc,c.wppp,c.wpxh,c.wpgys,c.wpgg,c.wpdj,e.zdkcsl from AS_KC a left outer join AS_CK f on (a.ssckid=f.ckid) left outer join AS_WP c on (a.sswpid=c.wpid) left outer join as_wpfl d on (c.ssfl=d.fl_id) left outer join AS_KCFZ e on (c.sskcfz=e.fzid) where c.zclx='9' and c.sskcfz<>'' and e.zdkcsl>a.kcsl " + Str1 + " order by ssckid desc");
                        GridView_e01.DataSource = ds_e01;
                        GridView_e01.DataBind();
                        e01p.Visible = true;
                        break;




                    case "e02": //最近需要维修/保养的资产
                        e02_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select COUNT(*) as nums from AS_WP f WHERE f.zclx<>'9' AND f.wpzt='正常' AND f.zjwxsj+wxzq BETWEEN convert(char(10),GETDATE(),020) AND convert(char(10),GETDATE()+" + dr["days"].ToString() + ",020)" + Str1));
                        img_e02.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        if (e02_count.Text != "0")
                        {
                            e02_count.ForeColor = System.Drawing.Color.White;
                            e02_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_e02 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " f.wpid,f.wpbm,f.wpmc,f.wptxm,f.wpgg,f.wpxh,f.grrq,b.fl_mc,c.ckmc,d.bm_mc,f.wxzq,f.zjwxsj+wxzq AS bcwxsj from AS_WP f left outer join as_wpfl b on (f.ssfl=b.fl_id) left outer join AS_CK c on(f.cfdd=c.ckid) left outer join bm d on(f.sybm=d.bm_id) WHERE f.zclx<>'9' AND f.wpzt='正常' AND f.zjwxsj+wxzq BETWEEN convert(char(10),GETDATE(),020) AND convert(char(10),GETDATE()+" + dr["days"].ToString() + ",020) " + Str1 + " order by f.zjwxsj+wxzq");
                        GridView_e02.DataSource = ds_e02;
                        GridView_e02.DataBind();
                        e02p.Visible = true;
                        break;
                    case "e03": //即将报废到期的资产
                        e03_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("select COUNT(*) as nums from AS_WP f WHERE f.zclx<>'9' AND f.wpzt='正常' and (f.bgrid='" + this.Session["UserID"] + "' or f.syrid='" + this.Session["UserID"] + "') AND dateadd(month,f.xyycys,DATEADD(yy,f.synx,f.grrq))<=GETDATE()+" + dr["days"].ToString() + "" + Str1));
                        img_e03.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        if (e03_count.Text != "0")
                        {
                            e03_count.ForeColor = System.Drawing.Color.White;
                            e03_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_e03 = SqlHelper.ExecuteDs("select TOP " + dr["topn"].ToString() + " f.wpid,f.wpbm,f.wpmc,f.wptxm,f.wpgg,f.wpxh,f.grrq,f.synx,f.xyycys,b.fl_mc,c.ckmc,d.bm_mc,dateadd(month,f.xyycys,DATEADD(yy,f.synx,f.grrq)) as bfrq from AS_WP f left outer join as_wpfl b on (f.ssfl=b.fl_id) left outer join AS_CK c on(f.cfdd=c.ckid) left outer join bm d on(f.sybm=d.bm_id) WHERE f.zclx<>'9' AND f.wpzt='正常' and (f.bgrid='" + this.Session["UserID"] + "' or f.syrid='" + this.Session["UserID"] + "') AND dateadd(month,f.xyycys,DATEADD(yy,f.synx,f.grrq))<=GETDATE()+" + dr["days"].ToString() + " " + Str1 + " order by dateadd(month,f.xyycys,DATEADD(yy,f.synx,f.grrq)) desc");
                        GridView_e03.DataSource = ds_e03;
                        GridView_e03.DataBind();
                        e03p.Visible = true;
                        break;
                    case "k01": //即将年满3周岁幼儿提醒 
                        k01_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM KM_YEXX A LEFT OUTER JOIN KM_BJXX B ON(A.SSBJ=B.BJID) LEFT OUTER JOIN HK_ZDYLX C ON(B.SSNJ=C.ID) WHERE A.SSBM='" + this.Session["deptid"] + "' AND A.ZT='在园' AND (DATEADD(yy,3,GLSR) BETWEEN convert(char(10),getdate(),120) AND convert(char(10),getdate()+" + dr["days"].ToString() + ",120))"));
                        img_k01.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        if (k01_count.Text != "0")
                        {
                            k01_count.ForeColor = System.Drawing.Color.White;
                            k01_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_k01 = SqlHelper.ExecuteDs("SELECT TOP " + dr["topn"].ToString() + " A.KH,A.XM,A.XB,A.GLSR,SFLX,A.RYSJ,B.BJMC,C.MC AS NJ_MC FROM KM_YEXX A LEFT OUTER JOIN KM_BJXX B ON(A.SSBJ=B.BJID) LEFT OUTER JOIN HK_ZDYLX C ON(B.SSNJ=C.ID) WHERE A.SSBM='" + this.Session["deptid"] + "' AND A.ZT='在园' AND (DATEADD(yy,3,GLSR) BETWEEN convert(char(10),getdate(),120) AND convert(char(10),getdate()+" + dr["days"].ToString() + ",120)) ORDER BY A.KH DESC");
                        GridView_k01.DataSource = ds_k01;
                        GridView_k01.DataBind();
                        k01p.Visible = true;
                        break;
                    case "k02": //临近特殊提醒日期的幼儿
                        k02_count.Text = Convert.ToString(SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM KM_YEXX A LEFT OUTER JOIN KM_BJXX B ON(A.SSBJ=B.BJID) LEFT OUTER JOIN HK_ZDYLX C ON(B.SSNJ=C.ID) WHERE A.SSBM='" + this.Session["deptid"] + "' AND A.ZT='在园' AND TSTXRQ BETWEEN convert(char(10),getdate(),120) AND convert(char(10),getdate()+" + dr["days"].ToString() + ",120)"));
                        img_k02.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        if (k02_count.Text != "0")
                        {
                            k02_count.ForeColor = System.Drawing.Color.White;
                            k02_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_k02 = SqlHelper.ExecuteDs("SELECT TOP " + dr["topn"].ToString() + " A.KH,A.XM,A.XB,A.GLSR,SFLX,A.RYSJ,A.TSTXRQ,B.BJMC,C.MC AS NJ_MC FROM KM_YEXX A LEFT OUTER JOIN KM_BJXX B ON(A.SSBJ=B.BJID) LEFT OUTER JOIN HK_ZDYLX C ON(B.SSNJ=C.ID) WHERE A.SSBM='" + this.Session["deptid"] + "' AND A.ZT='在园' AND TSTXRQ BETWEEN convert(char(10),getdate(),120) AND convert(char(10),getdate()+" + dr["days"].ToString() + ",120) ORDER BY A.KH DESC");
                        GridView_k02.DataSource = ds_k02;
                        GridView_k02.DataBind();
                        k02p.Visible = true;
                        break;





                    case "k03": //本年各园所收支明细统计
                        k03_sr.Text = Convert.ToString(SqlHelper.ExecuteScalar("select isnull(sum(srje),0)as nums from KM_SRMX WHERE jzrq between DATEADD(yy, DATEDIFF(yy,0,GETDATE()), 0) and getdate() and zt='已审批'"));
                        k03_zc.Text = Convert.ToString(SqlHelper.ExecuteScalar("select isnull(sum(zcje),0)as nums from KM_ZCMX WHERE jzrq between DATEADD(yy, DATEDIFF(yy,0,GETDATE()), 0) and getdate() and zt='已审批'"));
                        k03_jy.Text = string.Format("{0:F2}", (Convert.ToDouble(k03_sr.Text) - Convert.ToDouble(k03_zc.Text)));

                        if (k03_jy.Text != "0")
                        {
                            k03_sr.ForeColor = System.Drawing.Color.White;
                            k03_zc.ForeColor = System.Drawing.Color.White;
                            k03_jy.ForeColor = System.Drawing.Color.White;
                            k03_sr.BackColor = System.Drawing.Color.Red;
                            k03_zc.BackColor = System.Drawing.Color.Red;
                            k03_jy.BackColor = System.Drawing.Color.Red;
                        }

                        img_k03.ToolTip = "默认显示" + dr["topn"].ToString() + "条";
                        DataSet ds_k03 = SqlHelper.ExecuteDs("SELECT TOP " + dr["topn"].ToString() + " A.*,c.bm_mc as ssbm_mc,d.ui_desc as cjr_mc FROM(select '收入' AS szlx,a.jzrq,a.ssbm,a.srje AS szje,a.sm,a.zt,a.cjr,a.cjsj,a.spr,a.spsj,a.spyj,b.xmmc from KM_SRMX a left outer join KM_SRXM b on(a.srxm=b.xmid) WHERE a.jzrq between DATEADD(yy, DATEDIFF(yy,0,GETDATE()), 0) and getdate() and a.zt='已审批' UNION ALL select '支出' AS szlx,a.jzrq,a.ssbm,a.zcje*-1 AS szje,a.sm,a.zt,a.cjr,a.cjsj,a.spr,a.spsj,a.spyj,b.xmmc from KM_ZCMX a left outer join KM_ZCXM b on(a.zcxm=b.xmid) WHERE a.jzrq between DATEADD(yy, DATEDIFF(yy,0,GETDATE()), 0) and getdate() and a.zt='已审批')A left outer join BM c ON (A.SSBM=c.BM_ID) left outer join yh d on (a.cjr=d.ui_id) order by A.jzrq,A.szlx");
                        GridView_k03.DataSource = ds_k03;
                        GridView_k03.DataBind();
                        k03p.Visible = true;
                        break;


                    case "h01":  //正式合同到期
                        h01_count.Text = SqlHelper.ExecuteScalar("select count(*) as nums from HR_Htxx where datediff(dd,getdate(),HeTongqxsj)<=" + dr["days"] + " and datediff(dd,getdate(),HeTongqxsj)>=0 and QiXian='有' and HtZt='生效中'").ToString();
                        img_h01.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        if (h01_count.Text != "0")
                        {
                            h01_count.ForeColor = System.Drawing.Color.White;
                            h01_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_h01 = SqlHelper.ExecuteDs("select top  " + dr["topn"].ToString() + " * from HR_Htxx where datediff(dd,getdate(),HeTongqxsj)<=" + dr["days"].ToString() + " and datediff(dd,getdate(),HeTongqxsj)>=0 and QiXian='有' and HtZt='生效中' order by id desc");
                        GridView_h01.DataSource = ds_h01;
                        GridView_h01.DataBind();
                        h01p.Visible = true;
                        break;
                    case "h02":  //试用合同到期
                        h02_count.Text = SqlHelper.ExecuteScalar("select count(*) as nums from HR_Htxx where datediff(dd,getdate(),ShiYongDq)<=" + dr["days"].ToString() + " and datediff(dd,getdate(),ShiYongDq)>=0 and QiXian='有' and HtZt='试用中'").ToString();
                        img_h02.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        if (h02_count.Text != "0")
                        {
                            h02_count.ForeColor = System.Drawing.Color.White;
                            h02_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_h02 = SqlHelper.ExecuteDs("select top " + dr["topn"].ToString() + " * from HR_Htxx where datediff(dd,getdate(),ShiYongDq)<=" + dr["days"].ToString() + " and datediff(dd,getdate(),ShiYongDq)>=0 and QiXian='有' and HtZt='试用中' order by id desc");
                        GridView_h02.DataSource = ds_h02;
                        GridView_h02.DataBind();
                        h02p.Visible = true;
                        break;
                    case "h03":  //保险到期
                        h03_count.Text = SqlHelper.ExecuteScalar("select count(*) as nums from HR_Bxgl where datediff(dd,getdate(),ShiXiaoSj)<=" + dr["days"].ToString() + " and datediff(dd,getdate(),ShiXiaoSj)>=0").ToString();
                        img_h03.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        if (h03_count.Text != "0")
                        {
                            h03_count.ForeColor = System.Drawing.Color.White;
                            h03_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_h03 = SqlHelper.ExecuteDs("select top " + dr["topn"].ToString() + " * from HR_Bxgl where datediff(dd,getdate(),ShiXiaoSj)<=" + dr["days"].ToString() + " and datediff(dd,getdate(),ShiXiaoSj)>=0 order by id desc");
                        GridView_h03.DataSource = ds_h03;
                        GridView_h03.DataBind();
                        h03p.Visible = true;
                        break;
                    case "h04":  //员工生日
                        h04_count.Text = SqlHelper.ExecuteScalar("select count(*) as nums from HR_Rsda where (((month(ChuSheng)=month(getdate())) and (day(ChuSheng)-day(getdate())) between 0 and " + dr["days"].ToString() + ") or ((month(ChuSheng-" + dr["days"].ToString() + ")=month(getdate())) and (day(ChuSheng-" + dr["days"].ToString() + ")-day(getdate())) between -" + dr["days"].ToString() + " and 0)) and YgZhuangTai='在职'").ToString();
                        img_h04.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        if (h04_count.Text != "0")
                        {
                            h04_count.ForeColor = System.Drawing.Color.White;
                            h04_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_h04 = SqlHelper.ExecuteDs("select top " + dr["topn"].ToString() + " * from HR_Rsda where (((month(ChuSheng)=month(getdate())) and (day(ChuSheng)-day(getdate())) between 0 and " + dr["days"].ToString() + ") or ((month(ChuSheng-" + dr["days"].ToString() + ")=month(getdate())) and (day(ChuSheng-" + dr["days"].ToString() + ")-day(getdate())) between -" + dr["days"].ToString() + " and 0)) and YgZhuangTai='在职' order by id desc");
                        GridView_h04.DataSource = ds_h04;
                        GridView_h04.DataBind();
                        h04p.Visible = true;
                        break;
                    case "h05":  //证照到期
                        h05_count.Text = SqlHelper.ExecuteScalar("select count(*) as nums from HR_ZZGL where datediff(dd,getdate(),DqRiQi)<=" + dr["days"].ToString() + " and datediff(dd,getdate(),DqRiQi)>=0 and XianZhi='有'").ToString();
                        img_h05.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        if (h05_count.Text != "0")
                        {
                            h05_count.ForeColor = System.Drawing.Color.White;
                            h05_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_h05 = SqlHelper.ExecuteDs("select top " + dr["topn"].ToString() + " * from HR_ZZGL where datediff(dd,getdate(),DqRiQi)<=" + dr["days"].ToString() + " and datediff(dd,getdate(),DqRiQi)>=0 and XianZhi='有' order by id desc");
                        GridView_h05.DataSource = ds_h05;
                        GridView_h05.DataBind();
                        h05p.Visible = true;
                        break;
                    case "h06":  //职称申报
                        h06_count.Text = SqlHelper.ExecuteScalar("select count(*) as nums from HR_ZCGL where datediff(dd,getdate(),XCShiJian)<=" + dr["days"].ToString() + " and datediff(dd,getdate(),XCShiJian)>=0").ToString();
                        img_h06.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        if (h06_count.Text != "0")
                        {
                            h06_count.ForeColor = System.Drawing.Color.White;
                            h06_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_h06 = SqlHelper.ExecuteDs("select top " + dr["topn"].ToString() + " * from HR_ZCGL where datediff(dd,getdate(),XCShiJian)<=" + dr["days"].ToString() + " and datediff(dd,getdate(),XCShiJian)>=0 order by id desc");
                        GridView_h06.DataSource = ds_h06;
                        GridView_h06.DataBind();
                        h06p.Visible = true;
                        break;
                    case "h07":  //招聘计划开始
                        h07_count.Text = SqlHelper.ExecuteScalar("select count(*) as nums from HR_Zpjh01 where datediff(dd,getdate(),Jhkssj)<=" + dr["days"].ToString() + " and datediff(dd,getdate(),Jhkssj)>=0 and State='正常结束'").ToString();
                        img_h07.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        if (h07_count.Text != "0")
                        {
                            h07_count.ForeColor = System.Drawing.Color.White;
                            h07_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_h07 = SqlHelper.ExecuteDs("select top " + dr["topn"].ToString() + " * from HR_Zpjh01 where datediff(dd,getdate(),Jhkssj)<=" + dr["days"].ToString() + " and datediff(dd,getdate(),Jhkssj)>=0 and State='正常结束' order by id desc");
                        GridView_h07.DataSource = ds_h07;
                        GridView_h07.DataBind();
                        h07p.Visible = true;
                        break;
                    case "h08":  //培训计划开始
                        h08_count.Text = SqlHelper.ExecuteScalar("select count(*) as nums from HR_Pxjh where datediff(dd,getdate(),Kaishi)<=" + dr["days"].ToString() + " and datediff(dd,getdate(),Kaishi)>=0").ToString();
                        img_h08.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        if (h08_count.Text != "0")
                        {
                            h08_count.ForeColor = System.Drawing.Color.White;
                            h08_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_h08 = SqlHelper.ExecuteDs("select top " + dr["topn"].ToString() + " * from HR_Pxjh where datediff(dd,getdate(),Kaishi)<=" + dr["days"].ToString() + " and datediff(dd,getdate(),Kaishi)>=0 order by id desc");
                        GridView_h08.DataSource = ds_h08;
                        GridView_h08.DataBind();
                        h08p.Visible = true;
                        break;

                    case "c01":  //客户待办事宜
                        c01_count.Text = SqlHelper.ExecuteScalar("select count(*) as nums from CR_Dbsy A left outer join CR_Khxx C on A.KhId = C.id where C.IfDel=0 and C.Username='" + Session["userid"] + "' and datediff(dd,getdate(),A.Shijian)<=" + dr["days"].ToString() + " and datediff(dd,getdate(),A.Shijian)>0").ToString();
                        img_c01.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        if (c01_count.Text != "0")
                        {
                            c01_count.ForeColor = System.Drawing.Color.White;
                            c01_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_c01 = SqlHelper.ExecuteDs("select top " + dr["topn"].ToString() + " A.id,A.KhId,A.Zhuti,A.Lxr,A.Shijian,A.Zhuangtai,A.Leixing,B.mc as LeixingName,C.ZhuJiJc as KhName from CR_Dbsy A left outer join hk_ZDYLX B ON A.Leixing = B.id left outer join CR_Khxx C on A.KhId = C.id where C.IfDel=0 and C.Username='" + Session["userid"] + "' and datediff(dd,getdate(),A.Shijian)<=" + dr["days"].ToString() + " and datediff(dd,getdate(),A.Shijian)>0 order by A.id desc");
                        GridView_c01.DataSource = ds_c01;
                        GridView_c01.DataBind();
                        c01p.Visible = true;
                        break;
                    case "c02":  //即将到期及过期合同订单
                        c02_count.Text = SqlHelper.ExecuteScalar("select count(*) as nums from CR_Htjl A left outer join CR_Khxx C on A.KhId = C.id where C.IfDel=0 and C.Username='" + Session["userid"] + "' and datediff(dd,getdate(),A.JieshuRi)<=" + dr["days"].ToString() + " and A.Zhuangtai='1'").ToString();
                        img_c02.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        if (c02_count.Text != "0")
                        {
                            c02_count.ForeColor = System.Drawing.Color.White;
                            c02_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_c02 = SqlHelper.ExecuteDs("select top " + dr["topn"].ToString() + " A.id,A.Zhuti,A.KhId,A.Fenlei,A.Zhuangtai,A.KaishiRi,A.JieshuRi,A.Jine,A.HtDd,B.mc as FenleiName,C.ZhuJiJc as KhName from CR_Htjl A left outer join hk_ZDYLX B ON A.Fenlei = B.id left outer join CR_Khxx C on A.KhId = C.id where C.IfDel=0 and C.Username='" + Session["userid"] + "' and datediff(dd,getdate(),A.JieshuRi)<=" + dr["days"].ToString() + " and A.Zhuangtai='1' order by A.id desc");
                        GridView_c02.DataSource = ds_c02;
                        GridView_c02.DataBind();
                        c02p.Visible = true;
                        break;
                    case "c03":  //即将到期及过期未交付计划
                        c03_count.Text = SqlHelper.ExecuteScalar("select count(*) as nums from CR_Jfjh A left outer join CR_Cpxx B on A.CpId = B.id  left outer join CR_Htjl D on A.HtDd = D.id left outer join CR_Khxx C on D.KhId = C.id where C.IfDel=0 and C.Username='" + Session["userid"] + "' and datediff(dd,getdate(),A.ShijianJh)<=" + dr["days"].ToString() + " and A.JfJL='1'").ToString();
                        img_c03.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        if (c03_count.Text != "0")
                        {
                            c03_count.ForeColor = System.Drawing.Color.White;
                            c03_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_c03 = SqlHelper.ExecuteDs("select top " + dr["topn"].ToString() + " A.*,D.KhId,B.Mingcheng as CpName,C.ZhuJiJc as KhName from CR_Jfjh A left outer join CR_Cpxx B on A.CpId = B.id  left outer join CR_Htjl D on A.HtDd = D.id left outer join CR_Khxx C on D.KhId = C.id where C.IfDel=0 and C.Username='" + Session["userid"] + "' and datediff(dd,getdate(),A.ShijianJh)<=" + dr["days"].ToString() + " and A.JfJL='1' order by A.id desc");
                        GridView_c03.DataSource = ds_c03;
                        GridView_c03.DataBind();
                        c03p.Visible = true;
                        break;
                    case "c04":  //即将到期及过期未回款计划
                        c04_count.Text = SqlHelper.ExecuteScalar("select count(*) as nums from CR_Hkjh A left outer join CR_Htjl D on A.HtDd = D.id left outer join CR_Khxx C on D.KhId = C.id where C.IfDel=0 and C.Username='" + Session["userid"] + "' and datediff(dd,getdate(),A.HuikuanRq)<=" + dr["days"].ToString() + " and A.Huikuan='1'").ToString();
                        img_c04.ToolTip = "默认显示" + dr["topn"].ToString() + "条,提前" + dr["days"].ToString() + "天提醒";
                        if (c04_count.Text != "0")
                        {
                            c04_count.ForeColor = System.Drawing.Color.White;
                            c04_count.BackColor = System.Drawing.Color.Red;
                        }
                        DataSet ds_c04 = SqlHelper.ExecuteDs("select top " + dr["topn"].ToString() + " A.*,D.KhId,C.ZhuJiJc as KhName from CR_Hkjh A left outer join CR_Htjl D on A.HtDd = D.id left outer join CR_Khxx C on D.KhId = C.id where C.IfDel=0 and C.Username='" + Session["userid"] + "' and datediff(dd,getdate(),A.HuikuanRq)<=" + dr["days"].ToString() + " and A.Huikuan='1' order by A.id desc");
                        GridView_c04.DataSource = ds_c04;
                        GridView_c04.DataBind();
                        c04p.Visible = true;
                        break;
                }
            }
            dr.Close();
        }

        //刷新 
        protected void Refresh_Click(object sender, System.EventArgs e)
        {
            GridViewBind();
        }

        //gv行处理 
        protected void OnRow_Bound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";
            }
        }

        //gv行处理_c02
        protected void OnRow_Bound_c02(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = "javascript:changeBg(this)";

                Label Lid = (Label)e.Row.FindControl("Lid_c02");
                Label ll2 = (Label)e.Row.FindControl("lblyhk_c02");

                SqlDataReader drs = SqlHelper.ExecuteReader("select sum(Jine) as AllShuliang from CR_Hkjl where HtDd='" + Lid.Text + "'");
                if (drs.Read())
                {
                    if (drs["AllShuliang"].ToString() == "")
                    {
                        ll2.Text = "0";
                    }
                    else
                    {
                        ll2.Text = drs["AllShuliang"].ToString();
                    }
                }
                else
                {
                    ll2.Text = "0";
                }
                drs.Close();
            }
        }
    }
}
