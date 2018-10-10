using System;
using System.Configuration;
using System.Data.Linq.Mapping;
using System.Web.Security;
namespace thescruffster.DAL
{
    partial class thescruffsterDataContext
    {
        public thescruffsterDataContext() :
            base(ConfigurationManager.ConnectionStrings["thescruffsterConnectionString"].ConnectionString, mappingSource)
        {
            OnCreated();

        }

    }
    partial class Brownley
    {
        Brownley b;

      //  partial void GetBrownley()
       // {

            //var ss = db.SecretSantas.SingleOrDefault(x => x.UserID == GetUserID());
            //var brownleyRow = db.Brownleys.SingleOrDefault(x => x.Name == ss.Name);
            //return brownleyRow;

            // var brownleyRow =  this..OnBrownleyIDChanged.SingleOrDefault(x => x.Name == ss.Name);

        //}



    }
}

   

