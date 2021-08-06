using ShopGiayHHL.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopGiayHHL.Controllers
{
    public class ModuleController : Controller
    {
        MenuDAO menuDAO = new MenuDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        // GET: Module
        public ActionResult MainMenu()
        {

            var list = menuDAO.getList(0, "mainmenu");

            return View("MainMenu",list);
        }
        public ActionResult SlideShow()
        {
            SliderDAO sliderDAO = new SliderDAO();
            var list = sliderDAO.getList("slideshow");
            return View("SlideShow", list);
        }
        public ActionResult ListCategory()
        {

            var list = categoryDAO.getList(0);

            return View("ListCategory", list);
        }
    }
}