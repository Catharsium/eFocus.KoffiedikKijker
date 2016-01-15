using System;
using System.Web.UI;
using Microsoft.ProjectOxford.Vision;

namespace KoffiedikKijker.Web
{
    public partial class test : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            iets();
        }


        private void iets()
        {
            RunTest();
        }

        private async void RunTest()
        {
            var client = new VisionServiceClient("bae2f176b113415f81bdca26eccab2e9");
            var result = await client.AnalyzeImageAsync("http://dailycoffeenews.com/wp-content/uploads/2013/02/empty-coffee-mug-300x200.jpeg");
        }
    }
}