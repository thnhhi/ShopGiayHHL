using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopGiayHHL.DAO;
using ShopGiayHHL.Models;

namespace ShopGiayHHL.Controllers
{
    

    public class GioHangController : Controller
    {
        private ProductDAO productDAO = new ProductDAO();
        private MyDBContext _db = new MyDBContext();
        // GET: GioHang
        public ActionResult Index()
        {
            return View();
        }
        public Cart GetCart()
        {
            Cart cart = Session["Cart"] as Cart;
            if(cart == null || Session["Cart"] == null)
            {
                cart = new Cart();
                Session["Cart"] = cart;
            }
            return cart;

        }
        // Phuong thuc add item vao gio hang
        public ActionResult AddToCart(int id)
        {
            var pro = _db.Products.SingleOrDefault(s => s.Id == id);
            if(pro != null)
            {
                GetCart().Add(pro);
            }
            return RedirectToAction("ShowToCart", "GioHang");
        }
        //Trang gio hang
        public ActionResult ShowToCart()
        {
            if (Session["Cart"] == null)
                return RedirectToAction("ShowToCart", "GioHang");
            Cart cart = Session["Cart"] as Cart;
            return View(cart);
        }
        public ActionResult Update_Quantity_Cart(FormCollection form)
        {
            Cart cart = Session["Cart"] as Cart;
            int id_pro = int.Parse(form["Id"]);
            int quantity = int.Parse(form["Quantity"]);
            cart.Update_Quantity_Shopping(id_pro, quantity);
            return RedirectToAction("ShowToCart", "GioHang");
        }
        public ActionResult RemoveCart(int id)
        {
            Cart cart = Session["Cart"] as Cart;
            cart.Remove_CartItem(id);
            return RedirectToAction("ShowToCart", "GioHang");
        }
        public PartialViewResult BagCart()
        {
            int _t_item = 0;
            Cart cart = Session["Cart"] as Cart;
            if(cart != null)
            {
                _t_item = cart.Total_Quantity();
            }
            ViewBag.infoCart = _t_item;
            return PartialView("");
        }
        public ActionResult Shopping_Success()
        {
            return View();
        }
        //Thanh toán
        public ActionResult CheckOut(FormCollection form)
        {
            try 
            {
                Cart cart = Session["Cart"] as Cart;
                Orders _orders = new Orders();
                _orders.DateOrder = DateTime.Now;
                _orders.Code = int.Parse(form["CodeCustomer"]);
                _orders.DeliveryAddress = form["Address_Deliver"];
                _db.Orders.Add(_orders);
                foreach(var item in cart.Items)
                {
                    Orderdetails _order_details = new Orderdetails();
                    _order_details.OrderId = _orders.Id;
                    _order_details.ProductId = item._shopping_product.Id;
                    _order_details.PriceBuy = item._shopping_product.PriceBuy;
                    _order_details.Quantity = item._shopping_quantity;
                    _db.Orderdetails.Add(_order_details);
                }
                _db.SaveChanges();
                cart.ClearCart();
                return RedirectToAction("Shopping_Success", "GioHang");
            }
            catch
            {
                return Content("Lỗi thanh toán. Vui lòng kiểm tra lại thông tin...");
            }
        }
    }
}