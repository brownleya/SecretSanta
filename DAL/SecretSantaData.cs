using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;

namespace thescruffster.DAL
{
    public class SecretSantaData
    {
        
       public static Brownley GetBrownley()
        {
            using (thescruffsterDataContext db = new thescruffsterDataContext())
            {
                var ss = db.SecretSantas.SingleOrDefault(x => x.UserID == GetUserID());
                var brownleyRow = db.Brownleys.SingleOrDefault(x => x.Name == ss.Name);
                return brownleyRow;
            }
        }

        public static Guid GetUserID()
        {
            MembershipUser user = Membership.GetUser();
            Guid uid = (Guid)user.ProviderUserKey;
            return uid;
        }

        public static SecretSanta GetSecretSanta()
        {
            using (thescruffsterDataContext db = new thescruffsterDataContext())
            {
                var secretSantaRow = db.SecretSantas.SingleOrDefault(x => x.UserID == GetUserID());
                return secretSantaRow;
            }
        }

        public Brownley GetWishListHistory()
        {
            using (thescruffsterDataContext db = new thescruffsterDataContext())
            {
                var ss = db.SecretSantas.SingleOrDefault(x => x.UserID == GetUserID());
                var brownleyRow = db.Brownleys.SingleOrDefault(x => x.Name == ss.Name);
                return brownleyRow;
            }
        }
    }
}
