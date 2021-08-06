namespace ShopGiayHHL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Posts
    {
        public int Id { get; set; }

        public int? TopicId { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Slug { get; set; }

        [Required]
        public string Detail { get; set; }

        [Required]
        [StringLength(255)]
        public string Img { get; set; }

        [StringLength(100)]
        public string PostType { get; set; }

        [StringLength(155)]
        public string MetaKey { get; set; }

        [StringLength(155)]
        public string MetaDesc { get; set; }

        public int? Created_By { get; set; }

        public DateTime? Created_At { get; set; }

        public int? Updated_By { get; set; }

        public DateTime? Updated_At { get; set; }

        public int? Status { get; set; }
    }
}
