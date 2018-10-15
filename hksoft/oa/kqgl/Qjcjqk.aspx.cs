using System;
using System.Data;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.oa.kqgl
{
    public partial class Qjcjqk : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("3");

            if (!IsPostBack)
            {
                hkdb.PassTo("11721", "11721");

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
            //统计月份所属年份第一天
            string strYear = kqrq.Text.Substring(0, 4);

            string sql = " WHERE A.QJZT='已确认' AND '" + hkdb.GetStr(kqrq.Text) + "-01' BETWEEN DATEADD(mm, DATEDIFF(mm,0,A.QJKSSJ), 0) AND dateadd(ms,-3,DATEADD(mm, DATEDIFF(m,0,A.QJJSSJ)+1, 0))";

            if (!string.IsNullOrEmpty(bm.SelectedValue))
            {
                sql = sql + " and A.sqbmid='" + bm.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(ry.SelectedValue))
            {
                sql = sql + " AND A.sqrid='" + ry.SelectedValue + "'";
            }

            DataSet ds = SqlHelper.ExecuteDs("SELECT SQBMMC,BM_BM,SQRID,SQRMC,QJLX,QJKSSJ,QJKSSD,QJJSSJ,QJJSSD,QJTS,(CASE WHEN QJLX NOT IN('年假','事假','病假') THEN 0 ELSE KeYongTS-ShiYongTS END)AS ShengYuTS FROM(SELECT SQBMMC,BM_BM,SQRID,SQRMC,QJLX,QJKSSJ,QJKSSD,QJJSSJ,QJJSSD,QJTS,(CASE WHEN qjlx='年假' THEN ISNULL(NJTS,0) WHEN qjlx='事假' THEN ISNULL(SHJTS,0) WHEN qjlx='病假' THEN ISNULL(BJTS,0) ELSE 0 END)AS KeYongTS,ShiYongTS FROM(SELECT A.SQBMMC,B.BM_BM,A.SQRID,A.SQRMC,QJLX,A.QJKSSJ,A.QJKSSD,A.QJJSSJ,A.QJJSSD,QJTS,(SELECT (CASE WHEN nian>=1 AND nian<10 THEN 5 WHEN nian>=10 AND nian<20 THEN 10 WHEN nian>=20 THEN 15 ELSE 0 END)AS njts FROM (SELECT ISNULL(DATEDIFF(YEAR,CONVERT(VARCHAR(4),ui_rzrq,112)+'.1.1',DATEADD(DAY,-DATEDIFF(DAY,CONVERT(VARCHAR(4),ui_rzrq,112)+'.1.1',ui_rzrq),convert(char(10),getdate(),111))),0)AS nian FROM yh WHERE ui_id=A.SQRID)Z)AS NJTS,(SELECT TOP 1 SHJTS FROM OA_KQ_JQFZ WHERE JQNF='" + strYear + "' AND CHARINDEX(A.SQRID,UserIDs)>0)AS SHJTS,(SELECT TOP 1 BJTS FROM OA_KQ_JQFZ WHERE JQNF='" + strYear + "' AND CHARINDEX(A.SQRID,UserIDs)>0)AS BJTS,(SELECT ISNULL(SUM(QJTS),0)AS QJTS FROM OA_KQ_QJD01 WHERE SQRID=A.SQRID AND QJLX=A.QJLX AND QJZT='已确认' AND DATEADD(yy, DATEDIFF(yy,0,QJKSSJ), 0)='" + strYear + "')ShiYongTS FROM OA_KQ_QJD01 A LEFT OUTER JOIN BM B ON(A.SQBMID=B.BM_ID) " + sql + ")T1)T2 ORDER BY BM_BM,SQRID");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

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
            //统计月份所属年份第一天
            string strYear = kqrq.Text.Substring(0, 4);

            string sql = " WHERE A.QJZT='已确认' AND '" + hkdb.GetStr(kqrq.Text) + "-01' BETWEEN DATEADD(mm, DATEDIFF(mm,0,A.QJKSSJ), 0) AND dateadd(ms,-3,DATEADD(mm, DATEDIFF(m,0,A.QJJSSJ)+1, 0))";

            if (!string.IsNullOrEmpty(bm.SelectedValue))
            {
                sql = sql + " and A.sqbmid='" + bm.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(ry.SelectedValue))
            {
                sql = sql + " AND A.sqrid='" + ry.SelectedValue + "'";
            }

            DataSet ds = SqlHelper.ExecuteDs("SELECT SQBMMC AS '部门',SQRID AS '用户编码',SQRMC AS '姓名',QJLX AS '请假类型',QJKSSJ AS '请假开始日期',QJKSSD AS '开始时段',QJJSSJ AS '请假截止日期',QJJSSD AS '截止时段',QJTS AS '请假天数',(CASE WHEN QJLX NOT IN('年假','事假','病假') THEN 0 ELSE KeYongTS-ShiYongTS END)AS '假期剩余天数' FROM(SELECT SQBMMC,BM_BM,SQRID,SQRMC,QJLX,QJKSSJ,QJKSSD,QJJSSJ,QJJSSD,QJTS,(CASE WHEN qjlx='年假' THEN ISNULL(NJTS,0) WHEN qjlx='事假' THEN ISNULL(SHJTS,0) WHEN qjlx='病假' THEN ISNULL(BJTS,0) ELSE 0 END)AS KeYongTS,ShiYongTS FROM(SELECT A.SQBMMC,B.BM_BM,A.SQRID,A.SQRMC,QJLX,A.QJKSSJ,A.QJKSSD,A.QJJSSJ,A.QJJSSD,QJTS,(SELECT (CASE WHEN nian>=1 AND nian<10 THEN 5 WHEN nian>=10 AND nian<20 THEN 10 WHEN nian>=20 THEN 15 ELSE 0 END)AS njts FROM (SELECT ISNULL(DATEDIFF(YEAR,CONVERT(VARCHAR(4),ui_rzrq,112)+'.1.1',DATEADD(DAY,-DATEDIFF(DAY,CONVERT(VARCHAR(4),ui_rzrq,112)+'.1.1',ui_rzrq),convert(char(10),getdate(),111))),0)AS nian FROM yh WHERE ui_id=A.SQRID)Z)AS NJTS,(SELECT TOP 1 SHJTS FROM OA_KQ_JQFZ WHERE JQNF='" + strYear + "' AND CHARINDEX(A.SQRID,UserIDs)>0)AS SHJTS,(SELECT TOP 1 BJTS FROM OA_KQ_JQFZ WHERE JQNF='" + strYear + "' AND CHARINDEX(A.SQRID,UserIDs)>0)AS BJTS,(SELECT ISNULL(SUM(QJTS),0)AS QJTS FROM OA_KQ_QJD01 WHERE SQRID=A.SQRID AND QJLX=A.QJLX AND QJZT='已确认' AND DATEADD(yy, DATEDIFF(yy,0,QJKSSJ), 0)='" + strYear + "')ShiYongTS FROM OA_KQ_QJD01 A LEFT OUTER JOIN BM B ON(A.SQBMID=B.BM_ID) " + sql + ")T1)T2 ORDER BY BM_BM,SQRID");

            string fileName = "Qjcjqk.xls";
            ExcelHelper.ExportDataSetToExcel(ds, fileName, "请假超假情况");
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
