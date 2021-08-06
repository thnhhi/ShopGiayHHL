namespace ShopGiayHHL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Contacts
    {
        public int Id { get; set; }

        [Required]
        [StringLength(64)]
        public string Title { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string Detail { get; set; }

        [Required]
        [StringLength(64)]
        public string FullName { get; set; }

        [Required]
        [StringLength(12)]
        public string Phone { get; set; }

        [Required]
        [StringLength(64)]
        public string Email { get; set; }

        public int? UserId { get; set; }

        public DateTime? DateContact { get; set; }

        public int? Updated_By { get; set; }

        public DateTime? Updated_At { get; set; }

        public int? Status { get; set; }
    }
}
