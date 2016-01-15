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
            image.ImageUrl = "/upload/" + Request["image"];
            RegisterAsyncTask(new PageAsyncTask(RunTest));
        }

        
        private async Task RunTest()
        {
            try
            {
                var client = new VisionServiceClient("bae2f176b113415f81bdca26eccab2e9");

                var url = "http://koffiedikkijker.azurewebsites.net" + image.ImageUrl;
                var fileReq = (HttpWebRequest)WebRequest.Create(url);
                var fileResp = (HttpWebResponse) fileReq.GetResponse();
                var stream = fileResp.GetResponseStream();
                var result = await client.AnalyzeImageAsync(stream);
                foreach (var face in result.Faces)
                {
                    var age = face.Age;
                    var gender = face.Gender == "Male" ? "man" : "vrouw";
                    output.Text = string.Format("<p>Helaas, deze {0} jarige {1} kan (nog) niet worden gekwalificeerd als een leeg kopje koffie.</p>", age, gender);
                    output.Visible = true;
                    containerContent.Visible = false;
                }
            }
            catch (Exception ex)
            {
                
            }
        }
    }
}