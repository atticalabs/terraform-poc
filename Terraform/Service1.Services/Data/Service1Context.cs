using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Service1.Services
{
    public class Service1Context:DbContext
    {
        public Service1Context(DbContextOptions<Service1Context> options)
            : base(options)
        {

        }

      
    }
}
