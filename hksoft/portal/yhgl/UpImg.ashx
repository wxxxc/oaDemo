<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;

using haoke365;
public class Handler : System.Web.UI.Page, IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {

        context.Response.ContentType = "text/html";

        if (context.Request.Files.Count > 0)
        {
            string path = context.Server.MapPath("/photo/");
            //�����������Ƿ�����������·��������������򴴽�
            if (!System.IO.Directory.Exists(path))
            {
                //��Ҫע����ǣ���Ҫ���������·�����㹻��Ȩ�ޣ�����ᱨ��
                //���⣬���·��Ӧ��������վ֮�£�������վ������C��ȴ���ļ�������D��
                System.IO.Directory.CreateDirectory(path);
            }

            var file = context.Request.Files[0];

            string msg = "";
            int FileLength = file.ContentLength;
            if (FileLength > 3000000)
            {
                msg = "�ϴ�ʧ�ܣ�ͼƬ̫�󳬹�3M";
                context.Response.Write(msg);
                return;
            }
            string ext = file.FileName.Substring(file.FileName.LastIndexOf('.'));
            if (!(ext == ".jpeg" || ext == ".jpg" || ext == ".png"))
            {
                msg = "�ϴ�ʧ�����ϴ�.jpg��.jpeg��.png��ʽ��ͼƬ";
                context.Response.Write(msg);
                return;
            }

            string fileName;

            if (HttpContext.Current.Request.Browser.Browser.ToUpper() == "IE")
            {
                string[] files = file.FileName.Split(new char[] { '\\' });
                fileName = files[files.Length - 1];
            }
            else
            {
                fileName = file.FileName;
            }

            
            string strFileName = fileName;
            string responseText = "";
            if (string.IsNullOrEmpty(strFileName))
            {
                msg = "{";
                msg += string.Format("error:'{0}',\n", "��ѡ���ļ���");
                msg += string.Format("msg:'{0}'\n", string.Empty);
                msg += "}";
            }
            else
            {
                Random rad = new Random();//ʵ���������������rad��
                int value = rad.Next(1000, 10000);//��rad���ɴ��ڵ���1000��С�ڵ���9999���������
                fileName = DateTime.Now.ToString("yyyyMMddHHmmss") + value.ToString() + ext;
                string filePath = "/photo/" + fileName;
                fileName = System.IO.Path.Combine(path, fileName);
                file.SaveAs(fileName);

                msg = "{";
                msg += string.Format("success:'{0}',\n", string.Empty);
                msg += string.Format("msg:'{0}'\n", "�ϴ��ɹ�");
                msg += "}";

                    
                responseText =  "{\"success\":'�ϴ��ɹ�',\"message\":'"+filePath + "'}";
            }
            context.Response.Write(responseText);


        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}