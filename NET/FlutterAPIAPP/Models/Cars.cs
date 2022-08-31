using System.ComponentModel.DataAnnotations;

namespace FlutterAPIAPP.Models
{
    public class Cars
    {
        [Required]
        [Key]
        public int CarID { get; set; }
        [Required]
        public string CarName { get; set; } = null!;
        [Required]
        public string CarModel { get; set; } = null!;
        [Required]
        public string CarCompany { get; set; } = null!;
        [Required]
        public DateTime CarReleaseDate { get; set; }
        [Required]
        public decimal CarPrice { get; set; }
        [Required]
        public string CarImage { get; set; } = null!;
    }
}
