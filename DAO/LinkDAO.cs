using ShopGiayHHL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopGiayHHL.DAO
{
    public class LinkDAO
    {
        MyDBContext db = null;
        public LinkDAO()
        {
            db = new MyDBContext();
        }

        
        //Tra về danh sách List Object
        public List<Links> getList()
        {
            var list = db.Links.ToList();
            return list;

        }
        
        //Trả về số lượng
        public long getCount()
        {
            var count = db.Links.Count();
            return count;
        }
        // Trả về 1 mẫu tin
        public Links getRow(string slug)
        {
            Links row = db
                .Links.Where(m => m.Slug == slug)
                .FirstOrDefault();
            return row;
        }
       
        public Links getRow(int? id)
        {
            Links row = db
                .Links.Find(id);
            return row;
        }
        //Thêm
        public int Insert(Links row)
        {
            db.Links.Add(row);
            db.SaveChanges();
            return row.Id;

        }
        //Sửa
        public int Update(Links row)
        {
            db.Entry(row).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return row.Id;

        }
        //Xoá
        public int Delete(Links row)
        {
            db.Links.Remove(row);
            db.SaveChanges();
            return row.Id;

        }
    
    }
}