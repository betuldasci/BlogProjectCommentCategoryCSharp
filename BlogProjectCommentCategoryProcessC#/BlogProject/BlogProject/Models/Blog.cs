using BlogProject.Models.Abstracts;
using System.Xml.Linq;

namespace BlogProject.Models
{
    public class Blog:CommonProperties
    {
        public DateTime CreateDate { get; set; }
        public string? Image { get; set; }
        public string? ShortDescription { get; set; }
        public int UserId { get; set; }
        public User? User { get; set; }
       
        public List<Comment>? Comments { get; set; }
        public List<CategoryBlog>? BlogCategories { get; set; }
    }
}
