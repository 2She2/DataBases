namespace StudentSystem.Data.Repositories
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Linq.Expressions;

    public class TestingRepository<T> : IGenericRepository<T> where T : class
    {
        private IList<T> data;

        public IQueryable<T> All()
        {
            return this.data.AsQueryable();
        }

        public IQueryable<T> Search(Expression<Func<T, bool>> conditions)
        {
            throw new System.NotImplementedException();
        }

        public void Add(T entity)
        {
            throw new System.NotImplementedException();
        }

        public T Delete(T entity)
        {
            throw new System.NotImplementedException();
        }

        public void Update(T entity)
        {
            throw new System.NotImplementedException();
        }

        public void Detach(T entity)
        {
            throw new System.NotImplementedException();
        }

        public void SaveChanges()
        {
            throw new System.NotImplementedException();
        }
    }
}
