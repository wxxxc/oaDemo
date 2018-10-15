using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Ykqmx : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11719", "11719");

                DropDownListBind();

                //缺省月份
                if (Request.Cookies["haoke"].Values["sdate"].ToString() == "2001-01-01")
                {
                    kqrq.Text = "2015-01";
                }
                else
                {
                    kqrq.Text = string.Format("{0:yyyy-MM}", DateTime.Now);
                }

                //页面绑定
                GridViewBind();
            }
        }

        public void DropDownListBind()
        {
            bd.Bind_DropDownList_bm(bm, "", "", "");
        }

        //gv绑定 
        public void GridViewBind()
        {
            string sql = " WHERE SUBSTRING(CONVERT(CHAR(10),KQRQ,021),1,7)='" + hkdb.GetStr(kqrq.Text) + "' AND A.YNSBR='是'";

            if (!string.IsNullOrEmpty(bm.SelectedValue))
            {
                sql = sql + " and C.UI_SSBM='" + bm.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(ry.SelectedValue))
            {
                sql = sql + " AND C.UI_ID='" + ry.SelectedValue + "'";
            }

            //AspNetPager1.RecordCount = (int)SqlHelper.ExecuteScalar("SELECT count(*) FROM(SELECT yhid,ui_desc,bm_mc,SUM(cd)AS cd,SUM(wqd1)+SUM(wqd2) AS wqd,SUM(wqt1)+SUM(wqt2) AS wqt,SUM(kg)AS kg FROM(SELECT kqrq,rybh,xm,yhid,ui_desc,bm_mc,(CASE WHEN ynqj='Y' THEN 0 ELSE cd END)AS cd,(CASE WHEN ynqj='Y' THEN 0 ELSE wqd1 END)AS wqd1,(CASE WHEN ynqj='Y' THEN 0 ELSE wqd2 END)AS wqd2,(CASE WHEN ynqj='Y' THEN 0 ELSE wqt1 END)AS wqt1,(CASE WHEN ynqj='Y' THEN 0 ELSE wqt2 END)AS wqt2,(CASE WHEN ynqj='Y' THEN 0 ELSE kg END)AS kg FROM(SELECT A.KQRQ,A.RYBH,A.XM,B.YHID,C.UI_DESC,D.BM_MC,(CASE WHEN cd=0 THEN 0 ELSE 1 END)AS cd,(CASE WHEN sb1<>'' THEN 0 ELSE 1 END)AS wqd1,(CASE WHEN sb3<>'' THEN 0 ELSE 1 END)AS wqd2,(CASE WHEN xb2<>'' THEN 0 ELSE 1 END)AS wqt1,(CASE WHEN xb4<>'' THEN 0 ELSE 1 END)AS wqt2,(CASE WHEN sb1<>'' OR xb2<>'' OR sb3<>'' OR xb4<>'' THEN 0 ELSE 1 END)kg,(SELECT TOP 1 'Y' FROM OA_KQ_QJD01 WHERE QJZT='已确认' AND SQRID=b.YHID AND A.KQRQ BETWEEN qjkssj AND qjjssj) AS ynqj FROM oa_kqxx A LEFT OUTER JOIN oa_kq_qx B ON(A.RYBH=B.KQID) LEFT OUTER JOIN YH C ON(B.YHID=C.UI_ID) LEFT OUTER JOIN BM D ON(C.UI_SSBM=D.BM_ID) " + sql + ")T1)T2 GROUP BY YHID,UI_DESC,BM_MC)T3 WHERE cd>0 OR wqd>0 OR wqt>0 OR kg>0");
            DataSet ds = SqlHelper.ExecuteDs("SELECT * FROM(SELECT yhid,ui_desc,bm_bm,bm_mc,SUM(cdcs1)+SUM(cdcs2)+SUM(cdcs3) AS cdcs,SUM(ztcs1)+SUM(ztcs2)+SUM(ztcs3) AS ztcs,SUM(wqdcs1)+SUM(wqdcs2)+SUM(wqdcs3) AS wqdcs,SUM(wqtcs1)+SUM(wqtcs2)+SUM(wqtcs3) AS wqtcs,SUM(kgcs1)+SUM(kgcs2)+SUM(kgcs3) AS kgcs FROM(SELECT kqrq,rybh,xm,yhid,ui_desc,bm_bm,bm_mc,(CASE WHEN ynqd1='是' THEN 0 ELSE cdcs1 END)AS cdcs1,(CASE WHEN ynqt1='是' THEN 0 ELSE ztcs1 END)AS ztcs1,(CASE WHEN ynqj='Y' OR ynqd1='是' OR ynqt1='是' THEN 0 ELSE kgcs1 END)AS kgcs1,(CASE WHEN ynqj='Y' OR ynqd1='是' THEN 0 ELSE wqdcs1 END)AS wqdcs1,(CASE WHEN ynqj='Y' OR ynqt1='是' THEN 0 ELSE wqtcs1 END)AS wqtcs1,(CASE WHEN ynqd2='是' THEN 0 ELSE cdcs2 END)AS cdcs2,(CASE WHEN ynqt2='是' THEN 0 ELSE ztcs2 END)AS ztcs2,(CASE WHEN ynqj='Y' OR ynqd2='是' OR ynqt2='是' THEN 0 ELSE kgcs2 END)AS kgcs2,(CASE WHEN ynqj='Y' OR ynqd2='是' THEN 0 ELSE wqdcs2 END)AS wqdcs2,(CASE WHEN ynqj='Y' OR ynqt2='是' THEN 0 ELSE wqtcs2 END)AS wqtcs2,(CASE WHEN ynqd3='是' THEN 0 ELSE cdcs3 END)AS cdcs3,(CASE WHEN ynqt3='是' THEN 0 ELSE ztcs3 END)AS ztcs3,(CASE WHEN ynqj='Y' OR ynqd3='是' OR ynqt3='是' THEN 0 ELSE kgcs3 END)AS kgcs3,(CASE WHEN ynqj='Y' OR ynqd3='是' THEN 0 ELSE wqdcs3 END)AS wqdcs3,(CASE WHEN ynqj='Y' OR ynqt3='是' THEN 0 ELSE wqtcs3 END)AS wqtcs3 FROM(SELECT A.KQRQ,A.RYBH,A.XM,B.YHID,C.UI_DESC,D.BM_BM,D.BM_MC,ISNULL(A.cdcs1,0)AS cdcs1,ISNULL(A.ztcs1,0)AS ztcs1,ISNULL(A.wqdcs1,0)AS wqdcs1,ISNULL(A.wqtcs1,0)AS wqtcs1,ISNULL(A.kgcs1,0)AS kgcs1,ISNULL(A.cdcs2,0)AS cdcs2,ISNULL(A.ztcs2,0)AS ztcs2,ISNULL(A.wqdcs2,0)AS wqdcs2,ISNULL(A.wqtcs2,0)AS wqtcs2,ISNULL(A.kgcs2,0)AS kgcs2,ISNULL(A.cdcs3,0)AS cdcs3,ISNULL(A.ztcs3,0)AS ztcs3,ISNULL(A.wqdcs3,0)AS wqdcs3,ISNULL(A.wqtcs3,0)AS wqtcs3,ISNULL(A.kgcs3,0)AS kgcs3,(SELECT TOP 1 'Y' FROM OA_KQ_QJD01 WHERE QJZT='已确认' AND SQRID=b.YHID AND A.KQRQ BETWEEN qjkssj AND qjjssj) AS ynqj,(SELECT TOP 1 ynqd1 FROM OA_KQ_SM01 WHERE smzt='已确认' AND SQRID=b.YHID AND A.KQRQ=qdsj) AS ynqd1,(SELECT TOP 1 ynqt1 FROM OA_KQ_SM01 WHERE smzt='已确认' AND SQRID=b.YHID AND A.KQRQ=qdsj) AS ynqt1,(SELECT TOP 1 ynqd2 FROM OA_KQ_SM01 WHERE smzt='已确认' AND SQRID=b.YHID AND A.KQRQ=qdsj) AS ynqd2,(SELECT TOP 1 ynqt2 FROM OA_KQ_SM01 WHERE smzt='已确认' AND SQRID=b.YHID AND A.KQRQ=qdsj) AS ynqt2,(SELECT TOP 1 ynqd3 FROM OA_KQ_SM01 WHERE smzt='已确认' AND SQRID=b.YHID AND A.KQRQ=qdsj) AS ynqd3,(SELECT TOP 1 ynqt3 FROM OA_KQ_SM01 WHERE smzt='已确认' AND SQRID=b.YHID AND A.KQRQ=qdsj) AS ynqt3 FROM oa_kqxx A LEFT OUTER JOIN oa_kq_qx B ON(A.RYBH=B.KQID) LEFT OUTER JOIN YH C ON(B.YHID=C.UI_ID) LEFT OUTER JOIN BM D ON(C.UI_SSBM=D.BM_ID) " + sql + ")T1)T2 GROUP BY YHID,UI_DESC,BM_BM,BM_MC)T3 WHERE cdcs>0 OR ztcs>0 OR wqdcs>0 OR wqtcs>0 OR kgcs>0 ORDER BY bm_bm,yhid");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        //protected void AspNetPager1_PageChanged(object sender, System.EventArgs e)
        //{
        //    GridViewBind();
        //}

        protected void Clear_Click(object sender, EventArgs e)
        {
            bm.SelectedValue = "";
            ry.SelectedValue = "";
        }

        //查询 
        protected void Ref_Click(object sender, EventArgs e)
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

        //导出
        protected void Exp_Click(object sender, EventArgs e)
        {
            string sql = " WHERE SUBSTRING(CONVERT(CHAR(10),KQRQ,021),1,7)='" + hkdb.GetStr(kqrq.Text) + "' AND A.YNSBR='是'";

            if (!string.IsNullOrEmpty(bm.SelectedValue))
            {
                sql = sql + " and C.UI_SSBM='" + bm.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(ry.SelectedValue))
            {
                sql = sql + " AND C.UI_ID='" + ry.SelectedValue + "'";
            }

            DataSet ds = SqlHelper.ExecuteDs("SELECT YHID AS '用户编码',UI_DESC AS '姓名',bm_mc as '部门',CDCS AS '迟到次数',ZTCS AS '早退次数',WQDCS AS '未签到次数',WQTCS AS '未签退次数',KGCS AS '旷工次数' FROM(SELECT yhid,ui_desc,bm_bm,bm_mc,SUM(cdcs1)+SUM(cdcs2)+SUM(cdcs3) AS cdcs,SUM(ztcs1)+SUM(ztcs2)+SUM(ztcs3) AS ztcs,SUM(wqdcs1)+SUM(wqdcs2)+SUM(wqdcs3) AS wqdcs,SUM(wqtcs1)+SUM(wqtcs2)+SUM(wqtcs3) AS wqtcs,SUM(kgcs1)+SUM(kgcs2)+SUM(kgcs3) AS kgcs FROM(SELECT kqrq,rybh,xm,yhid,ui_desc,bm_bm,bm_mc,(CASE WHEN ynqd1='是' THEN 0 ELSE cdcs1 END)AS cdcs1,(CASE WHEN ynqt1='是' THEN 0 ELSE ztcs1 END)AS ztcs1,(CASE WHEN ynqj='Y' OR ynqd1='是' OR ynqt1='是' THEN 0 ELSE kgcs1 END)AS kgcs1,(CASE WHEN ynqj='Y' OR ynqd1='是' THEN 0 ELSE wqdcs1 END)AS wqdcs1,(CASE WHEN ynqj='Y' OR ynqt1='是' THEN 0 ELSE wqtcs1 END)AS wqtcs1,(CASE WHEN ynqd2='是' THEN 0 ELSE cdcs2 END)AS cdcs2,(CASE WHEN ynqt2='是' THEN 0 ELSE ztcs2 END)AS ztcs2,(CASE WHEN ynqj='Y' OR ynqd2='是' OR ynqt2='是' THEN 0 ELSE kgcs2 END)AS kgcs2,(CASE WHEN ynqj='Y' OR ynqd2='是' THEN 0 ELSE wqdcs2 END)AS wqdcs2,(CASE WHEN ynqj='Y' OR ynqt2='是' THEN 0 ELSE wqtcs2 END)AS wqtcs2,(CASE WHEN ynqd3='是' THEN 0 ELSE cdcs3 END)AS cdcs3,(CASE WHEN ynqt3='是' THEN 0 ELSE ztcs3 END)AS ztcs3,(CASE WHEN ynqj='Y' OR ynqd3='是' OR ynqt3='是' THEN 0 ELSE kgcs3 END)AS kgcs3,(CASE WHEN ynqj='Y' OR ynqd3='是' THEN 0 ELSE wqdcs3 END)AS wqdcs3,(CASE WHEN ynqj='Y' OR ynqt3='是' THEN 0 ELSE wqtcs3 END)AS wqtcs3 FROM(SELECT A.KQRQ,A.RYBH,A.XM,B.YHID,C.UI_DESC,D.BM_BM,D.BM_MC,ISNULL(A.cdcs1,0)AS cdcs1,ISNULL(A.ztcs1,0)AS ztcs1,ISNULL(A.wqdcs1,0)AS wqdcs1,ISNULL(A.wqtcs1,0)AS wqtcs1,ISNULL(A.kgcs1,0)AS kgcs1,ISNULL(A.cdcs2,0)AS cdcs2,ISNULL(A.ztcs2,0)AS ztcs2,ISNULL(A.wqdcs2,0)AS wqdcs2,ISNULL(A.wqtcs2,0)AS wqtcs2,ISNULL(A.kgcs2,0)AS kgcs2,ISNULL(A.cdcs3,0)AS cdcs3,ISNULL(A.ztcs3,0)AS ztcs3,ISNULL(A.wqdcs3,0)AS wqdcs3,ISNULL(A.wqtcs3,0)AS wqtcs3,ISNULL(A.kgcs3,0)AS kgcs3,(SELECT TOP 1 'Y' FROM OA_KQ_QJD01 WHERE QJZT='已确认' AND SQRID=b.YHID AND A.KQRQ BETWEEN qjkssj AND qjjssj) AS ynqj,(SELECT TOP 1 ynqd1 FROM OA_KQ_SM01 WHERE smzt='已确认' AND SQRID=b.YHID AND A.KQRQ=qdsj) AS ynqd1,(SELECT TOP 1 ynqt1 FROM OA_KQ_SM01 WHERE smzt='已确认' AND SQRID=b.YHID AND A.KQRQ=qdsj) AS ynqt1,(SELECT TOP 1 ynqd2 FROM OA_KQ_SM01 WHERE smzt='已确认' AND SQRID=b.YHID AND A.KQRQ=qdsj) AS ynqd2,(SELECT TOP 1 ynqt2 FROM OA_KQ_SM01 WHERE smzt='已确认' AND SQRID=b.YHID AND A.KQRQ=qdsj) AS ynqt2,(SELECT TOP 1 ynqd3 FROM OA_KQ_SM01 WHERE smzt='已确认' AND SQRID=b.YHID AND A.KQRQ=qdsj) AS ynqd3,(SELECT TOP 1 ynqt3 FROM OA_KQ_SM01 WHERE smzt='已确认' AND SQRID=b.YHID AND A.KQRQ=qdsj) AS ynqt3 FROM oa_kqxx A LEFT OUTER JOIN oa_kq_qx B ON(A.RYBH=B.KQID) LEFT OUTER JOIN YH C ON(B.YHID=C.UI_ID) LEFT OUTER JOIN BM D ON(C.UI_SSBM=D.BM_ID) " + sql + ")T1)T2 GROUP BY YHID,UI_DESC,BM_BM,BM_MC)T3 WHERE cdcs>0 OR ztcs>0 OR wqdcs>0 OR wqtcs>0 OR kgcs>0 ORDER BY bm_bm,yhid");

            string fileName = "Ykqmx.xls";
            ExcelHelper.ExportDataSetToExcel(ds, fileName, "月考勤明细");
        }

        //部门切换
        protected void bm_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(bm.SelectedValue))
            {
                ry.Items.Clear();

                string sql = "SELECT UI_ID,UI_ID+'-'+UI_DESC AS UI_DESC FROM YH WHERE UI_LX='企业' AND UI_SSBM='" + bm.SelectedValue + "' ORDER BY UI_ID";
                bd.Bind_DropDownList(ry, sql, "UI_ID", "UI_DESC", "", "");
            }
        }
    }
}
