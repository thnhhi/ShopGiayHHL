using ShopGiayHHL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopGiayHHL.DAO
{
    public class CategoryDAO
    {
        MyDBContext db = null;
        public CategoryDAO()
        {
            db = new MyDBContext();
        }
        //Tra về danh sách List Object
        public List<Categorys> getList(string page = "Index")
        {
            if(page == "Index")
            {
                var list = db.Categorys
                .Where(m => m.Status != 0)
                .OrderBy(m => m.Created_At)
                .ToList();
                return list;
            }
            else
            {
                var list = db.Categorys
                .Where(m => m.Status == 0)
                .OrderBy(m => m.Created_At)
                .ToList();
                return list;
            }    
            
            

        }
        public List<Categorys> getList()
        {
            var list = db.Categorys
                .Where(m => m.Status == 1)
                .OrderByDescending(m => m.Created_At)
                .ToList();
            return list;
        }
        public List<Categorys> getList(int? parentid = 0)
        {
            List<Categorys> list = db.Categorys
                .Where(m => m.ParentId == parentid && m.Status == 1)
                .OrderBy(m => m.Orders)
                .ToList();
            return list;

        }
        public List<Categorys> getListCon(int? parentid = 1)
        {
            List<Categorys> list = db.Categorys
                .Where(m => m.ParentId == parentid && m.Status == 1)
                .OrderBy(m => m.Orders)
                .ToList();
            return list;

        }
        public List<Categorys> getListStatus(String status)
        {
            List<Categorys> list = null;
            switch (status)
            {
                case "All":
                    {
                        list = db.Categorys.ToList();
                        break;

                    }
                case "Index":
                    {
                        list = db.Categorys.Where(m => m.Status != 0).ToList();
                        break;

                    }
                case "Trash":
                    {
                        list = db.Categorys.ToList();
                        break;

                    }
            }

            return list;
        }
        //Trả về số lượng
        public long getCount()
        {
            var count = db.Categorys.Count();
            return count;
        }
        // Trả về 1 mẫu tin
        public Categorys getRow(string slug)
        {
            var row = db
                .Categorys.Where(m => m.Slug == slug && m.Status == 1)
                .FirstOrDefault();
            return row;
        }
        public Categorys getRow(int? id)
        {
            Categorys row = db
                .Categorys.Find(id);
            return row;
        }
        //Thêm
        public int Insert(Categorys row)
        {
            db.Categorys.Add(row);
            db.SaveChanges();
            return row.Id;

        }
        //Sửa
        public int Update(Categorys row)
        {
            db.Entry(row).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return row.Id;

        }
        //Xoá
        public int Delete(Categorys row)
        {
            db.Categorys.Remove(row);
            db.SaveChanges();
            return row.Id;

        }

        public List<int> getListId (int parentid)
        {
            //Xử lý 
            List<int> listcatid = new List<int>();
            List<Categorys> listcategory1 = this.getList(parentid);
            if(listcategory1.Count > 0)
            {
                foreach (var cat1 in listcategory1)
                {
                    listcatid.Add(cat1.Id);
                    List<Categorys> listcategory2 = this.getList(cat1.Id);
                    if (listcategory2.Count > 0)
                    {
                        foreach (var cat2 in listcategory2)
                        {
                            listcatid.Add(cat2.Id);
                            List<Categorys> listcategory3 = this.getList(cat2.Id);
                            if (listcategory3.Count > 0)
                            {
                                foreach (var cat3 in listcategory3)
                                {
                                    listcatid.Add(cat3.Id);
                                }
                            }
                        }
                    }    
                }
            }    
            
            listcatid.Add(parentid);
            return listcatid;
        }
    }
}