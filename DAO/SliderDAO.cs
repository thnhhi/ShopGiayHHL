using ShopGiayHHL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopGiayHHL.DAO
{
    public class SliderDAO
    {
        MyDBContext db = null;
        public SliderDAO()
        {
            db = new MyDBContext();
        }

        public List<Sliders> getList(String position)
        {
            List<Sliders> list = db.Sliders
                .Where(m => m.Position == position && m.Status == 1)
                .OrderBy(m => m.Orders)
                .ToList();
            return list;

        }
    }
}