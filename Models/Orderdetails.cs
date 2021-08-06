namespace ShopGiayHHL.Models
{
    using Microsoft.Build.Tasks.Deployment.Bootstrapper;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Orderdetails
    {
        public int Id { get; set; }

        public int OrderId { get; set; }

        public int ProductId { get; set; }

        public int Quantity { get; set; }

        public double PriceBuy { get; set; }
    }
  
}
