namespace StudentSystem.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Test
    {
        private ICollection<Student> students;

        public Test()
        {
            this.TestId = Guid.NewGuid();
            this.students = new HashSet<Student>();
        }

        [Key, ForeignKey("Course")]
        public Guid TestId { get; set; }

        public string Name { get; set; }

        public DateTime Start { get; set; }

        public DateTime End { get; set; }

        public virtual Course Course { get; set; }

        public ICollection<Student> Students
        {
            get { return this.students; }

            set { this.students = value; }
        }
    }
}
