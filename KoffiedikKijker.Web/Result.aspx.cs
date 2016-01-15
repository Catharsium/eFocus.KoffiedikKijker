using System;
using System.Net;
using System.Threading.Tasks;
using System.Web.UI;
using Microsoft.ProjectOxford.Vision;

namespace KoffiedikKijker.Web
{
    public partial class Result : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            image.ImageUrl = Request["image"];
            RegisterAsyncTask(new PageAsyncTask(RunTest));
        }

        
        private async Task RunTest()
        {
            var client = new VisionServiceClient("bae2f176b113415f81bdca26eccab2e9");

            var fileReq = (HttpWebRequest)WebRequest.Create(Request.QueryString["image"]);
            var fileResp = (HttpWebResponse)fileReq.GetResponse();
            var stream = fileResp.GetResponseStream();
            var result = await client.AnalyzeImageAsync(stream);
            foreach (var face in result.Faces)
            {
                var age = face.Age;
                var gender = face.Gender;
                output.Text = string.Format("Leeftijd {0}, geslacht {1}", age, gender);
            }
        }
    }
}