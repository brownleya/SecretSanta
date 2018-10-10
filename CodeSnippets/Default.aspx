<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="thescruffster.CodeSnippets.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.9.1/styles/default.min.css"/>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.9.1/highlight.min.js"></script>
<script type="text/javascript"> hljs.initHighlightingOnLoad();</script>
<script src="../scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <title>Code Snippets</title>
    <script language="javascript" type="text/javascript" >
        $(document).ready(function () {
            $("#pageLoad").hide();
            $("#contentPanelPageLoad").click(function () {
                $("#pageLoad").slideToggle();
            });
            $("#setCal").hide();
            $("#contentPanelsetCal").click(function () {
                $("#setCal").slideToggle();
            });

            $("#Spin").hide();
            $("#contentPanelSpin").click(function () {
                $("#Spin").slideToggle();
            });

            $("#webMethods").hide();
            $("#contentPanelwebMethods").click(function () {
                $("#webMethods").slideToggle();
            });

            $("#DataCxt").hide();
            $("#contentPanelDataCxt").click(function () {
                $("#DataCxt").slideToggle();
            });

            $("#Acct").hide();
            $("#contentPanelAcct").click(function () {
                $("#Acct").slideToggle();
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="contentPanelPageLoad">
    <div> +// Page Load</div>
    <pre id="pageLoad">
    <code  >
        protected void Page_Load(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser();
            Guid uid = (Guid)user.ProviderUserKey;
            var ss = db.SecretSantas.SingleOrDefault(x => x.UserID == uid);

            if (!Page.IsPostBack)
            {
                LoginName ln = new LoginName();

                //if you have an account and have chosen a brownley
                // display brownley along with their wishlist
                //ideally edit your own wish list but may not have time


                //if brownley is null then logging in for first time
                if (ss.BrownleyID != null)
                {
                    historyPanel.Visible = true;
                    DisplayAccountInfo(ss.BrownleyID, ss.Name);
                    txtWishList.Focus();
                }
                else
                {
                    btnChoose.Text = "Spin the Brownley Wheel";

                }
            }

            else
            {

            }

            int month = DateTime.Today.Month;
            int day = DateTime.Today.Day;
            SetCalendar(day, month);

            HtmlGenericControl h = (HtmlGenericControl)vwLogin.FindControl("loginname");
            h.InnerHtml = ss.Name + "!";


            //  var ss = db.SecretSantas.SingleOrDefault(x => x.UserID == uid);
            var brownleyRow = db.Brownleys.SingleOrDefault(x => x.Name == ss.Name);

            txtWishList.Text = brownleyRow.WishList;

        }
    </code>  
    
   </pre>   
    
    </div>
    <div id="contentPanelsetCal">
    <div> +// Set Calendar</div>
    <pre id="setCal">
    <code>
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
    
    </code>
    </pre>
    </div>
    <div id="contentPanelSpin">
    <div> +// Spin</div>
    <pre id="Spin">
    <code>
      protected void spin(Object sender, EventArgs e)
        {

            //thescruffsterDataContext db = new thescruffsterDataContext();
            staticImg.Style.Add("visibility", "hidden");
            pnlMessage.Style.Add("visibility", "hidden");
            //ensure that secretsanta does not spin wheel again!
            MembershipUser user = Membership.GetUser();
            Guid uid = (Guid)user.ProviderUserKey;
            var ss = db.SecretSantas.SingleOrDefault(x => x.UserID == uid);

            if (ss.BrownleyID != null)
            {
                DisplayAccountInfo(ss.BrownleyID, ss.Name);
                return;
            }
            //  keep the wheel turning
            string script = "__doAutoSave();";
            ScriptManager.RegisterStartupScript(this, this.GetType(),
                "myTimer", script, true);
            btnChoose.Text = "My Account";
        }
    </code>
    
    </pre>
    </div>
        <div>
            <div id="contentPanelwebMethods">

                <div> +// Web Methods</div>
                <pre id="webMethods">
                    <code>

                           [WebMethod]
        public static string ViewHistory()
        {
            thescruffsterDataContext db = new thescruffsterDataContext();
            MembershipUser user = Membership.GetUser();
            Guid uid = (Guid)user.ProviderUserKey;
            var ss = db.SecretSantas.SingleOrDefault(x => x.UserID == uid);
            var brownleyRow = db.Brownleys.SingleOrDefault(x => x.Name == ss.Name);
            string wl = brownleyRow._2009_Wish_List;

            return wl;
        }
        [WebMethod]
        public static string ViewHistory2010()
        {
            thescruffsterDataContext db = new thescruffsterDataContext();
            MembershipUser user = Membership.GetUser();
            Guid uid = (Guid)user.ProviderUserKey;
            var ss = db.SecretSantas.SingleOrDefault(x => x.UserID == uid);
            var brownleyRow = db.Brownleys.SingleOrDefault(x => x.Name == ss.Name);
            string wl = brownleyRow._2010_Wish_List;

            return wl;
        }

        [WebMethod]
        public static string ViewHistory2011()
        {
            thescruffsterDataContext db = new thescruffsterDataContext();
            MembershipUser user = Membership.GetUser();
            Guid uid = (Guid)user.ProviderUserKey;
            var ss = db.SecretSantas.SingleOrDefault(x => x.UserID == uid);
            var brownleyRow = db.Brownleys.SingleOrDefault(x => x.Name == ss.Name);
            string wl = brownleyRow._2011_Wish_List;

            return wl;
        }

        [WebMethod]

        public static string EditWishList(string text)
        {
            try
            {
                thescruffsterDataContext db = new thescruffsterDataContext();
                if (!String.IsNullOrEmpty(text))
                {

                    MembershipUser user = Membership.GetUser();
                    Guid uid = (Guid)user.ProviderUserKey;
                    var ss = db.SecretSantas.SingleOrDefault(x => x.UserID == uid);
                    var brownleyRow = db.Brownleys.SingleOrDefault(x => x.Name == ss.Name);
                    brownleyRow.WishList = text;


                    try
                    {
                        db.SubmitChanges();
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
                        System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
                        System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient();
                        var ssEmail = db.SecretSantas.SingleOrDefault(x => x.BrownleyID == brownleyRow.BrownleyID).Email;
                        var ssName = db.SecretSantas.SingleOrDefault(x => x.BrownleyID == brownleyRow.BrownleyID).Name;

                        //send an email to secretsanta when wishlist is created or updated

                        System.Net.Mail.MailAddress mailFrom = new System.Net.Mail.MailAddress("secretsanta@thescruffster.com");
                        System.Net.Mail.MailAddress mailTo = new System.Net.Mail.MailAddress(ssEmail);
                        message.IsBodyHtml = true;
                        message.To.Add(mailTo);

                        if (!String.IsNullOrEmpty(ssEmail))
                        {
                            message.Bcc.Add(new System.Net.Mail.MailAddress("angie@thescruffster.com"));
                        }
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
                thescruffsterDataContext db = new thescruffsterDataContext();
                MembershipUser user = Membership.GetUser();

                Mishap m = new Mishap
                {
                    Date = DateTime.Now,
                    Error = ex.Message.ToString(),
                    UserName = user.UserName

                };

                try
                {
                    db.Mishaps.InsertOnSubmit(m);
                    db.SubmitChanges();
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
            thescruffsterDataContext db = new thescruffsterDataContext();
            try
            {
                //put the thread to sleep for maybe 20 seconds to keep the wheel spinning
                Thread.Sleep(5000);

                //get user id of secretsanta to update with chosen brownleyID
                MembershipUser user = Membership.GetUser();
                Guid uid = (Guid)user.ProviderUserKey;
                string username = user.UserName;


                //go to database and choose from the next availailable list of names  
                //do not choose yourself or your spouse!
                //add brownleyID to secretsanta tbl
                var secretsantaRow = db.SecretSantas.Single(x => x.Email == username);

                var brownleyQuery = from b in db.Brownleys
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


                var ss = db.SecretSantas.SingleOrDefault(x => x.UserID == uid);
                ss.BrownleyID = ID;

                var brownley = db.Brownleys.SingleOrDefault(y => y.BrownleyID == ID);
                brownley.IsChosen = true;

                db.SubmitChanges();

                var SSname = db.SecretSantas.Single(z => z.Name == name);
                //everyone has a userid now

                //if (SSname.UserID == null)
                //{
                //    wishlist = name + " has not created a wish list yet." +
                //        " An email containing " + name + "'s list will be sent to once submitted."
                //        + "You can also view " + name + "'s list here in your account.";
                //}


                //return brownley name
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

                    db.Mishaps.InsertOnSubmit(m);
                    db.SubmitChanges();
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

                    }
                }

                _secretsanta = "Error";
                return _secretsanta + ": " + ex.Message.ToString();
            }
            //return name of secret santa along with wish list
            return _secretsanta;
                    </code>
                </pre>
            </div>

        </div>

       <div id="contentPanelDataCxt">
       <div> +// Data Context</div>
       <pre id="DataCxt">
       <code>
        partial class thescruffsterDataContext
         {
          private static string _secretsanta;

        private static thescruffsterDataContext db
        {
            get { return new thescruffsterDataContext(); }
        }

        // partial class for dbml
       public thescruffsterDataContext()
        : base(ConfigurationManager.ConnectionStrings["thescruffsterConnectionString"].ConnectionString, mappingSource)
           {
               OnCreated();
           } 
    }
       </code>
       </pre>
       </div>
       <div id="contentPanelAcct">
       <div> +// Account Info</div>
       <pre id="Acct">
       <code>
        public void DisplayAccountInfo(int? brownleyID, string name)
        {
            try
            {
                thescruffsterDataContext db = new thescruffsterDataContext();

                //get name of brownley
                var brownley = db.Brownleys.SingleOrDefault(x => x.BrownleyID == brownleyID);

                //get recipient wish list
                string b = brownley.Name;
                string w = brownley.WishList;
                if (String.IsNullOrEmpty(w))
                {
                    w = b + " has not yet submitted a wish list.";
                }

                // get your wish list
                var myrow = db.Brownleys.SingleOrDefault(y => y.Name == name);

                string mywish = myrow.WishList;
                if (String.IsNullOrEmpty(mywish))
                {
                    mywish = "No wish list submitted";
                }
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


            catch (Exception e)
            {
                thescruffsterDataContext db = new thescruffsterDataContext();
                MembershipUser user = Membership.GetUser();

                Mishap m = new Mishap
                {
                    Date = DateTime.Now,
                    Error = e.Message.ToString(),
                    UserName = user.UserName

                };

                try
                {
                    db.Mishaps.InsertOnSubmit(m);
                    db.SubmitChanges();
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

                        message.Subject = "Secret Santa Display Account Info Error";
                        message.From = mailFrom;
                     <%--   message.Body = "<div style='width:585px; position:relative;height:auto;font-family:arial;font-size:12px'>" +
                        except.StackTrace +
                        "</div>";--%>
                        mailClient.Send(message);
                        message.Dispose();
                    }

                    catch (Exception ex)
                    {
                        
                    }
                }

            }

        }
       </code>
       </pre>
       
       </div>
    </form>
</body>
</html>
