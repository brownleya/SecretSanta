using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using thescruffster.DAL;
using System.Linq;
using System.Data.Linq;


namespace thescruffster
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                lblmessage.Text = "";
            }

            Form.DefaultButton = Button1.UniqueID;             
            txtusername.Focus();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
             string username = txtusername.Text.Trim();
             string password = Membership.GeneratePassword(6, 1);
             try
             {
                 MembershipUser mu = Membership.GetUser(username);

                 if (mu != null)
                 {
                     mu.ChangePassword(mu.ResetPassword(), password);
                 }

                 else
                 {
                     lblmessage.Text = "Username " + txtusername.Text + " could not be found";
                     return;
                 }
             }

             catch (MembershipPasswordException mpe)
             {
                 lblmessage.Text = mpe.Message.ToString();
                 return;
             }

             catch (Exception ex)
             {
                 lblmessage.Text = ex.Message.ToString();
                 return;
             }
            lblmessage.Text = "Password successfully reset to : " + "<b>" + password + "</b>";

            thescruffsterDataContext db = new thescruffsterDataContext();
            var name = db.SecretSantas.SingleOrDefault(x => x.Email == username).Name.Trim().ToLower();

          
          
            string nickname;
            switch (name)
            {
                case "tanja":
                    nickname = "Sistah";
                        break;
                case "christoph":
                        nickname = "Big Nasty";
                        break;
                case "jade":
                    nickname = "Love";
                    break;
                case "shelly":
                     nickname = "Sis in law";
                     break;
                case "delisa":
                    nickname = "Sis in law";
                    break;
                case "adam":
                     nickname = "Twin";
                     break;
                case "ray":
                     nickname = "Bro in law";
                     break;

                default:
                    nickname = name;
                    break;          

            }


          //  SendEmail(username, password, nickname);
        }

        private void SendEmail(string username, string password, string nickname)
        {
            try
            {
                System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
                System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient();
                var ssEmail = username;
                var ssPassword = password;

                System.Net.Mail.MailAddress mailFrom = new System.Net.Mail.MailAddress("secretsanta@thescruffster.com");
                System.Net.Mail.MailAddress mailTo = new System.Net.Mail.MailAddress(ssEmail);
                message.IsBodyHtml = true;
                message.To.Add(mailTo);

                if (!String.IsNullOrEmpty(ssEmail))
                {
                    message.Bcc.Add(new System.Net.Mail.MailAddress("angie@thescruffster.com"));
                }
                message.Subject = "Secret Santa Password Reset";
                message.From = mailFrom;
                message.Body = "<div style='width:585px; position:relative;height:auto;font-family:arial;font-size:12px'>" +
                "<div style='width:585px;height:137px'><img src='http://www.thescruffster.com/styles/santa_logo.jpg' border='0' /></div>" +
                "<div style='padding:20px;border:solid 1pt #952a20'>" +
                "<span style='padding:10px'>Hey " + nickname + "! Your new password was reset to:</span>" +
                "<div style='padding:10px'>" + password + "</div>" +
                "<div style='padding:10px;margin-bottom:10px'><a href='http://www.thescruffster.com/secretsanta'>Brownley Secret Santa</a></div>" +
                "<div style='padding:10px'>Merry Christmas!<br>" +
                "secretsanta@thescruffster.com</div>";
                mailClient.Send(message);
                message.Dispose();
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

                        message.Subject = "Secret Santa Password Reset Error";
                        message.From = mailFrom;
                        message.Body = "<div style='width:585px; position:relative;height:auto;font-family:arial;font-size:12px'>" +
                        except.StackTrace +
                        "</div>";
                        mailClient.Send(message);
                        message.Dispose();
                    }

                    catch (Exception ex)
                    {

                    }
                }

            }

        }
    }
}
