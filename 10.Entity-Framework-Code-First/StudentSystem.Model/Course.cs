namespace StudentSystem.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Course
    {
        private ICollection<Student> students;
        private ICollection<Homework> homeworks;

        public Course()
        {
            this.students = new HashSet<Student>();
            this.homeworks = new HashSet<Homework>();
            this.CourseId = Guid.NewGuid();
        }

        public Guid CourseId { get; set; }

        [Required]
        public string Name { get; set; }

        public string Description { get; set; }

        public string Materials { get; set; }

        public virtual Test Test { get; set; }

        public virtual ICollection<Student> Students
        {
            get { return this.students; }

            set { this.students = value; }
        }

        public virtual ICollection<Homework> Homeworks 
        {
            get { return this.homeworks; }

            set { this.homeworks = value; }
        }
    }
}
