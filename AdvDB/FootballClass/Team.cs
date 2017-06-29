namespace FootballClass
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Team")]
    public partial class Team
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Team()
        {
            TeamCompetitions = new HashSet<TeamCompetition>();
            TeamFixtures = new HashSet<TeamFixture>();
            TeamFixtures1 = new HashSet<TeamFixture>();
        }

        public int ID { get; set; }

        [Required]
        public string Name { get; set; }

        public int? RosterID { get; set; }

        public bool Deleted { get; set; }

        public virtual Roster Roster { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TeamCompetition> TeamCompetitions { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TeamFixture> TeamFixtures { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TeamFixture> TeamFixtures1 { get; set; }
    }
}
