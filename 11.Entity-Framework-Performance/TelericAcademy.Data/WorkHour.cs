namespace TelericAcademy.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class WorkHour
    {
        [Key]
        public int WorkHoursID { get; set; }

        public int EmployeeID { get; set; }

        public DateTime Date { get; set; }

        [Required]
        [StringLength(100)]
        public string Task { get; set; }

        public int? Hours { get; set; }

        [StringLength(100)]
        public string Comments { get; set; }

        public virtual Employee Employee { get; set; }
    }
}
