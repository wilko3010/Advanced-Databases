namespace FootballClass
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TeamCompetition")]
    public partial class TeamCompetition
    {
        public int ID { get; set; }

        public int Wins { get; set; }

        public int Losses { get; set; }

        public int Draws { get; set; }

        public int? TeamID { get; set; }

        public int? CompetitionID { get; set; }

        public virtual Competition Competition { get; set; }

        public virtual Team Team { get; set; }
    }
}
