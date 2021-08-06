using ShopGiayHHL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopGiayHHL.Areas.Admin.Controllers
{
    public class DashboardController : BaseController
    {
        private MyDBContext db = new MyDBContext();
        // GET: Admin/Dashboard
        public ActionResult Index()
        {

            return View(db.Products.ToList());
        }
    }
}