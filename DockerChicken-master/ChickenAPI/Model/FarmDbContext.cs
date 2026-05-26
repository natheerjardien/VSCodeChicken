using Microsoft.EntityFrameworkCore;
using System.Reflection.Emit;

namespace ChickenAPI.Model
{
    public class FarmDbContext : DbContext
    {
        public DbSet<Chicken> Chicken { get; set; }

        public FarmDbContext(DbContextOptions<FarmDbContext> options) : base(options) { }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                // This ensures that when SQL Server is still executing the init-database script, 
                // the API waits and retries instead of crashing immediately.
                optionsBuilder.UseSqlServer(options => 
                    options.EnableRetryOnFailure(
                        maxRetryCount: 5,
                        maxRetryDelay: TimeSpan.FromSeconds(5),
                        errorNumbersToAdd: null
                    )
                );
            }
            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Chicken>()
                .Property(c => c.EggProduction)
                .HasPrecision(5, 2); // Set precision for decimal type meaning 5 total digits and 2 decimal places
        }
    }
}