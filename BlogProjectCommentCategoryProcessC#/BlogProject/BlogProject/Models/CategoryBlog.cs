using System.ComponentModel.DataAnnotations.Schema;

namespace BlogProject.Models
{
    public class CategoryBlog
    {
        public int Id { get; set; }
        public int BlogId { get; set; }
        [ForeignKey("BlogId")]
        public Blog Blog { get; set; }
        public int CategoryId { get; set; }
        [ForeignKey("CategoryId")]
        public Category Category { get; set; }
    }
}
