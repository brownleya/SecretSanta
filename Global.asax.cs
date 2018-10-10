using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Xml.Linq;
using System.Web.Routing;
using System.Web.Http;
using System.Web.Mvc;

namespace thescruffster
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
           AreaRegistration.RegisterAllAreas();

  //         RouteTable.Routes.MapHttpRoute(
  //"defaultPost",
  //"secretsanta/default",
  //new { Controller = "default" },
  //new { httpMethod = new HttpMethodConstraint("Post") }

//);
          
        
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            // Fires when an error occurs
            Response.Redirect("error.aspx");

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}