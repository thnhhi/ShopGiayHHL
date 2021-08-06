using ShopGiayHHL.Library;
using ShopGiayHHL.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShopGiayHHL.DAO;

namespace ShopGiayHHL.Areas.Admin.Controllers
{
    public class ProductController : BaseController
    {
        private ProductDAO productDAO = new ProductDAO();
        private MyDBContext db = new MyDBContext();
        private CategoryDAO categoryDAO = new CategoryDAO();
        // GET: Admin/Product
        public ActionResult Index()
        {
            return View(productDAO.getList("Index"));
        }
        public ActionResult Trash()
        {
            return View(productDAO.getList("Trash"));
        }

        // GET: Admin/Product/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Products product = productDAO.getRow(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Admin/Product/Create
        public ActionResult Create()
        {
            ViewBag.ListCat = new SelectList(categoryDAO.getList("Index"), "Id", "Name", 0);
            //ViewBag.ListCat = categoryDAO.getList();
            //ViewBag.ListProCat = new SelectList(db.Categorys.Where(m => m.Status != 0), "id", "name", 0);
            return View();
        }

        // POST: Admin/Product/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create( Products product)
        {
            if (ModelState.IsValid)
            {
                product.Updated_At = DateTime.Now;
                product.Updated_By = 1;
                product.Slug = XString.str_slug(product.Name);

                //product.Created_At = DateTime.Now;
                //product.Updated_At = DateTime.Now;
                
                productDAO.Insert(product);
                return RedirectToAction("Index");
            }
            ViewBag.ListCat = new SelectList(categoryDAO.getList("Index"), "Id", "Name", 0);
            //ViewBag.ListCat = categoryDAO.getList();
            return View(product);
        }

        // GET: Admin/Product/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Products product = productDAO.getRow(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.ListCat = new SelectList(categoryDAO.getList("Index"), "Id", "Name", 0);
            //ViewBag.ListCat = categoryDAO.getList();
            return View(product);
        }

        // POST: Admin/Product/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Products product)
        {
            if (ModelState.IsValid)
            {
                //product.Slug = XString.str_slug(product.Name);
                //product.Updated_At = DateTime.Now;
                //product.Updated_By = 1;
                productDAO.Update(product);
                return RedirectToAction("Index","Product");
            }
            ViewBag.ListCat = new SelectList(categoryDAO.getList("Index"), "Id", "Name", 0);
            //ViewBag.ListCat = categoryDAO.getList();
            return View(product);
        }

        // GET: Admin/Product/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                TempData["XMessage"] = new MyMessage("Không có Id", "danger");
                return RedirectToAction("Index"); // chuyển hướng trang
            }
            Products product = productDAO.getRow(id);
            if (product == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index"); // chuyển hướng trang
            }
            productDAO.Delete(product);
            TempData["XMessage"] = new MyMessage("Xóa thành công", "success");
            return RedirectToAction("Trash"); // chuyển hướng trang về thùng rác
        }

        // POST: Admin/Product/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Products product = productDAO.getRow(id);
            productDAO.Delete(product);
            return RedirectToAction("Index");
        }

   
        public ActionResult Status(int? id)
        {
            if (id == null)
            {
                TempData["XMessage"] = new MyMessage("Không có Id", "danger");
                return RedirectToAction("Index"); // chuyển hướng trang
            }
            Products product = productDAO.getRow(id);
            if (product == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index"); // chuyển hướng trang
            }
            product.Status = (product.Status == 1) ? 2 : 1;
            product.Updated_At = DateTime.Now;
            //product.Updated_By = int.Parse(Session["UserId"].Equals("") ? "1" : Session["UserId"].ToString());
            productDAO.Update(product);
            TempData["XMessage"] = new MyMessage("Thay đổi trạng thái thành công", "success");
            return RedirectToAction("Index"); // chuyển hướng trang
        }
        // Xóa vào thùng rác
        public ActionResult DelTrash(int? id)
        {
            if (id == null)
            {
                TempData["XMessage"] = new MyMessage("Không có Id", "danger");
                return RedirectToAction("Index"); // chuyển hướng trang
            }
            Products product = productDAO.getRow(id);
            if (product == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index"); // chuyển hướng trang
            }
            product.Status = 0;
            product.Updated_At = DateTime.Now;
            //product.Updated_By = int.Parse(Session["UserId"].Equals("") ? "1" : Session["UserId"].ToString());
            productDAO.Update(product);
            TempData["XMessage"] = new MyMessage("Xóa thành công", "success");
            return RedirectToAction("Index"); // chuyển hướng trang
        }
        // Khôi phục mẫu tin
        public ActionResult ReTrash(int? id)
        {
            if (id == null)
            {
                TempData["XMessage"] = new MyMessage("Không có Id", "danger");
                return RedirectToAction("Index"); // chuyển hướng trang
            }
            Products product = productDAO.getRow(id);
            if (product == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index"); // chuyển hướng trang
            }
            product.Status = 1;
            product.Updated_At = DateTime.Now;
            //product.Updated_By = int.Parse(Session["UserId"].Equals("") ? "1" : Session["UserId"].ToString());
            productDAO.Update(product);
            TempData["XMessage"] = new MyMessage("Khôi phục thành công", "success");
            return RedirectToAction("Index"); // chuyển hướng trang
        }
    }
}