namespace ShopGiayHHL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Orders
    {
        public int Id { get; set; }

        public int Code { get; set; }

        [StringLength(255)]
        public string DeliveryName { get; set; }

        [StringLength(255)]
        public string DeliveryEmail { get; set; }

        [StringLength(255)]
        public string DeliveryPhone { get; set; }

        [StringLength(255)]
        public string DeliveryAddress { get; set; }

        [StringLength(255)]
        public string Note { get; set; }

        public int UserId { get; set; }

        public DateTime DateOrder { get; set; }

        public int? Updated_By { get; set; }

        public DateTime? Updated_At { get; set; }

        public int? Status { get; set; }
    }
}
