using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KoffiedikKijker.Web
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }


        protected void OnSubmit(object sender, EventArgs e)
        {
            if (takePictureField.HasFile)
            {
                string fileName = Path.GetFileName(takePictureField.PostedFile.FileName);
                takePictureField.PostedFile.SaveAs(Server.MapPath("~/upload/") + fileName);
            }
            var param = Request["__EVENTARGUMENT"];

            Thread.Sleep(6000);
            Response.Redirect("/Result.aspx?image=" + param);
        }
    }
}