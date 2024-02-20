using BlogProject.ViewModels;

namespace BlogProject.Models.Interfaces
{
    public interface ICommentService
    {
        Task<List<CommentViewModel>> GetCommentsForActiveBlogsAsync();

    }
}
