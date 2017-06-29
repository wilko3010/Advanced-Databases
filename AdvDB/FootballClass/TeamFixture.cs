namespace FootballClass
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TeamFixture")]
    public partial class TeamFixture
    {
        public int ID { get; set; }

        public int? FixtureID { get; set; }

        public int? HomeTeamID { get; set; }

        public int? AwayTeamID { get; set; }

        public int? WinningTeamID { get; set; }

        public bool Deleted { get; set; }

        public virtual Fixture Fixture { get; set; }

        public virtual Team Team { get; set; }

        public virtual Team Team1 { get; set; }
    }
}
