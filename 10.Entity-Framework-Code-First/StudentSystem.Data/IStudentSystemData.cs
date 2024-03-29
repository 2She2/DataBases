﻿namespace StudentSystem.Data
{
    using StudentSystem.Data.Repositories;
    using StudentSystem.Model;

    public interface IStudentSystemData
    {
        IGenericRepository<Course> Courses { get; }

        StudentsRepository Students { get; }
    }
}
