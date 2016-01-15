using System;
using System.IO;
using System.Threading;

namespace KoffiedikKijker.Web
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }


        protected void OnSubmit(object sender, EventArgs e)
        {
            var fileName = string.Empty;
            if (takePictureField.HasFile)
            {
                fileName = Guid.NewGuid() + Path.GetFileName(takePictureField.PostedFile.FileName);
                takePictureField.PostedFile.SaveAs(Server.MapPath("~/upload/") + fileName);
            }

            Thread.Sleep(4000);
            Response.Redirect("/Result.aspx?image=" + fileName);
        }
    }
}