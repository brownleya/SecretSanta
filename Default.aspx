<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="thescruffster.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.9.1/styles/default.min.css"/>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.9.1/highlight.min.js"></script>
<script type="text/javascript"> hljs.initHighlightingOnLoad();</script>
    <script type="text/javascript"src="//code.jquery.com/jquery-1.9.1.min.js"></script>
    <title>Code Snippets</title>
    <script type="text/javascript" >
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

            <div id="contentPanelwebMethods"> +//Web Methods</div>
            <pre id="webMethods">
           
             <code>
            
                [WebMethod]
        public static string ViewHistory()
        {        
            SecretSantaData ssData = new SecretSantaData();
            string wl = ssData.GetBrownley()._2009_Wish_List;
            return wl;
        }
       
        [WebMethod]
        public static string ViewHistory2010()
        {

           SecretSantaData ssData = new SecretSantaData();
           string wl = ssData.GetBrownley()._2010_Wish_List;
           return wl;
        }

        [WebMethod]
        public static string ViewHistory2011()
        {
            SecretSantaData ssData = new SecretSantaData();
            string wl = ssData.GetBrownley()._2011_Wish_List;
            return wl;
        }

        [WebMethod]
        public static string ViewHistory2012()
        {
            SecretSantaData ssData = new SecretSantaData();
            string wl = ssData.GetBrownley()._2012_Wish_List;
            return wl;
        }

        [WebMethod]
        public  static string EditWishList(string text)
        {
            try
            {
                thescruffsterDataContext db = new thescruffsterDataContext();
                if (!String.IsNullOrEmpty(text))
                {
                    // this satisfies GetBrownley()
                    SecretSantaData ssData = new SecretSantaData();
                    var uid = ssData.GetUserID();
                    var ss = db.SecretSantas.SingleOrDefault(x => x.UserID == uid);                   
                    var brownleyRow = db.Brownleys.SingleOrDefault(x => x.Name == ss.Name);
                    brownleyRow.WishList = text;
                    

                    try
                    {
                        brownleyRow.WishList = text;
                        db.SubmitChanges();
                        text = brownleyRow.WishList;
                    }

                    catch (Exception dbex) { return "Error: " + dbex.Message.ToString(); }

                    //if brownley is already chosen, find their secret santa and send an email
                    //containing wish list


                    if (brownleyRow.IsChosen)
                    {
                        var ssEmail = db.SecretSantas.SingleOrDefault(x => x.BrownleyID == brownleyRow.BrownleyID).Email;
                        var ssName = db.SecretSantas.SingleOrDefault(x => x.BrownleyID == brownleyRow.BrownleyID).Name;
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
                        message.Body = <span style='padding:10px'>Hi " + ssName + "! " + brownleyRow.Name + " has updated their wish list:</span>
                        You can also login to your account to view: <a href=''>Brownley Secret Santa</a>
                        Merry Christmas!
                        secretsanta@thescruffster.com
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
                    message.Body = except.StackTrace 
                    mailClient.Send(message);
                    message.Dispose();
                }

            }
            return text;
        }
           </code>
            </pre>
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

                    message.Subject = "Secret Santa Edit WishList Error";
                    message.From = mailFrom;
                    message.Body = except.StackTrace
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