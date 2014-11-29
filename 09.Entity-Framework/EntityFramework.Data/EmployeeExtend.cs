namespace EntityFramework.Data
{
    using System;
    using System.Linq;
    using System.Data.Linq;

    using EntityFramework.Data;

    public partial class Employee
    {
        private EntitySet<Territory> territoriesSet = new EntitySet<Territory>();

        public EntitySet<Territory> TerritoriesSet
        {
            get
            {
                this.territoriesSet.AddRange(this.Territories);

                return this.territoriesSet;
            }
        }
    }
}
