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
            //检查服务器上是否存在这个物理路径，如果不存在则创建
            if (!System.IO.Directory.Exists(path))
            {
                //需要注意的是，需要对这个物理路径有足够的权限，否则会报错
                //另外，这个路径应该是在网站之下，而将网站部署在C盘却把文件保存在D盘
                System.IO.Directory.CreateDirectory(path);
            }

            var file = context.Request.Files[0];

            string msg = "";
            int FileLength = file.ContentLength;
            if (FileLength > 3000000)
            {
                msg = "上传失败，图片太大超过3M";
                context.Response.Write(msg);
                return;
            }
            string ext = file.FileName.Substring(file.FileName.LastIndexOf('.'));
            if (!(ext == ".jpeg" || ext == ".jpg" || ext == ".png"))
            {
                msg = "上传失败请上传.jpg或.jpeg或.png格式的图片";
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
                msg += string.Format("error:'{0}',\n", "请选择文件！");
                msg += string.Format("msg:'{0}'\n", string.Empty);
                msg += "}";
            }
            else
            {
                Random rad = new Random();//实例化随机数产生器rad；
                int value = rad.Next(1000, 10000);//用rad生成大于等于1000，小于等于9999的随机数；
                fileName = DateTime.Now.ToString("yyyyMMddHHmmss") + value.ToString() + ext;
                string filePath = "/photo/" + fileName;
                fileName = System.IO.Path.Combine(path, fileName);
                file.SaveAs(fileName);

                msg = "{";
                msg += string.Format("success:'{0}',\n", string.Empty);
                msg += string.Format("msg:'{0}'\n", "上传成功");
                msg += "}";

                    
                responseText =  "{\"success\":'上传成功',\"message\":'"+filePath + "'}";
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