using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace thescruffster.Areas.MVCArea.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /MVCArea/Home/

        public ActionResult Index()
        {

            return View();
        }

    }
}
