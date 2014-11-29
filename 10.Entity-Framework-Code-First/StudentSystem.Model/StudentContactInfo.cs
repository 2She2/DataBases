namespace StudentSystem.Model
{
    using System.ComponentModel.DataAnnotations.Schema;

    [ComplexType]
    public class StudentContactInfo
    {
        [Column("E-mail")]
        public string Email { get; set; }

        [Column("Facebook Account")]
        public string Facebook { get; set; }

        [Column("Skype Account")]
        public string Skype { get; set; }
    }
}
