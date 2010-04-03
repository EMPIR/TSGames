using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace TSGames
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Default",                                              // Route name
                "{controller}/{action}/{id}",                           // URL with parameters
                new { controller = "Home", action = "Index", id = "" }  // Parameter defaults
            );

            routes.MapRoute(
                "postcode",
                "Home/NodeClicked/{a}/{b}/{c}",
                new { controller = "Home", action = "NodeClicked", a = 0, b = 0,c=0 });


        }

        protected void Application_Start()
        {
            RegisterRoutes(RouteTable.Routes);
           
        }

        protected void Session_Start(Object sender, EventArgs e)

        {
           
        }


    }
}