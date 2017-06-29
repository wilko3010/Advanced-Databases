namespace FootballClass
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Competition")]
    public partial class Competition
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Competition()
        {
            Fixtures = new HashSet<Fixture>();
            TeamCompetitions = new HashSet<TeamCompetition>();
        }

        public int ID { get; set; }

        [Required]
        public string Name { get; set; }

        public int? CompetitionTypeID { get; set; }

        public bool Deleted { get; set; }

        public virtual CompetitionType CompetitionType { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Fixture> Fixtures { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TeamCompetition> TeamCompetitions { get; set; }
    }
}
