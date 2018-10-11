<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="thescruffster.error" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>thescruffster.com</title>
   <link rel="StyleSheet" href="styles.css" type="text/css" />
</head>
<body class="bg" >
    <form id="form1" runat="server">
    <div class="wrapper">       
        <div class="mainhome"> 
            <div class="calendar">
               <div runat="server" id="divmonth" class="month">                
                </div>
                <div runat="server" id="divday" class="day">        
                </div>                
            </div>                             
        </div> 
        <span class="scruffy"><img src="../images/scruff.jpg" alt="badass"   /> </span>       
       <div class="maincontent" > 
        <span  style="color:Black; font-family:arial; font-size:16px; text-align:center; position:absolute;margin-left:25px">
         I'm sorry, but the webserver returned an error. Please try again and if the problem persists please let <a href="mailto:angelabrownley@yahoo.com">me</a> know. Thanks.
        </span>      
         <div>
    </div>
    </div>
    </form>
</body>
</html>
