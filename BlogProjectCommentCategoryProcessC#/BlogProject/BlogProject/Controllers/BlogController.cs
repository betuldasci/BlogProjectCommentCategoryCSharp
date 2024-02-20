using BlogProject.Models;
using BlogProject.Models.Interfaces;
using BlogProject.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace BlogProject.Controllers
{
    public class BlogController : Controller
    {
        IBlogService blogService;
        ICategoryService categoryService;
        public BlogController(IBlogService blogService, ICategoryService categoryService)
        {
            this.blogService = blogService;
            this.categoryService = categoryService;
        }
        public async Task<IActionResult> Index()
        {
            var list = await blogService.GetBlogListAsync();
            return View(list);
        }

        public async Task<IActionResult> Add()
        {
            var categoryList = await categoryService.GetAllCategoryAsync();
            return View(categoryList);
        }

        [HttpPost]
        public async Task<IActionResult> Add(Blog blog, int[] categoryIds)
        {
            var result = await blogService.AddBlogAsync(blog, categoryIds);
            TempData["Message"] = result ? "Blog ekleme başarılı" : "Blog ekleme başarısız";
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Delete(int id)
        {
            var result = await blogService.DeleteBlogAsync(id);
            TempData["Message"] = result ? "Blog basarıyla silindi" : "Silme işlemi basarısız";
            return RedirectToAction("Index");
        }

        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var blog = await blogService.GetBlogByIdAsync(id);
            var allCategories = await categoryService.GetAllCategoryAsync();
            var selectedCategoryIds = blog.BlogCategories.Select(c => c.CategoryId).ToList();

            var model = new BlogEditViewModel()
            {
                Blog = blog,
                AllCategories = allCategories,
                SelectedCategoryIds = selectedCategoryIds
            };
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, BlogEditViewModel model)
        {
            var selectedCategoryIds = model.SelectedCategoryIds.ToArray();
            var result = await blogService.UpdateBlogAsync(model.Blog, selectedCategoryIds);
            TempData["Message"] = result ? "Düzenleme basarılı" : "basarısız duzenleme";
            return RedirectToAction("Edit", new {id=model.Blog.Id});
        }
    }
}
