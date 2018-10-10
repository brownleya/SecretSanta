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
using System.Configuration.Provider;

namespace thescruffster.admin
{
    public partial class manageusers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RoleBtn_Click(object sender, EventArgs e)
        {
            try
            {
                // String[] roles = Roles.GetAllRoles();

                String newrole = RoleTextBox.Text.ToString();

                if (Roles.RoleExists(newrole))
                {
                    RoleLbl.Text = "Role " + newrole + " already exists!";
                    return;


                }

                else
                {

                    try
                    {
                        Roles.CreateRole(newrole);
                        RoleLbl.Text = "Role " + newrole + " successfully created";
                        return;
                    }

                    catch (ProviderException ex)
                    {
                        //throw ex;
                        RoleLbl.Text = ex.ToString();
                    }



                }

            }
            catch (Exception exc)
            {
                RoleLbl.Text = exc.ToString();

            }

        }
          public void PopulateRoleList(string userName) 
        
        { 
    
            RoleList.Items.Clear(); 
            
            string[] roleNames;        
            
            roleNames = Roles.GetAllRoles(); 
            
            foreach ( string roleName in roleNames) { 
                
                ListItem roleListItem = new ListItem();                 
                roleListItem.Text = roleName;                 
                roleListItem.Selected = Roles.IsUserInRole(userName, roleName);  
                RoleList.Items.Add(roleListItem);    
                
            } 
            
        } 

        public void UpdateRolesFromList(){   

            foreach (ListItem roleListItem in RoleList.Items)
            { 
            
            string roleName = roleListItem.Value;             
            string userName = TxtUserName.Text;             
            bool enableRole = roleListItem.Selected;       
            
            if ((enableRole == true) & (Roles.IsUserInRole(userName, roleName) == false)) { 
                
                Roles.AddUserToRole(userName, roleName); 
                 ROleMgrLbl.Text+= userName + " added to " + roleName + "<br>" ;

            } 
            
            else if ((enableRole == false) & (Roles.IsUserInRole(userName, roleName) == true)) { 
                
            Roles.RemoveUserFromRole(userName, roleName);
            ROleMgrLbl.Text += userName + " removed from " + roleName + "<br>";
                
                }        
             }       
    
        }

        public void LookupBtn_Click(object sender, System.EventArgs e)
        {

            PopulateRoleList(TxtUserName.Text);
            UpdateBtn.Visible = true;

        }

        public void UpdateBtn_Click(object sender, System.EventArgs e)
        {

            UpdateRolesFromList();
            PopulateRoleList(TxtUserName.Text);

           

        } 
    }

  }
    

