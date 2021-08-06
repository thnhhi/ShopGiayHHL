using ShopGiayHHL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace ShopGiayHHL.DAO
{
    public class MenuDAO
    {
        MyDBContext db = null;
        public MenuDAO()
        {
            db = new MyDBContext();
        }

        

        //Tra về danh sách List Object
        public List<Menus> getList(int? parentid=0,string position = "mainmenu")
        {
            var list = db.Menus
                .Where(m => m.Position == position && m.Status==1 && m.ParentId == parentid)
                .OrderBy(m => m.Orders)
                .ToList();
            return list;
        }
        public List<Menus> getList(int? parentid = 0)
        {
            List<Menus> list = db.Menus
                .Where(m => m.ParentId == parentid && m.Status == 1)
                .OrderBy(m => m.Orders)
                .ToList();
            return list;

        }
        public List<Menus> getList(String status)
        {
            List<Menus> list = null;
            switch (status)
            {
                case "All":
                    {
                        list = db.Menus.ToList();
                        break;

                    }
                case "Index":
                    {
                        list = db.Menus.Where(m => m.Status != 0).ToList();
                        break;

                    }
                case "Trash":
                    {
                        list = db.Menus.ToList();
                        break;

                    }
            }

            return list;
        }
        //Trả về số lượng
        public long getCount()
        {
            var count = db.Menus.Count();
            return count;
        }
        // Trả về 1 mẫu tin
   
        public Menus getRow(int? id)
        {
            Menus row = db
                .Menus.Find(id);
            return row;
        }
        public Menus getRow(string link)
        {
            var row = db.Menus
                .Where(m => m.Link == link)
                .FirstOrDefault();
            return row;
        }
        //Thêm
        public int Insert(Menus row)
        {
            db.Menus.Add(row);
            db.SaveChanges();
            return row.Id;

        }
        //Sửa
        public int Update(Menus row)
        {
            db.Entry(row).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return row.Id;

        }
        //Xoá
        public int Delete(Menus row)
        {
            db.Menus.Remove(row);
            db.SaveChanges();
            return row.Id;

        }
    }
}