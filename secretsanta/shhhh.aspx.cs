using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Services;
using System.Threading;
using thescruffster.DAL;
using System.Net.Mail;
using System.Data.Linq;

namespace thescruffster.secretsanta
{
    public partial class shhhh : System.Web.UI.Page
    {
       
               
        public void DisplayAccountInfo(int? ssBrownleyId, string name)
        {
           try
            {
                using (var dbEntities = new thescruffsterDataContext())
                {

                    //get name of brownley
                    var brownley = dbEntities.Brownleys.SingleOrDefault(x => x.BrownleyID == ssBrownleyId);

                    //get recipient wish list
                    string b = brownley.Name;
                    string w = brownley.WishList;
                    if (String.IsNullOrEmpty(w)) { w = b + " has not yet submitted a wish list."; }

                    // get your wish list
                    var myrow = dbEntities.Brownleys.SingleOrDefault(y => y.Name == name);
                    string mywish = myrow.WishList;
                    if (String.IsNullOrEmpty(mywish)) { mywish = "No wish list submitted"; }

                    //make wheel and button invisible
                    //add secret santa account info
                    accountpanel.Visible = true;
                    lblMyAccount.Visible = true;
                    mywishpanel.Visible = true;
                    historyPanel.Visible = true;
                    staticImg.Style.Add("visibility", "hidden");
                    btnChoose.Visible = false;
                    recepientname.InnerHtml = b;
                    recepientwishlabel.InnerHtml = b + "'s Wish List:";
                    recepientwishdata.InnerHtml = w;
                    txtWishList.Text = mywish;
                }
            }


            catch (Exception e)
            {
                MembershipUser user = Membership.GetUser();
                Mishap m = new Mishap
                {
                    Date = DateTime.Now,
                    Error = e.Message.ToString(),
                    UserName = user.UserName

                };

                try
                {
                    using (var dbEntities = new thescruffsterDataContext())
                    {
                        dbEntities.Mishaps.InsertOnSubmit(m);
                        dbEntities.SubmitChanges();
                    }
                }
                catch (Exception except)
                {
                  
                        System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
                        System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient();
                        var Email = "angie@thescruffster.com";

                        System.Net.Mail.MailAddress mailFrom = new System.Net.Mail.MailAddress("secretsanta@thescruffster.com");
                        System.Net.Mail.MailAddress mailTo = new System.Net.Mail.MailAddress(Email);
                        message.IsBodyHtml = true;
                        message.To.Add(mailTo);

                        message.Subject = "Secret Santa Display Account Info Error";
                        message.From = mailFrom;
                        message.Body = "<div style='width:585px; position:relative;height:auto;font-family:arial;font-size:12px'>" +
                        except.StackTrace +
                        "</div>";
                        mailClient.Send(message);
                        message.Dispose();
                    }

                  }
            }
        

        protected void Page_Load(object sender, EventArgs e)
        {
            thescruffsterDataContext dbEntities = new thescruffsterDataContext();
            Guid uid =  SecretSantaData.GetUserID();
           
            var ss = dbEntities.SecretSantas.SingleOrDefault(x => x.UserID == uid);
            if (!Page.IsPostBack)
            {
                 LoginName ln = new LoginName();

                //if you have an account and have chosen a brownley
                // display brownley along with their wishlist
                //if brownley is null then logging in for first time
                if (ss.BrownleyID != null)
                {
                    historyPanel.Visible = true;
                    DisplayAccountInfo(ss.BrownleyID, ss.Name);
                    txtWishList.Focus();
                }
                else { btnChoose.Text = "Spin the Brownley Wheel"; }
            }
         
            int month = DateTime.Today.Month;
            int day = DateTime.Today.Day;
            SetCalendar(day, month);

            HtmlGenericControl h = (HtmlGenericControl)vwLogin.FindControl("loginname");
            h.InnerHtml = ss.Name + "!";

            var brownleyRow = dbEntities.Brownleys.SingleOrDefault(x => x.Name == ss.Name);
            txtWishList.Text = brownleyRow.WishList;
          }

        public void SetCalendar(int day, int month)
        {
            //convert day and month int to string to add to div
            string strMonth = Convert.ToString(month);
            string strDay = Convert.ToString(day);
            switch (strMonth)
            {

                case "1":
                    strMonth = "Jan";
                    break;
                case "2":
                    strMonth = "Feb";
                    break;
                case "3":
                    strMonth = "Mar";
                    break;
                case "4":
                    strMonth = "Apr";
                    break;
                case "5":
                    strMonth = "May";
                    break;
                case "6":
                    strMonth = "Jun";
                    break;
                case "7":
                    strMonth = "Jul";
                    break;
                case "8":
                    strMonth = "Aug";
                    break;
                case "9":
                    strMonth = "Sep";
                    break;
                case "10":
                    strMonth = "Oct";
                    break;
                case "11":
                    strMonth = "Nov";
                    break;
                case "12":
                    strMonth = "Dec";
                    break;

            }

            divmonth.InnerText = strMonth;
            divday.InnerText = strDay;
        }

        protected void spin(Object sender, EventArgs e)
        {
             staticImg.Style.Add("visibility", "hidden");
            pnlMessage.Style.Add("visibility", "hidden");
            
            //ensure that secretsanta does not spin wheel again!            
           // SecretSantaData ssData = new SecretSantaData();

            if (SecretSantaData.GetSecretSanta().BrownleyID != null)
            {
                DisplayAccountInfo(SecretSantaData.GetSecretSanta().BrownleyID, SecretSantaData.GetSecretSanta().Name);
                return;
            }
            //  keep the wheel spinning
            string script = "__doAutoSave();";
            ScriptManager.RegisterStartupScript(this, this.GetType(),
                "myTimer", script, true);
            btnChoose.Text = "My Account";
        }

        [WebMethod]
        public static string ViewHistory()
        {
            SecretSantaData ssData = new SecretSantaData();
            string wl = ssData.GetWishListHistory()._2009_Wish_List;
            return wl;
        }
       
        [WebMethod]
        public static string ViewHistory2010()
        {

           SecretSantaData ssData = new SecretSantaData();
           string wl = ssData.GetWishListHistory()._2010_Wish_List;
           return wl;
        }

        [WebMethod]
        public static string ViewHistory2011()
        {
            SecretSantaData ssData = new SecretSantaData();
            string wl = ssData.GetWishListHistory()._2011_Wish_List;
            return wl;
        }

        [WebMethod]
        public static string ViewHistory2012()
        {
            SecretSantaData ssData = new SecretSantaData();
            string wl = ssData.GetWishListHistory()._2012_Wish_List;           
            return wl;
        }

        [WebMethod]
        public  static string EditWishList(string text)
        {
            try
            {
                thescruffsterDataContext dbEntities = new thescruffsterDataContext();
                
                if (!String.IsNullOrEmpty(text))
                {
                    // this satifies GetBrownley()
                    var uid = SecretSantaData.GetUserID();
                    var ss = dbEntities.SecretSantas.SingleOrDefault(x => x.UserID == uid);                   
                    var brownleyRow = dbEntities.Brownleys.SingleOrDefault(x => x.Name == ss.Name);
                    brownleyRow.WishList = text;
                  

                    try
                    {
                        brownleyRow.WishList = text;
                        dbEntities.SubmitChanges();
                        text = brownleyRow.WishList;
                    }

                    catch (Exception dbex)
                    {
                        return "Error: " + dbex.Message.ToString();
                    }

                    //if brownley is already chosen, find their secret santa and send an email
                    //containing wish list


                    if (brownleyRow.IsChosen)
                    {
                        var ssEmail = dbEntities.SecretSantas.SingleOrDefault(x => x.BrownleyID == brownleyRow.BrownleyID).Email;
                        var ssName = dbEntities.SecretSantas.SingleOrDefault(x => x.BrownleyID == brownleyRow.BrownleyID).Name;
                        System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
                        System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient();

                        //send an email to secretsanta when wishlist is created or updated
                        System.Net.Mail.MailAddress mailFrom = new System.Net.Mail.MailAddress("secretsanta@thescruffster.com");
                        System.Net.Mail.MailAddress mailTo = new System.Net.Mail.MailAddress(ssEmail);
                        message.IsBodyHtml = true;
                        message.To.Add(mailTo);
                        message.Bcc.Add(new System.Net.Mail.MailAddress("angie@thescruffster.com"));                        
                        message.Subject = "Secret Santa Wish List";
                        message.From = mailFrom;
                        message.Body = "<div style='width:585px; position:relative;height:auto;font-family:arial;font-size:12px'>" +
                        "<div style='width:585px;height:137px'><img src='http://www.thescruffster.com/styles/santa_logo.jpg' border='0' /></div>" +
                        "<div style='padding:20px;border:solid 1pt #952a20'>" +
                        "<span style='padding:10px'>Hi " + ssName + "! " + brownleyRow.Name + " has updated their wish list:</span>" +
                        "<div style='padding:10px'>" + brownleyRow.WishList + "</div>" +
                        "<div style='padding:10px;margin-bottom:10px'>You can also login to your account to view: <a href='http://www.thescruffster.com/secretsanta'>Brownley Secret Santa</a></div>" +
                        "<div style='padding:10px'>Merry Christmas!<br>" +
                        "secretsanta@thescruffster.com</div>";
                        mailClient.Send(message);
                        message.Dispose();

                    }

                }

            }
            catch (Exception ex)
            {
                MembershipUser user = Membership.GetUser();

                Mishap m = new Mishap
                {
                    Date = DateTime.Now,
                    Error = ex.Message.ToString(),
                    UserName = user.UserName
                };

                try
                {
                    using (thescruffsterDataContext db = new thescruffsterDataContext())
                    {
                        db.Mishaps.InsertOnSubmit(m);
                        db.SubmitChanges();
                    }
                }
                catch (Exception except)
                {
                    System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
                    System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient();
                    var Email = "angie@thescruffster.com";

                    System.Net.Mail.MailAddress mailFrom = new System.Net.Mail.MailAddress("secretsanta@thescruffster.com");
                    System.Net.Mail.MailAddress mailTo = new System.Net.Mail.MailAddress(Email);
                    message.IsBodyHtml = true;
                    message.To.Add(mailTo);

                    message.Subject = "Secret Santa Edit WishList Error";
                    message.From = mailFrom;
                    message.Body = "<div style='width:585px; position:relative;height:auto;font-family:arial;font-size:12px'>" +
                    except.StackTrace +
                    "</div>";
                    mailClient.Send(message);
                    message.Dispose();
                }

            }
            return text;
        }


        [WebMethod]
        public static string AutoSave()
        {
            string _secretsanta;
            thescruffsterDataContext dbEntities = new thescruffsterDataContext();
           
            try
            {               
                //put the thread to sleep for 5 seconds to keep the wheel spinning
                Thread.Sleep(5000);

                //get user id of secretsanta to update with chosen brownleyID
                Guid uid = SecretSantaData.GetUserID();
                MembershipUser user = Membership.GetUser();
                string username = user.UserName;
                
                //choose from the next availailable list of names  
                //do not choose yourself or your spouse!
                //add brownleyID to secretsanta tbl
                var secretsantaRow = dbEntities.SecretSantas.Single(x => x.Email == username);

                var brownleyQuery = from b in dbEntities.Brownleys
                                    where b.Name != secretsantaRow.Name
                                    where b.Name != secretsantaRow.Spouse
                                    where b.IsChosen == false
                                    select new
                                    {
                                        Bid = b.BrownleyID,
                                        Bname = b.Name,
                                        WishList = b.WishList
                                    };
                string wishlist = brownleyQuery.FirstOrDefault().WishList;
                int ID = brownleyQuery.FirstOrDefault().Bid;
                string name = brownleyQuery.FirstOrDefault().Bname;
                
                var secretsanta = dbEntities.SecretSantas.SingleOrDefault(x => x.UserID == uid);
                secretsanta.BrownleyID = ID;

                var brownley = dbEntities.Brownleys.SingleOrDefault(y => y.BrownleyID == ID);
                brownley.IsChosen = true;
                dbEntities.SubmitChanges();
                

                var secretSantaName = dbEntities.SecretSantas.Single(z => z.Name == name);
                 _secretsanta = "<font color='red'><b>Shhhhh!</b></font> - You are <b>" + name + "</b>'s Secret Santa. <p>";

                //return wishlist if one exists
                if (String.IsNullOrEmpty(wishlist))
                {
                    wishlist = name + " has not created a wish list yet." +
                        " An email containing " + name + "'s list will be sent to you once submitted."
                        + " You can also view " + name + "'s list in your account below.";
                }
                _secretsanta += "<font color='blue'>" + name + "'s Wish List</font>: " + wishlist;
            }
            catch (Exception ex)
            {

                MembershipUser user = Membership.GetUser();
                try
                {
                    Mishap m = new Mishap
                    {
                        Date = DateTime.Now,
                        Error = ex.Message.ToString(),
                        UserName = user.UserName
                    };

                    dbEntities.Mishaps.InsertOnSubmit(m);
                    dbEntities.SubmitChanges();
                }

                catch (Exception except)
                {
                    try
                    {
                       
                        System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
                        System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient();
                        var Email = "angie@thescruffster.com";

                        System.Net.Mail.MailAddress mailFrom = new System.Net.Mail.MailAddress("secretsanta@thescruffster.com");
                        System.Net.Mail.MailAddress mailTo = new System.Net.Mail.MailAddress(Email);
                        message.IsBodyHtml = true;
                        message.To.Add(mailTo);

                        message.Subject = "Secret Santa AutoSave Error";
                        message.From = mailFrom;
                        message.Body = "<div style='width:585px; position:relative;height:auto;font-family:arial;font-size:12px'>" +
                        except.StackTrace +
                        "</div>";
                        mailClient.Send(message);
                        message.Dispose();
                    }

                    catch (Exception e)
                    {
                        _secretsanta = "Error";
                        return _secretsanta + ": " + e.Message.ToString();
                    }
                }

                _secretsanta = "Error";
                return _secretsanta + ": " + ex.Message.ToString();
            }
            //return name of secret santa along with wish list
            return _secretsanta;
        }
    }
}



