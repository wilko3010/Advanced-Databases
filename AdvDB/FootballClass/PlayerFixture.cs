namespace FootballClass
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PlayerFixture")]
    public partial class PlayerFixture
    {
        public int ID { get; set; }

        public int? PlayerID { get; set; }

        public int? FixtureID { get; set; }

        public bool StartingEleven { get; set; }

        public bool Substitute { get; set; }

        public virtual Fixture Fixture { get; set; }

        public virtual Player Player { get; set; }
    }
}
