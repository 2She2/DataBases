namespace StudentSystem.Data.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    using StudentSystem.Model;

    public sealed class Configuration : DbMigrationsConfiguration<StudentSystemDbContext>
    {
        public Configuration()
        {
            this.AutomaticMigrationsEnabled = true;
            this.AutomaticMigrationDataLossAllowed = true;
            this.ContextKey = "StudentSystem.Data.StudentSystemDbContext";
        }

        protected override void Seed(StudentSystemDbContext context)
        {
            var sasho = new Student
                {
                    FirstName = "Sasho",
                    LastName = "Sashov",
                    Age = 27,
                    Number = "34534"
                };

            var gosho = new Student
                {
                    FirstName = "Gosho",
                    LastName = "Goshov",
                    Age = 21,
                    Number = "564545"
                };

            context.Students.AddOrUpdate(sasho);
            context.Students.AddOrUpdate(gosho);

            context.SaveChanges();

            var databases = new Course
                   {
                       Name = "Databases",
                       Description = "Databases learning",
                       Materials = "Everything you can find!"
                   };

            var dsa = new Course
                {
                    Name = "Data structures and algorithms",
                    Description = "DSA very hard shit",
                    Materials = "Lots of material, can't learn a thing!"
                };

            context.Courses.AddOrUpdate(databases);
            context.Courses.AddOrUpdate(dsa);

            context.SaveChanges();

            var codeFirst = new Homework
                {
                    Content = "Entity Framework Rocks!",
                    CourseId = context.Courses.First(x => x.Name == "Databases").CourseId,
                    StudentId = context.Students.First(x => x.FirstName == "Sasho").StudentId,
                    TimeSent = new DateTime(2014, 08, 31)
                };

            var dictionariesAndHashTables = new Homework
                {
                    Content = "DSA?!? No idea what is going on there!",
                    CourseId = context.Courses.First(x => x.Name == "Data structures and algorithms").CourseId,
                    StudentId = context.Students.First(x => x.FirstName == "Gosho").StudentId,
                    TimeSent = new DateTime(2014, 09, 1)
                };

            context.Homeworks.AddOrUpdate(codeFirst);
            context.Homeworks.AddOrUpdate(dictionariesAndHashTables);

            context.SaveChanges();
        }
    }
}
