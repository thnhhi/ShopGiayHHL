using ShopGiayHHL.DAO;
using ShopGiayHHL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShopGiayHHL.Library;

namespace ShopGiayHHL.Areas.Admin.Controllers
{
    public class CategoryController : BaseController
    {
        private CategoryDAO categoryDAO = new CategoryDAO();

        // GET: Admin/Category
        public ActionResult Index()
        {
            return View(categoryDAO.getList("Index"));
        }
        public ActionResult Trash()
        {
            return View(categoryDAO.getList("Trash"));
        }
        // GET: Admin/Category/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Categorys category = categoryDAO.getRow(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // GET: Admin/Category/Create
        public ActionResult Create()
        {
            ViewBag.ListCat = new SelectList(categoryDAO.getList("Index"), "Id", "Name", 0);
            ViewBag.ListOrder = new SelectList(categoryDAO.getList("Index"), "Orders", "Name", 0);
            return View();
        }

        // POST: Admin/Category/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create( Categorys category)
        {
            if (ModelState.IsValid)
            {
                category.Slug = XString.str_slug(category.Name);
                category.Created_At = DateTime.Now;
                
                category.Updated_At = DateTime.Now;
                
                categoryDAO.Insert(category);

                return RedirectToAction("Index");
            }
            ViewBag.ListCat = new SelectList(categoryDAO.getList("Index"), "Id", "Name", 0);
            ViewBag.ListOrder = new SelectList(categoryDAO.getList("Index"), "Orders", "Name", 0);
            return View(category);
        }

        // GET: Admin/Category/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Categorys category = categoryDAO.getRow(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            ViewBag.ListCat = new SelectList(categoryDAO.getList("Index"), "Id", "Name", 0);
            ViewBag.ListOrder = new SelectList(categoryDAO.getList("Index"), "Orders", "Name", 0);
            return View(category);
        }

        // POST: Admin/Category/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Categorys category)
        {
            if (ModelState.IsValid)
            {
                category.Slug = XString.str_slug(category.Name);
                
                category.Updated_At = DateTime.Now;               
                categoryDAO.Update(category);

                return RedirectToAction("Index");
            }
            ViewBag.ListCat = new SelectList(categoryDAO.getList("Index"), "Id", "Name", 0);
            ViewBag.ListOrder = new SelectList(categoryDAO.getList("Index"), "Orders", "Name", 0);
            return View(category);
        }

        // GET: Admin/Category/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                TempData["XMessage"] = new MyMessage("Không có Id", "danger");
                return RedirectToAction("Index"); // chuyển hướng trang
            }
            Categorys category = categoryDAO.getRow(id);
            if (category == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index"); // chuyển hướng trang
            }
            categoryDAO.Delete(category);
            TempData["XMessage"] = new MyMessage("Xóa thành công", "success");
            return RedirectToAction("Trash"); // chuyển hướng trang về thùng rác
            
        }

        // POST: Admin/Category/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Categorys category = categoryDAO.getRow(id);
            categoryDAO.Delete(category);
            return RedirectToAction("Index");
        }
        //Trạng thái
        public ActionResult Status(int? id)
        {
            if(id == null)
            {
                TempData["XMessage"] = new MyMessage("Không có Id", "danger");
                return RedirectToAction("Index"); // chuyển hướng trang
            }    
            Categorys category = categoryDAO.getRow(id);
            if(category == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index"); // chuyển hướng trang
            }    
            category.Status = (category.Status == 1) ? 2 : 1;
            category.Updated_At = DateTime.Now;
            //category.Updated_By = int.Parse(Session["UserId"].Equals("") ? "1" : Session["UserId"].ToString());
            categoryDAO.Update(category);
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
            Categorys category = categoryDAO.getRow(id);
            if (category == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index"); // chuyển hướng trang
            }
            category.Status = 0;
            category.Updated_At = DateTime.Now;
            //category.Updated_By = int.Parse(Session["UserId"].Equals("") ? "1" : Session["UserId"].ToString());
            categoryDAO.Update(category);
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
            Categorys category = categoryDAO.getRow(id);
            if (category == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index"); // chuyển hướng trang
            }
            category.Status = 1;
            category.Updated_At = DateTime.Now;
            //category.Updated_By = int.Parse(Session["UserId"].Equals("") ? "1" : Session["UserId"].ToString());
            categoryDAO.Update(category);
            TempData["XMessage"] = new MyMessage("Khôi phục thành công", "success");
            return RedirectToAction("Index"); // chuyển hướng trang
        }
    }
}