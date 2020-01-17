using System;
using System.Collections.Generic;

namespace Service1.Models
{
    public class Media
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public DateTime ReleaseDate { get; set; }

        public MediaType Type { get; set; }

        public int? MediaCategoryId { get; set; }

        public List<Participant> Participants { get; set; } = new List<Participant>();

        public int Score { get; set; }
    }

    public enum MediaType
    {
        Film,
        Documentary,
        Biography,
        Anime,
        Cartoon
    }


}
