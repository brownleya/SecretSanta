<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="thescruffster.secretsanta._default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Badass Santa</title>
    <link href="../styles/secretsanta.css" rel="stylesheet" type="text/css" />
    <script src="../scripts/jquery-1.9.1.js" type="text/javascript"></script>
     <script src="../scripts/jquery.lettering-0.6.1.min.js" type="text/javascript"></script>
    <link href="../Content/bootstrap.css" />
    <script src="../scripts/bootstrap.js" type="text/javascript"> </script>
 

  <script language="javascript" type="text/javascript">

        $(document).ready(function() {

        $("#logo").lettering();


        $("#santa").animate({
            
            marginTop: "75px"         

        }, 1500);
});
</script>
</head>
<body>
    <form id="form1" runat="server">  
    <div id="wrapper">
        <%--<img alt="" src="../styles/rc1.jpg" style="vertical-align: top" />
        <img alt="" src="../styles/rc2.jpg" style="vertical-align: top; margin-left: 718px;" />--%>
        <div id="main">
         <div class="calendar">
               <div runat="server" id="divmonth" class="month">                
                </div>
                <div runat="server" id="divday" class="day">        
                </div>                
            </div>      
        <img src="../styles/santahat.png" id="santa" style="position:absolute; z-index:10;left:420px; margin-top:-150px" alt="badass santa" title="badass santa"/> 
          <span id="logo">secretsanta</span>        
        </div>
          <div style="width: 350px; height: 226px; float: right;
               margin-right: 5px; font-family: arial; margin-top:25px;">
                <asp:Login ID="Login1" runat="server" OnLoggingIn="Login1_OnLoggingIn" OnLoginError="Login1_OnLoginError"
                    LoginButtonType="Button"  CssClass="login"  >
                    <LayoutTemplate>
                        <div style="margin-top: 15px; margin-left: 38px; height :30px; color: #0C1B74;
                             font-weight: bold">
                            Login to your Secret Santa Account
                          </div>
                        <asp:Panel  runat="server" ID="pnlREgistered" DefaultButton="LoginButton" Height="125px">
                            <div style="margin-bottom: 6px;">
                                <asp:Label CssClass="lbl" ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Email: </asp:Label>
                                <asp:TextBox ID="UserName" runat="server" CausesValidation="false" Height="20px"
                                    Width="175px" BorderColor="#0C1B74" BorderWidth="1pt"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="LoginUserNameRequired" runat="server" ControlToValidate="UserName"
                                    ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            </div>
                            <div style="margin-bottom: 6px;">
                                <asp:Label CssClass="lbl" ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password: </asp:Label>
                                <asp:TextBox ID="Password" runat="server" Height="20px" Width="175px" BorderColor="#0C1B74"
                                    BorderWidth="1pt" TextMode="Password" CausesValidation="false"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="LoginPasswordRequired" runat="server" ControlToValidate="Password"
                                    ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            </div>
                            <div style="margin-left: 265px">
                                <asp:HyperLink runat="server" ID="linkForgot" Text="Forgot?" NavigateUrl="~/WebForm1.aspx"
                                    Font-Size="Smaller" ForeColor="red"></asp:HyperLink>
                            </div>
                            <div style="margin-top: 10px; margin-left: 168px">
                                <asp:Button ID="LoginButton" CssClass="btn" runat="server" CommandName="Login" Text="SIGN IN"
                                    CausesValidation="True" ValidationGroup="Login1" UseSubmitBehavior="false" />
                            </div>
                           
                        </asp:Panel>  
                         <div>
                                <asp:Label runat="server" ID="lblError" ForeColor="red"></asp:Label>
                            </div>                     
                    </LayoutTemplate>
                </asp:Login>
            </div>
      <div style="width: 370px; height: 300px; background-color: #ffffff; margin-top: 25px;
            margin-left: 0px;">
            <table style="border: solid 1pt #C93102; margin-left: 10px;">
                <tr>
                    <td >
                        <table border="0" style="font-family: Arial; margin-right: auto; margin-top: 5px;">
                            <tr style="height: 30px">
                                <td align="center" colspan="2" style="color: #0C1B74; font-weight: bold">
                                    Create your Secret Santa Account
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="color: #BB1605; border: solid 1pt #E7C924">
                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">Email:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Email" runat="server" BorderColor="#0C1B74" BorderWidth="1pt" Height="20px"
                                        Width="175px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Email"
                                        ErrorMessage="User Name is required." ToolTip="User Name is required.">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="color: #BB1605; border: solid 1pt #E7C924">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">(min 6 char) Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" BorderColor="#0C1B74"
                                        BorderWidth="1pt" Height="20px" Width="175px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                        ErrorMessage="Password is required." ToolTip="Password is required.">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="color: #BB1605; border: solid 1pt #E7C924">
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" BorderColor="#0C1B74"
                                        BorderWidth="1pt" Height="20px" Width="175px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                        ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required.">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="font-size:small">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                        ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."></asp:CompareValidator>
                                </td>
                            </tr>                      
                            <tr>
                                <td colspan="2" align="center">
                                    <asp:Button ID="CreateUserButton" CssClass="btn" Text="REGISTER" Enabled="false" OnClick="CreateUser_OnClick"
                                        runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
          
            <div style="color: Red; font-family: arial; width: 700px; text-align: center; margin-left: auto;
                margin-right: auto">
                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
            </div>
        </div>
    </div>   
    </form>
</body>
</html>
