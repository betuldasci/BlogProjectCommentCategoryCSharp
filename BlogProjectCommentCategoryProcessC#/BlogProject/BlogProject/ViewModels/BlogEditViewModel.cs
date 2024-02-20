using BlogProject.Models;

namespace BlogProject.ViewModels
{
    public class BlogEditViewModel
    {
        public Blog? Blog { get; set; }
        public List<Category>? AllCategories { get; set; }
        public List<int>? SelectedCategoryIds { get; set; }
    }
}
