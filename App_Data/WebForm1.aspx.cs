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
             string username = txtusername.Text;
             string password = "christmas";
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
            lblmessage.Text = "Password successfully reset to : " + password;
        }
    }
}
