namespace FootballClass
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Player")]
    public partial class Player
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Player()
        {
            PlayerFixtures = new HashSet<PlayerFixture>();
        }

        public int ID { get; set; }

        [Required]
        [StringLength(15)]
        public string Firstname { get; set; }

        [Required]
        [StringLength(25)]
        public string Surname { get; set; }

        [Column(TypeName = "date")]
        public DateTime DOB { get; set; }

        public int ShirtNumber { get; set; }

        [StringLength(5)]
        public string FavouredFoot { get; set; }

        public int? PositionID { get; set; }

        public int? RosterID { get; set; }

        public int? SetPieceID { get; set; }

        public bool Deleted { get; set; }

        public virtual Position Position { get; set; }

        public virtual Roster Roster { get; set; }

        public virtual SetPiece SetPiece { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlayerFixture> PlayerFixtures { get; set; }
    }
}
