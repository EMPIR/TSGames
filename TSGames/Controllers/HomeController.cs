using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SetGame;

namespace TSGames.Controllers
{

    [HandleError]
    public class HomeController : Controller
    {


        SetGame.Game theGame;
        public ActionResult Index()
        {
            this.ControllerContext.HttpContext.Session.Add("__MySessionGame", new SetGame.Game());
            theGame = (SetGame.Game) this.ControllerContext.HttpContext.Session["__MySessionGame"];
            return View(theGame);
        }

        public ActionResult About()
        {
            return View();
        }

        public void TestJavaScript()
        {
            string s = "$('#divResultText').html('JavaScript Passed');";
           
        }

        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")]
        public JsonResult NodeClicked(int a, int b, int c)
        {
            //string id = ReadFromRequest("id");
            theGame = (SetGame.Game) this.ControllerContext.HttpContext.Session["__MySessionGame"];
            
            
            //string json = JavaScriptConvert.SerializeObject(node);
            return this.Json(this.theGame.Move(a,b,c));
            
        }






    }
}
