using ShopGiayHHL.DAO;
using ShopGiayHHL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopGiayHHL.Controllers
{
    public class LienHeController : Controller
    {
        ContactDAO contactDAO = new ContactDAO();
        // GET: LienHe
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(Contacts contact)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    if (contact.Phone.Length != 10)
                        throw new Exception("Số điện thoại không đúng !");
                    contact.DateContact = DateTime.Now;
                    contactDAO.Insert(contact);
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("ErrorPhone", ex.Message);

                }

            }
            return View();
        }
    }
}