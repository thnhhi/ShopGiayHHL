using ShopGiayHHL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopGiayHHL.DAO
{
    public class PostDAO
    {
        MyDBContext db = null;
        public PostDAO()
        {
            db = new MyDBContext();
        }

        public Posts getRow(String slug)
        {
            var row = db.Posts
                .Where(m => m.Slug == slug && m.Status == 1)
                .FirstOrDefault();
            return row;
        }
        public List<Posts> getList(int? topid,int limit, int notid)
        {
            var list = db.Posts
                .Where(m => m.TopicId == topid && m.Status == 1 && m.Id!=notid)
                .OrderByDescending(m => m.Created_At)
                .Take(limit)
                .ToList();
                
            return list;
        }
        public List<Posts> getList(int? topid)
        {
            var list = db.Posts
                .Where(m => m.TopicId == 2 && m.Status == 1 )
                .OrderByDescending(m => m.Created_At)
                .ToList();

            return list;
        }
    }
}