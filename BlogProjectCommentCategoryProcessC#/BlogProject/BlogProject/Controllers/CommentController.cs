using BlogProject.Models.Data;
using BlogProject.Models.Interfaces;
using BlogProject.Services;
using Microsoft.AspNetCore.Mvc;

namespace BlogProject.Controllers
{
    public class CommentController : Controller
    {
        ICommentService commentService;  
      
        public CommentController(ICommentService commentService)
        {
            this.commentService = commentService;
        }
        public async Task<IActionResult> Index()
        {
            var commentList = await commentService.GetCommentsForActiveBlogsAsync();
            return View(commentList);
        }
    }
}
