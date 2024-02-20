using BlogProject.ViewModels;

namespace BlogProject.Models.Interfaces
{
    public interface IBlogService
    {
        public Task<List<BlogViewModel>> GetBlogListAsync();
        public Task<Blog> GetBlogByIdAsync(int id);
        public Task<bool> DeleteBlogAsync(int id);
        public Task<bool> AddBlogAsync(Blog blog, int[] categoryIds);
        public Task<bool> UpdateBlogAsync(Blog blog, int[] selectedCategoryIds);
        public Task<List<Blog>> GetBlogListByCategoryAsync(int categoryId);
    }
}
