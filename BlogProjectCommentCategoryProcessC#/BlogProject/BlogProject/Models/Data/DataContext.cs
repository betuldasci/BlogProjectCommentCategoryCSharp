using Microsoft.EntityFrameworkCore;

namespace BlogProject.Models.Data
{
    public class DataContext:DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }

        public DbSet<User> Users { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Blog> Blogs { get; set; }
        public DbSet<CategoryBlog> BlogCategories { get; set; }
 
        public DbSet<Comment> Comments { get; set; }
    }
}
