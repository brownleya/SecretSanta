<%@ Page Language="C#" AutoEventWireup="true"   CodeBehind="WebForm1.aspx.cs" Inherits="thescruffster.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Reset Password</title>
</head>
<body style="font-family:Arial">
    <form runat="server" id="form1">
    <div class="reset">
        <asp:Label ID="Label2" runat="server" Font-Bold="true" Text="Reset My Password"></asp:Label><br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="UserName"></asp:Label>
        <asp:TextBox ID="txtusername" runat="server" Width="230px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="LoginPasswordRequired" runat="server" ControlToValidate="txtusername"
            ErrorMessage="*">*</asp:RequiredFieldValidator>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Reset" CssClass="btnReset" />
        <br />
        <asp:Label ID="lblmessage" runat="server"></asp:Label><br />
        <asp:HyperLink runat="server" ID="linkReturn" Text="Return to Login Page" NavigateUrl="~/secretsanta/default.aspx"></asp:HyperLink><br />
      
    </div>
    </form>
</body>
</html>
