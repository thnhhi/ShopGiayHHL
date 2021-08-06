namespace ShopGiayHHL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ProductSales
    {
        public int Id { get; set; }

        public int? ProductId { get; set; }

        public double? PriceSale { get; set; }

        public DateTime? DateBegin { get; set; }

        public DateTime? DateEnd { get; set; }
    }
}
