using BlogProject.Models;
using BlogProject.Models.Data;
using BlogProject.Models.Interfaces;

namespace BlogProject.Services
{
    public class CategoryService : ICategoryService
    {
        DataContext db;
        public CategoryService(DataContext db)
        {
            this.db = db;
        }
        public Task<bool> AddCategoryAsync(Category category)
        {
            var result = false;
            if (!String.IsNullOrEmpty(category.Name))
            {
                db.Categories.AddAsync(category);
                db.SaveChanges();

                result = true;
            }
            return Task.FromResult(result);
        }

        public Task<bool> DeleteCategoryAsync(int id)
        {
            throw new NotImplementedException();
        }

        public Task<List<Category>> GetAllCategoryAsync()
        {
            var categoryList = db.Categories.Where(x => !x.IsDelete).ToList();
            return Task.FromResult(categoryList);
        }

        public Task<Category> GetCategoryByIdAsync(int id)
        {
            throw new NotImplementedException();
        }

        public Task<bool> UpdateCategoryAsync(Category category)
        {
            throw new NotImplementedException();
        }
    }
}
