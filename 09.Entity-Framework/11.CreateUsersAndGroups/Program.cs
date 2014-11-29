// 11.Create a database holding users and groups. Create a transactional EF based method that
//	  creates an user and puts it in a group "Admins". In case the group "Admins" do not exist,
//	  create the group in the same transaction.
//	  If some of the operations fail (e.g. the username already exist), cancel the entire transaction.

namespace _11.CreateUsersAndGroups
{
    using System;
    using System.Linq;
    using System.Transactions;

    using UsersGroups.Data;

    class Program
    {
        static void Main(string[] args)
        {
            using (var scope = new TransactionScope(TransactionScopeOption.Required))
            {
                using (var db = new UserGroupsEntities())
                {
                    var groupAdmins = new Group()
                    {
                        GroupName = "Admins"
                    };

                    if (db.Groups.Count(x => x.GroupName == "Admins") == 0)
                    {
                        db.Groups.Add(groupAdmins);
                        db.SaveChanges();
                    }

                    var user = new User()
                    {
                        UserName = "Gosho",
                        GroupID = db.Groups.Where(x => x.GroupName == "Admins").First().GroupID
                    };

                    db.Users.Add(user);
                    db.SaveChanges();
                }

                scope.Complete();
            }
        }
    }
}
