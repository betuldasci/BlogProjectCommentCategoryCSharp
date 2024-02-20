using BlogProject.Models.Abstracts;

namespace BlogProject.Models
{
    public class Comment:CommonProperties
    {
        public int? UserId { get; set; }
        public User? User { get; set; }
        public int? BlogId { get; set; }
        public Blog? Blog { get; set; }
    }
}
