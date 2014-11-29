namespace StudentSystem.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Homework
    {
        private ICollection<Student> students;
        private ICollection<Course> courses;

        public Homework()
        {
            this.students = new HashSet<Student>();
            this.courses = new HashSet<Course>();
        }

        [Key]
        public int HomeworkId { get; set; }

        public string Content { get; set; }

        public DateTime TimeSent { get; set; }

        [ForeignKey("Course")]
        public Guid CourseId { get; set; }

        public virtual Course Course { get; set; }

        [ForeignKey("Student")]
        public int StudentId { get; set; }

        public virtual Student Student { get; set; }
    }
}
