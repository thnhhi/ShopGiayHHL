using ShopGiayHHL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;

namespace ShopGiayHHL.DAO
{
    public class ProductDAO
    {
        MyDBContext db = null;
        public ProductDAO()
        {
            db = new MyDBContext();
        }
        //Tra về danh sách List Object
        public List<Products> getList(string page = "Index")
        {
            if (page == "Index")
            {
                var list = db.Products
                .Where(m => m.Status != 0)
                .OrderBy(m => m.Created_At)
                .ToList();
                return list;
            }
            else
            {
                var list = db.Products
                .Where(m => m.Status == 0)
                .OrderBy(m => m.Created_At)
                .ToList();
                return list;
            }



        }

        public List<Products> getList()
        {
            var list = db.Products
                .Where(m => m.Status == 1)
                .OrderByDescending(m => m.Created_At)
                .ToList();
            return list;
        }
        public PagedList.IPagedList<Products> getListSP(int pageSize,int pageNumber)
        {
            var list = db.Products
                .Where(m => m.Status == 1)
                .OrderByDescending(m => m.Created_At)
                .ToPagedList(pageNumber,pageSize);
            return list;
        }
        public List<Products> getList(List<int> listcatid, int limit)
        {
            List<Products> list = db.Products
                .Where(m => m.Status == 1 && listcatid.Contains(m.CatId))
                .OrderByDescending(m => m.Created_At)
                .Take(limit)
                .ToList();
            return list;
        }
        public List<Products> getList(List<int> listcatid, int limit,int skip)
        {
            List<Products> list = db.Products
                .Where(m => m.Status == 1 && listcatid.Contains(m.CatId))
                .OrderByDescending(m => m.Created_At)
                .Take(limit)
                .Skip(skip)
                .ToList();
            return list;
        }

        public List<Products> getList(int catid)
        {
            List<Products> list = db.Products
                .Where(m => m.CatId == catid && m.Status == 1)
                .OrderByDescending(m => m.Created_At)
                .ToList();
            return list;
        }
        public PagedList.IPagedList<Products> getListCon(int? catid , int pageSize, int pageNumber)
        {
            var list = db.Products
                .Where(m => m.CatId == 1 && m.Status == 1)
                .OrderByDescending(m => m.Created_At)
                .ToPagedList(pageNumber, pageSize);
            return list;
        }
        public PagedList.IPagedList<Products> getListVa(int? catid, int pageSize, int pageNumber)
        {
            var list = db.Products
                .Where(m => m.CatId == 2 && m.Status == 1)
                .OrderByDescending(m => m.Created_At)
                .ToPagedList(pageNumber, pageSize);
            return list;
        }
        public List<Products> getListVa(int? catid = 2)
        {
            List<Products> list = db.Products
                .Where(m => m.CatId == catid && m.Status == 1)
                .OrderByDescending(m => m.Created_At)
                .ToList();
            return list;
        }
        public PagedList.IPagedList<Products> getListPa(int? catid, int pageSize, int pageNumber)
        {
            var list = db.Products
                .Where(m => m.CatId == 3 && m.Status == 1)
                .OrderByDescending(m => m.Created_At)
                .ToPagedList(pageNumber, pageSize);
            return list;
        }
        public List<Products> getListPa(int? catid = 3)
        {
            List<Products> list = db.Products
                .Where(m => m.CatId == catid && m.Status == 1)
                .OrderByDescending(m => m.Created_At)
                .ToList();
            return list;
        }
        public PagedList.IPagedList<Products> getListSu(int? catid, int pageSize, int pageNumber)
        {
            var list = db.Products
                .Where(m => m.CatId == 4 && m.Status == 1)
                .OrderByDescending(m => m.Created_At)
                .ToPagedList(pageNumber, pageSize);
            return list;
        }
        public List<Products> getListSu(int? catid = 4)
        {
            List<Products> list = db.Products
                .Where(m => m.CatId == catid && m.Status == 1)
                .OrderByDescending(m => m.Created_At)
                .ToList();
            return list;
        }
        public Products getRow(String slug)
        {
            Products row = db.Products
                .Where(m => m.Slug == slug && m.Status == 1)
                .FirstOrDefault();
            return row;
        }

        public Products getRow(int? id)
        {
            Products row = db
                .Products.Find(id);
            return row;
        }
        //Thêm
        public int Insert(Products row)
        {
            db.Products.Add(row);
            db.SaveChanges();
            return row.Id;

        }
        //Sửa
        public int Update(Products row)
        {
            db.Entry(row).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return row.Id;

        }
        //Xoá
        public int Delete(Products row)
        {
            db.Products.Remove(row);
            db.SaveChanges();
            return row.Id;

        }
    }
}