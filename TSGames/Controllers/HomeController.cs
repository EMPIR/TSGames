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
        public ActionResult Index()
        {
            ViewData["Message"] = "Hey!  We are making a Set Game and if you don't like it get the f' out!~";
            SetGame.Game g = new Game();
            return View(g);
        }

        public ActionResult About()
        {
            return View();
        }

        public void OnClick1()
        {
            int debug = 0;
           
        }
    }
}
