using ShopGiayHHL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopGiayHHL.DAO
{
    public class UserDAO
    {
        MyDBContext db = null;
        public UserDAO()
        {
            db = new MyDBContext();
        }
        public Users getRow(String str)
        {
            Users row = db.Users
                .Where(m => m.Status == 1 && m.Roles != 0 && (m.UserName == str || m.Email == str))
                .FirstOrDefault();
            return row;
        }
    }
}