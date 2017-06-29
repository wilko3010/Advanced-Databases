namespace FootballClass
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class FootballModel : DbContext
    {
        public FootballModel()
            : base("name=FootballDB")
        {
        }

        public virtual DbSet<Competition> Competitions { get; set; }
        public virtual DbSet<CompetitionType> CompetitionTypes { get; set; }
        public virtual DbSet<Fixture> Fixtures { get; set; }
        public virtual DbSet<Player> Players { get; set; }
        public virtual DbSet<PlayerFixture> PlayerFixtures { get; set; }
        public virtual DbSet<Position> Positions { get; set; }
        public virtual DbSet<Roster> Rosters { get; set; }
        public virtual DbSet<SetPiece> SetPieces { get; set; }
        public virtual DbSet<Team> Teams { get; set; }
        public virtual DbSet<TeamCompetition> TeamCompetitions { get; set; }
        public virtual DbSet<TeamFixture> TeamFixtures { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Competition>()
                .HasMany(e => e.Fixtures)
                .WithOptional(e => e.Competition)
                .WillCascadeOnDelete();

            modelBuilder.Entity<Competition>()
                .HasMany(e => e.TeamCompetitions)
                .WithOptional(e => e.Competition)
                .WillCascadeOnDelete();

            modelBuilder.Entity<CompetitionType>()
                .HasMany(e => e.Competitions)
                .WithOptional(e => e.CompetitionType)
                .WillCascadeOnDelete();

            modelBuilder.Entity<Fixture>()
                .HasMany(e => e.PlayerFixtures)
                .WithOptional(e => e.Fixture)
                .WillCascadeOnDelete();

            modelBuilder.Entity<Fixture>()
                .HasMany(e => e.TeamFixtures)
                .WithOptional(e => e.Fixture)
                .WillCascadeOnDelete();

            modelBuilder.Entity<Player>()
                .HasMany(e => e.PlayerFixtures)
                .WithOptional(e => e.Player)
                .WillCascadeOnDelete();

            modelBuilder.Entity<Position>()
                .HasMany(e => e.Players)
                .WithOptional(e => e.Position)
                .WillCascadeOnDelete();

            modelBuilder.Entity<Roster>()
                .HasMany(e => e.Players)
                .WithOptional(e => e.Roster)
                .WillCascadeOnDelete();

            modelBuilder.Entity<Roster>()
                .HasMany(e => e.Teams)
                .WithOptional(e => e.Roster)
                .WillCascadeOnDelete();

            modelBuilder.Entity<SetPiece>()
                .HasMany(e => e.Players)
                .WithOptional(e => e.SetPiece)
                .WillCascadeOnDelete();

            modelBuilder.Entity<Team>()
                .HasMany(e => e.TeamCompetitions)
                .WithOptional(e => e.Team)
                .WillCascadeOnDelete();

            modelBuilder.Entity<Team>()
                .HasMany(e => e.TeamFixtures)
                .WithOptional(e => e.Team)
                .HasForeignKey(e => e.AwayTeamID);

            modelBuilder.Entity<Team>()
                .HasMany(e => e.TeamFixtures1)
                .WithOptional(e => e.Team1)
                .HasForeignKey(e => e.HomeTeamID)
                .WillCascadeOnDelete();
        }
    }
}
