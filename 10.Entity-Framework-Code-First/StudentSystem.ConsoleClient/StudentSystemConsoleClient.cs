// If can't connect to the server check the connection stirng in "App.config"!
// ===========================================================================

namespace StudentSystem.ConsoleClient
{
    using System;
    using System.Data.Entity;
    using System.Linq;

    using StudentSystem.Data;
    using StudentSystem.Model;
    using StudentSystem.Data.Repositories;

    public class StudentSystemConsoleClient
    {
        public static void Main()
        {
            GeneratePDF.SalesReport("../../pdfTable.pdf");
            //var data = new StudentSystemData();

            //data.Students.Add(new Student
            //    {
            //        FirstName = "Misho",
            //        LastName = "Mishov",
            //        Age = 58,
            //        Number = "97532"
            //    });

            //data.Students.SaveChanges();

            //foreach (var currStudent in data.Students.All())
            //{
            //    Console.WriteLine(currStudent.FirstName);
            //}

            //var student = new Student
            //    {
            //        FirstName = "Pesho",
            //        LastName = "Peshov",
            //        Age = 22,
            //        Number = "324324"
            //    };

            //data.Students.Add(student);

            //student.Courses.Add(new Course
            //    {
            //        Name = "Entity Framework Rocks!",
            //        Description = "Studies Entity Framework technology"
            //    });

            //data.Students.Add(student);
            //data.Students.SaveChanges();

            //var firstStudent = data.Students.All().FirstOrDefault();
            //Console.WriteLine(firstStudent.StudentId + " " + firstStudent.FirstName + " " + firstStudent.LastName);
        }
    }
}
