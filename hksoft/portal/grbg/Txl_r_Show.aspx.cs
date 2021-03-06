﻿using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using haoke365;

namespace hkpro.portal.grbg
{
    public partial class Txl_r_Show : System.Web.UI.Page
    {
        mydb hkdb = new mydb();
        BindData bd = new BindData();

        protected void Page_Load(object sender, EventArgs e)
        {
            hkdb.VeriSess("4");

            if (!IsPostBack)
            {
                SqlDataReader dr = SqlHelper.ExecuteReader("select * from hk_Ygtxl where id='" + hkdb.GetStr(Request.QueryString["id"]) + "'");
                if (dr.Read())
                {
                    Folder.Text = dr["FoldersName"].ToString();
                    PxNum.Text = dr["PxNum"].ToString();
                    FoldersID.Text = dr["FoldersID"].ToString();
                    Name.Text = dr["Name"].ToString();
                    Worknum.Text = dr["Worknum"].ToString();
                    Unit.Text = dr["Unit"].ToString();
                    Respon.Text = dr["Respon"].ToString();
                    Post.Text = dr["Post"].ToString();
                    Sex.Text = dr["Sex"].ToString();
                    Officetel.Text = dr["Officetel"].ToString();
                    Fax.Text = dr["Fax"].ToString();
                    MoveTel.Text = dr["MoveTel"].ToString();
                    HomeTel.Text = dr["HomeTel"].ToString();
                    Email.Text = dr["Email"].ToString();
                    QQNum.Text = dr["QQNum"].ToString();
                    MsnNum.Text = dr["MsnNum"].ToString();
                    NbNum.Text = dr["NbNum"].ToString();
                    Address.Text = dr["Address"].ToString();
                    ZipCode.Text = dr["ZipCode"].ToString();
                    Remark.Text = hkdb.TbToLb(dr["Remark"].ToString());
                    BothDay.Text = dr["BothDay"].ToString();
                }
                dr.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("txl_r.aspx?typeId=" + FoldersID.Text + "");
        }
    }
}