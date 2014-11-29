namespace StudentSystem.Data.Repositories
{
    using System.Linq;

    using StudentSystem.Model;

    public class StudentsRepository : GenericRepository<Student>, IGenericRepository<Student>
    {
        public StudentsRepository(IStudentSystemDbContext context)
            : base(context)
        {
        }

        public IQueryable<Student> AllHomeworks()
        {
            return this.Search(s => s.Homeworks.Count > 0);
        }
    }
}
