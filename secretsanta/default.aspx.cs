using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using thescruffster.DAL;
using System.Threading;

namespace thescruffster.secretsanta
{
    public partial class _default : System.Web.UI.Page
    {
               
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {                             
                TextBox username = (TextBox)Login1.FindControl("UserName");
                username.Focus();

                int month = DateTime.Today.Month;
                int day = DateTime.Today.Day;
                SetCalendar(day, month);
            }
        }

        public void SetCalendar(int day, int month)
        {
            //convert day and month int to string to add to div
            string strMonth= Convert.ToString(month);
            string strDay =  Convert.ToString(day);
            switch (strMonth)
            {                    
                case "1":
                    strMonth="Jan";
                     break;
                case "2":
                    strMonth="Feb";
                    break;
                case "3":
                    strMonth="Mar";
                    break;
                case "4":
                    strMonth="Apr";
                    break;
                case "5":
                    strMonth="May";
                    break;
                case "6":
                    strMonth="Jun";
                    break;
                case "7":
                    strMonth="Jul";
                    break;
                case "8":
                    strMonth="Aug";
                    break;
                case"9":
                    strMonth="Sep";
                    break;
                case "10":
                    strMonth="Oct";
                    break;
                case "11":
                    strMonth="Nov";
                    break;
                case "12":
                    strMonth="Dec";
                    break;
                 }
                    divmonth.InnerText=strMonth;
                    divday.InnerText= strDay;
            }
        
        private bool UserExists(string username)
        {
            if (Membership.GetUser(username) != null) { return true; }
            return false;
        }

        protected void CreateUser_OnClick(object sender, EventArgs e)
        {
            try
            {
                using (var dbEntities = new thescruffsterDataContext())
                {
                    //check to make sure the email address is valid
                    var query = from row in dbEntities.SecretSantas select row;
                    foreach (var secretsanta in query)
                    {
                        if (secretsanta.Email == Email.Text.ToLower().Trim())
                        {
                            // if email is valid
                            //check if brownley already registered

                            if (UserExists(Email.Text.ToLower().Trim())) { ErrorMessage.Text = "That account already exists. Login to the right to access your secret santa account."; return; }
                            else
                            {
                                //create secret santa account
                                MembershipUser newUser = Membership.CreateUser(Email.Text.Trim(), Password.Text.Trim());
                                Guid uid = (Guid)newUser.ProviderUserKey;
                                Roles.AddUserToRole(Email.Text.Trim(), "secretsanta");
                                secretsanta.UserID = uid;
                                dbEntities.SubmitChanges();
                                if (Membership.ValidateUser(Email.Text.Trim(), Password.Text.Trim()))
                                { //login newly created user
                                    FormsAuthentication.RedirectFromLoginPage(Email.Text.Trim(), false);
                                }
                                Response.Redirect("~/secretsanta/shhhh.aspx");
                            }
                        }
                    }
                    //entered invalid email address
                    ErrorMessage.Text = "You entered an invalid email address. Is there another email address?";
                    return;
                }
            }
            catch (MembershipCreateUserException mce)
            {
                string pwdError = mce.StatusCode.ToString();
                ErrorMessage.Text = pwdError;
                return;
            }
            catch (Exception ex) { ErrorMessage.Text = ex.Message.ToString(); }
        }
        

        protected void Login1_OnLoggingIn(object sender, LoginCancelEventArgs e)
        {
            try
            {
                Label lblError = (Label)Login1.FindControl("lblError");
                TextBox Uname = (TextBox)Login1.FindControl("UserName");

                if ((UserExists(Uname.Text.Trim()) && (Roles.IsUserInRole(Uname.Text, "secretsanta") == true)))
                {
                    Login1.DestinationPageUrl = "~/secretsanta/shhhh.aspx";
                }

                else
                {
                    Login1.DestinationPageUrl = "~/secretsanta/default.aspx";
                    lblError.Text = "Your account is not registered. Did you forget to register to the left?";
                }
            }

            catch (Exception ex) { LogError(ex.Message.ToString()); }
        }
        
        protected void Login1_OnLoggedIn(object sender, EventArgs e)  { }

        protected void Login1_OnLoginError(Object sender, EventArgs e)
        {
            try
            {
                Label lblError = (Label)Login1.FindControl("lblError");
                TextBox UserName = (TextBox)Login1.FindControl("UserName");
                String uname = Login1.UserName;
                MembershipUser mu = Membership.GetUser(uname);

                if (mu == null)
                {
                    lblError.Text = "Username " + Login1.UserName + " not found";
                    UserName.Focus();             
                     return;
                }

                if (mu.IsLockedOut)
                {
                    lblError.Visible = true;
                    lblError.Text = "You have been locked out of the site " +
                    "after too many failed password attempts.";
                    return;
                }

                else
                {
                    lblError.Text = Login1.FailureText;
                    return;
                }
            }
            catch (Exception ex)
            {
                LogError(ex.Message.ToString());
            }
        }

        public void LogError(string errorMsg)
        {
               
                MembershipUser user = Membership.GetUser();
                try
                {
                    using (var context = new thescruffsterDataContext())
                    {
                        Mishap m = new Mishap
                        {
                            Date = DateTime.Now,
                            Error = errorMsg,
                            UserName = user.UserName
                        };

                        context.Mishaps.InsertOnSubmit(m);
                        context.SubmitChanges();
                    }
                }

                catch (Exception except)
                {
                    Label lblError = (Label)Login1.FindControl("lblError");
                    lblError.Visible = true;
                    lblError.Text = except.Message.ToString();
                    return;
                }
        }
    }
}
   

