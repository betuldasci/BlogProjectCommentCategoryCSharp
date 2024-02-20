using BlogProject.Models;
using BlogProject.Models.Data;
using BlogProject.Models.Interfaces;
using BlogProject.ViewModels;
using Microsoft.EntityFrameworkCore;

namespace BlogProject.Services
{
    public class CommentService : ICommentService
    {
        private readonly DataContext db;

        public CommentService(DataContext db)
        {
            this.db = db;
        }

        public async Task<List<CommentViewModel>> GetCommentsForActiveBlogsAsync()
        {
            var comments = await db.Comments
                .Where(c => c.Blog.IsStatus && !c.IsDelete) 
                .Include(c => c.User)
                .Include(c => c.Blog)
                .Select(c => new CommentViewModel
                {
                    Username = c.User.Username,
                    CommentName = c.Name,
                    CommentDescription = c.Description,
                    BlogName = c.Blog.Name
                }).ToListAsync();

            return comments;
        }

       
    }
}
