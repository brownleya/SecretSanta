<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manageusers.aspx.cs" Inherits="thescruffster.admin.manageusers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:CreateUserWizard ID="CreateUserWizard1" runat="server">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" />
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server" />
        </WizardSteps>
    </asp:CreateUserWizard>
    </div>
    <div>
   <asp:Panel runat="server" ID="RolesPanel" GroupingText="Create Roles">
    <span>Role: </span><asp:TextBox runat="server" ID="RoleTextBox"></asp:TextBox>
    <asp:Button runat="server" ID="RoleBtn" Text="Create New Role" 
           onclick="RoleBtn_Click" />
           <asp:Label runat="server" ID="RoleLbl" Font-Size="Small" ForeColor="Red"></asp:Label>
   </asp:Panel>
   
   <asp:Panel runat="server" ID="RoleManagePanel" GroupingText="Manage Roles">    
        Enter UserName: 
        <asp:TextBox ID="TxtUserName" runat="server"></asp:TextBox>
        <asp:Button ID="LookupBtn" runat="server" Text="Search" OnClick="LookupBtn_Click" />   
    <div >

        <asp:CheckBoxList ID="RoleList" runat="server"  >
        </asp:CheckBoxList>
    </div>
    <div>
        <asp:button ID="UpdateBtn" text="Update" Visible="false" runat="server" OnClick="UpdateBtn_Click" />
    </div>
    <asp:Label runat="server" ID="ROleMgrLbl" Font-Size="Small" ForeColor="Red"></asp:Label>
   </asp:Panel>    
    </div>
   
    </form>
  
</body>
</html>
