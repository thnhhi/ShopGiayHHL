using ShopGiayHHL.DAO;
using ShopGiayHHL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopGiayHHL.Controllers
{
    public class KhachHangController : Controller
    {
        UserDAO userDAO = new UserDAO();
        private MyDBContext _db = new MyDBContext();
        // GET: KhachHang
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection thamso)
        {
            String tendn = thamso["username"];
            String matkhau = thamso["password"];
            Users row_user = userDAO.getRow(tendn);
            String error = "";
            if (row_user != null)
            {
                if (row_user.Password == matkhau)
                {
                    Session["UserAdmin"] = tendn;
                    Session["UserId"] = row_user.Id;
                    Session["UserFullName"] = row_user.FullName;
                    Session["UserImg"] = row_user.Img;
                    Response.Redirect("~/Admin");
                }
                else
                {
                    error = "Mất khẩu không chính xác!";

                }
            }
            else
            {
                error = "Tên đăng nhập không tồn tại !";
            }
            ViewBag.Error = "<p class='text-danger'>" + error + "</p>";
            return View();
        }
        public ActionResult Logout()
        {
            Session["UserAdmin"] = "";
            Session["UserId"] = "";
            Session["UserFullName"] = "";
            Session["UserImg"] = "";


            Response.Redirect("~/Admin");
            return null;

        }
        public ActionResult Register()
        {
            return View();
        }
        public ActionResult Forgotten()
        {
            return View();
        }
        public ActionResult Create()
        {
            
            return View();
        }
        [HttpPost]
        public ActionResult Create(Orders orders)
        {
            _db.Orders.Add(orders);
            _db.SaveChanges();
            return RedirectToAction("ShowToCart", "GioHang");
        }
      
        
    }
}