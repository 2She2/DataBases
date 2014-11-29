namespace _02.DaoStaticMethods
{
    using System;
    using System.Data.Entity;

    using EntityFramework.Data;

    public static class DAO
    {
        public static void Insert(Customer customer)
        {
            using (var db = new NorthwindEntities())
            {
                var entry = db.Entry(customer);
                entry.State = EntityState.Added;

                db.Customers.Add(customer);
                db.SaveChanges();
            }
        }

        public static void Update(Customer customer)
        {
            using (var db = new NorthwindEntities())
            {
                var entry = db.Entry(customer);
                entry.State = EntityState.Modified;

                customer.ContactTitle = customer.ContactTitle + " Updated!";
                db.SaveChanges();
            }
        }

        public static void Delete(Customer customer)
        {
            using (var db = new NorthwindEntities())
            {
                var entry = db.Entry(customer);
                entry.State = EntityState.Deleted;
                db.SaveChanges();
            }
        }
    }
}
