using BlogProject.Models;

namespace BlogProject.ViewModels
{
    public class BlogViewModel
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? ShortDescription { get; set; }
        public bool IsStatus { get; set; }
        public DateTime CreateDate { get; set; }
        public int UserId { get; set; }
        public string? Username { get; set; }
        public int CommentCount { get; set; }
    
        public List<Category>? Categories { get; set; }
        public List<Comment>? Comments { get; set; }
    }
}
