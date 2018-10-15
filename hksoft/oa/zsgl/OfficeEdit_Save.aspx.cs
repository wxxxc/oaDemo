using System;
using System.IO;

namespace hkpro.oa.zsgl
{
    public partial class OfficeEdit_Save : System.Web.UI.Page
    {
        readonly int itCount = 12;
        string[] rqValues = new string[2];
        protected void Page_Load(object sender, EventArgs e)
        {
            string strFile = Server.MapPath("..\\..") + "\\Attach\\oa\\knowledge\\" + Request.QueryString["file"] + "";
            FileStream fsDoc = new FileStream(strFile, FileMode.Create, FileAccess.Write);
            BinaryReader br = new BinaryReader(Request.InputStream);
            BinaryWriter bw = new BinaryWriter(fsDoc);
            br.BaseStream.Seek(0, SeekOrigin.Begin);
            bw.BaseStream.Seek(0, SeekOrigin.End);
            int itNo = 0;
            int stmLen = 0;

            while (br.BaseStream.Position < br.BaseStream.Length)
            {
                stmLen++;
                char c = (char)br.ReadByte();
                if (itNo < itCount)
                {
                    if (c == '\n')
                    {
                        itNo++;
                    }
                }
                else
                {
                    break;
                }
            }

            br.BaseStream.Seek(0, SeekOrigin.Begin);
            string strTemp = System.Text.UTF8Encoding.Default.GetString(br.ReadBytes(stmLen - 1));
            while (br.BaseStream.Position < br.BaseStream.Length - 38)
            {
                bw.Write(br.ReadByte());
            }
            br.Close();
            bw.Flush();
            bw.Close();

            string[] rqStrs = { "RecordID", "UserID" };
            for (int i = 0; i < rqStrs.Length; i++)
            {
                string str = "Content-Disposition: form-data; name=\"" + rqStrs[i] + "\"\r\n\r\n";
                int index = strTemp.IndexOf(str) + str.Length;
                if (index != str.Length - 1)
                {
                    for (int j = index; j < strTemp.Length; j++)
                    {
                        if (strTemp[j] != '\r')
                            this.rqValues[i] += strTemp[j];
                        else
                            break;
                    }
                }
            }
        }
    }
}
