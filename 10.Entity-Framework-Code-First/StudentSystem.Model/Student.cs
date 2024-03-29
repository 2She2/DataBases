﻿namespace StudentSystem.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Student
    {
        private ICollection<Course> courses;
        private ICollection<Homework> homeworks;
        private ICollection<Test> tests;

        public Student()
        {
            this.courses = new HashSet<Course>();
            this.homeworks = new HashSet<Homework>();
            this.tests = new HashSet<Test>();
            this.ContactInfo = new StudentContactInfo();
        }

        [Key]
        public int StudentId { get; set; }

        [Required]
        [MinLength(3)]
        [MaxLength(20)]
        public string FirstName { get; set; }

        [Required]
        [MinLength(3)]
        [MaxLength(20)]
        public string LastName { get; set; }

        public int Age { get; set; }

        public string Number { get; set; }

        public StudentContactInfo ContactInfo { get; set; }

        public virtual ICollection<Course> Courses
        {
            get { return this.courses; }

            set { this.courses = value; }
        }

        public ICollection<Homework> Homeworks
        {
            get { return this.homeworks; }

            set { this.homeworks = value; }
        }

        public ICollection<Test> Test
        {
            get { return this.tests; }

            set { this.tests = value; }
        }
    }
}
