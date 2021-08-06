using ShopGiayHHL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopGiayHHL.DAO
{
    public class ContactDAO
    {
        MyDBContext db = new MyDBContext();


        public void Insert(Contacts contact)
        {
            db.Contacts.Add(contact);
            db.SaveChanges();
        }
    }
}