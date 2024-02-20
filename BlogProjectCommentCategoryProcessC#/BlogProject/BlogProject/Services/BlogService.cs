using BlogProject.Models;
using BlogProject.Models.Data;
using BlogProject.Models.Interfaces;
using BlogProject.ViewModels;
using Microsoft.EntityFrameworkCore;

namespace BlogProject.Services
{
    public class BlogService : IBlogService
    {
        DataContext db;
        public BlogService(DataContext db)
        {
            this.db = db;
        }
        public async Task<bool> AddBlogAsync(Blog blog, int[] categoryIds)
        {
            var result = false;
            if (!String.IsNullOrEmpty(blog.Name))
            {
                blog.CreateDate = DateTime.Now;
                blog.UserId = 1;
                db.Blogs.AddAsync(blog);
                db.SaveChanges();
                foreach (var category in categoryIds)
                {
                    var blogCategory = new CategoryBlog()
                    {
                        BlogId = blog.Id,
                        CategoryId = category
                    };
                    await db.BlogCategories.AddAsync(blogCategory);
                }

                await db.SaveChangesAsync();
                result = true;

            }
            return result;
        }

        public async Task<bool> DeleteBlogAsync(int id)
        {
           var blog = await db.Blogs.Include(b=>b.Comments).FirstOrDefaultAsync(b=>b.Id == id);

            if(blog != null)
            {
                foreach(var comment in blog.Comments)
                {
                    comment.IsDelete = true;
                }
                blog.IsDelete = true;

                await db.SaveChangesAsync();
                return true;
            }
            return false;
        }

        public async Task<Blog> GetBlogByIdAsync(int id)
        {
           var blog = await db.Blogs.Include(b=>b.BlogCategories).ThenInclude(b=>b.Category).FirstOrDefaultAsync(b=>b.Id == id);
            return blog;
        }

        public Task<List<BlogViewModel>> GetBlogListAsync()
        {
            var blogInfo = from blog in db.Blogs.Include(b => b.Comments).ToList()
                           join blogCategory in db.BlogCategories.ToList()
                           on blog.Id equals blogCategory.BlogId
                           join user in db.Users
                           on blog.UserId equals user.Id
                           where blog.IsDelete == false

                           group new { Blog = blog, User = user } by blog.Id into groupedCategories

                           select new BlogViewModel
                           {
                               Id = groupedCategories.Key,
                               Name = groupedCategories.First().Blog.Name,
                               ShortDescription = groupedCategories.First().Blog.ShortDescription,
                               CreateDate = groupedCategories.First().Blog.CreateDate,
                               IsStatus = groupedCategories.First().Blog.IsStatus,
                               UserId = groupedCategories.First().User.Id,
                               Username = groupedCategories.First().User.Username,
                               CommentCount = db.Comments.Where(x => x.BlogId == groupedCategories.Key).Count(),

                               Categories = (from category in db.Categories join gc in db.BlogCategories on category.Id equals gc.CategoryId where groupedCategories.Key == gc.BlogId select category).ToList(),
                               Comments = db.Comments.Where(x => x.BlogId == groupedCategories.Key).ToList(),
                           };

            return Task.FromResult(blogInfo.ToList());
        }

        public Task<List<Blog>> GetBlogListByCategoryAsync(int categoryId)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> UpdateBlogAsync(Blog blog, int[] selectedCategoryIds)
        {
           var existingBlog = await db.Blogs.Include(b=>b.BlogCategories).FirstOrDefaultAsync(b=>b.Id==blog.Id);
            if(existingBlog != null)
            {
                existingBlog.Name = blog.Name;
                existingBlog.Description = blog.Description;
                existingBlog.ShortDescription = blog.ShortDescription;
                existingBlog.CreateDate = DateTime.Now;
                existingBlog.User = blog.User;

                existingBlog.BlogCategories.Clear();
                foreach(var categoryId in selectedCategoryIds)
                {
                    existingBlog.BlogCategories.Add(new CategoryBlog { BlogId = blog.Id, CategoryId = categoryId });
                }
                await db.SaveChangesAsync();
                return true;
            }
            return false;
        }
    }
}
