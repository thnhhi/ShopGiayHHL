using ShopGiayHHL.DAO;
using ShopGiayHHL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace ShopGiayHHL.Controllers
{
    public class SiteController : Controller
    {
        CategoryDAO categoryDAO = new CategoryDAO();
        ProductDAO productDAO = new ProductDAO();
        PostDAO postDAO = new PostDAO();

        // GET: Site
        public ActionResult Index(String slug = null)
        {
            LinkDAO linkDAO = new LinkDAO();

            if (slug == "")
            {
                return this.Home();
            }
            else
            {
                Links row_link = linkDAO.getRow(slug);
                if (row_link != null)
                {
                    String type = row_link.TypeLink;
                    switch (type)
                    {
                        case "category": { return this.ProductCategory(slug); }
                        case "topic": { return this.PostTopic(slug); }
                        case "page": { return this.PostPage(slug); }
                    }
                }
                else
                {
                    Products product_row = productDAO.getRow(slug);
                    if (product_row != null)
                    {
                        return this.ProductDetail(slug);
                    }
                    else
                    {
                        Posts post_row = postDAO.getRow(slug);
                        if (post_row != null)
                        {
                            return this.PostDetail(slug);
                        }
                        else
                        {
                            return this.Error404(slug);
                        }
                    }
                }
            }
            return this.Error404(slug);
        }
        public ActionResult Home()
        {
            var listcat = categoryDAO.getList(0);
            return View("Home", listcat);
        }
        public ActionResult HomeCon()
        {
            var listcat = categoryDAO.getListCon(1);
            return View("HomeCon", listcat);
        }
        public ActionResult Product(int ? page)
        {
            int pageSize = 12;
            int pageNumber = page ?? 1;
            var list = productDAO.getListSP(pageSize, pageNumber);
            return View("Product", list);
        }

        public ActionResult HomeProduct(int catid)
        {
            List<Categorys> listcat = categoryDAO.getList(catid);
            List<int> listcatid = new List<int>();
            foreach (Categorys rowcat in listcat)
            {
                listcatid.Add(rowcat.Id);
            }
            listcatid.Add(catid);
            List<Products> list = productDAO.getList(listcatid, 5);
            return View("HomeProduct", list);
        }
        public ActionResult HomeProductCon(int? page)
        {
            int pageSize = 10;
            int pageNumber = page ?? 1;

            var listcat = productDAO.getListCon(1, pageSize, pageNumber);
           
            return View("HomeProductCon", listcat);
        }
        public ActionResult HomeProductVa(int? page)
        {
            int pageSize = 10;
            int pageNumber = page ?? 1;
            var listcat = productDAO.getListVa(2, pageSize, pageNumber);

            return View("HomeProductVa", listcat);
        }
        public ActionResult HomeProductPa(int? page)
        {
            int pageSize = 10;
            int pageNumber = page ?? 1;
            var listcat = productDAO.getListPa(3, pageSize, pageNumber);

            return View("HomeProductPa", listcat);
        }
        public ActionResult HomeProductSu(int? page)
        {
            int pageSize = 10;
            int pageNumber = page ?? 1;
            var listcat = productDAO.getListSu(4, pageSize, pageNumber);

            return View("HomeProductSu", listcat);
        }
        public ActionResult ProductCategory(String slug)
        {
            int limit = 1000;
            int skip = 1;
            var row_cat = categoryDAO.getRow(slug);
            int catid = row_cat.Id;
            List<int> listcatid = categoryDAO.getListId(catid);     
            var list = productDAO.getList(listcatid, limit, skip);
           
            return View("ProductCategory",list);
        }
        public ActionResult ProductDetail(String slug)
        {
            return View("ProductDetail");
        }
        public ActionResult PostDetail(String slug)
        {
            int limit = 10;
            
            var row = postDAO.getRow(slug);
            int? topid = row.TopicId;
            var listother = postDAO.getList(topid,limit,row.Id);
            return View("PostDetail",row);
        }
        public ActionResult PostTopic(String slug)
        {
            
            var list = postDAO.getList(2);
            return View("PostTopic", list);
        }
        public ActionResult PostPage(String slug)
        {
            var row = postDAO.getRow(slug);
            return View("PostPage", row);
        }
        public ActionResult Error404(String slug)
        {
            return View("Error404");
        }
    }
}