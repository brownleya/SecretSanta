<%@ Page Language="C#"  Async="true" AutoEventWireup="true" CodeBehind="shhhh.aspx.cs" Inherits="thescruffster.secretsanta.shhhh" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Badass Santa</title>
    <link href="../styles/secretsanta.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .spinbutton
        {
            width: 250px;
            margin-top: 15px;
            margin-bottom: 50px;
            margin-left: 250px;
        }
    </style>


    <script src="../scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../scripts/jquery.lettering-0.6.1.min.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">


        $(document).ready(function () {

            $("#logo").lettering();           

            $("#santa").animate({

                marginTop: "75px"

            }, 1500);
        });
        function ViewHistory() {

            PageMethods.ViewHistory(onView);

            $("#txtWishHistory").animate({
                width: "190px",
                height: "60px"
            }, 500);
        }
        function ViewHistory2010() {

            PageMethods.ViewHistory2010(onView2010);

            $("#txtWishHistory").animate({
                width: "190px",
                height: "60px"
            }, 500);
        }
        function ViewHistory2011() {

            PageMethods.ViewHistory2011(onView2011);

            $("#txtWishHistory").animate({
                width: "190px",
                height: "60px"
            }, 500);
        }

        function ViewHistory2012() {

            PageMethods.ViewHistory2012(onView2012);

            $("#txtWishHistory").animate({
                width: "190px",
                height: "60px"
            }, 500);
        }
        function enableAutoSave() {

            _myTimerID = window.setInterval(__doAutoSave, 7000);
        }

        function __doAutoSave() {
            var lbl = document.getElementById("<%= lblAnimatedWheel.ClientID %>");
            var b = document.getElementById("<%= btnChoose.ClientID %>");
            lbl.innerHTML = "<img src='../styles/spinning.gif' border='0' />";
            b.disabled = true;

            PageMethods.AutoSave(onComplete);
        }
        function onComplete(results) {
            var b = document.getElementById("<%= btnChoose.ClientID %>");
            var lbl = document.getElementById("<%= lblAnimatedWheel.ClientID %>");
            var pnl = document.getElementById("wheelcontainer");
            var histPnl = document.getElementById("<%=historyPanel.ClientID %>");


            if (results == null) {
                lbl.innerHTML = "<img src='../styles/spinning.gif' border='0' />";
                b.disabled = true;
                return;
            }

            else {
                // clearInterval(_myTimerID);
                lbl.innerHTML = results;
                pnl.style.marginTop = "10px";
                pnl.style.marginLeft = "auto";
                pnl.style.marginRight = "auto";
                pnl.style.width = "400px";
                pnl.style.border = "solid";
                pnl.style.borderWidth = "1pt";
                pnl.style.borderColor = "#e0c14d";
                pnl.style.height = "auto";
                pnl.style.padding = "10px";
                pnl.style.textAlign = "left";
                b.disabled = false;
                return;
            }
        }

        function edit() {


            var lblEdit = document.getElementById("editlabel");
            lblEdit.innerHTML = "";

            var editImage = document.getElementById("<%= btnEditMyWish.ClientID %>");
            editImage.setAttribute("src", "../styles/add_pressed.jpg");

            var txtbox = document.getElementById("<%= txtWishList.ClientID %>");
            var text = txtbox.value;

           
            PageMethods.EditWishList(text, onEdit, onEditFailed);
        }
        function onEdit(results) {

            var txtbox = document.getElementById("<%= txtWishList.ClientID %>");
            txtbox.value = results;

            var lblEdit = document.getElementById("editlabel");
            lblEdit.innerHTML = "";

            if (results == "Error") {
                lblEdit.innerHTML = "failed to update wishlist. please try again";
            }
            else {


                $('#editlabel').text("wish list successfully updated").fadeIn('5',function(){});
               
           
            }

            var editImage = document.getElementById("<%= btnEditMyWish.ClientID %>");
            editImage.setAttribute("src", "../styles/add.jpg");

        }

        function onEditFailed(error, userContext) {

            //  alert(error);

        }
        function View() {

            PageMethods.ViewHistory(onView);
        }

        function onView(results) {

            var txtboxhist = document.getElementById("<%= txtWishHistory.ClientID %>");
            txtboxhist.setAttribute("class", "lblWishHistory");

            //IE 7
            txtboxhist.setAttribute("className", "lblWishHistory");
            txtboxhist.innerHTML = results;

        }
        function onView2010(results) {

            var txtboxhist = document.getElementById("<%= txtWishHistory.ClientID %>");
            txtboxhist.setAttribute("class", "lblWishHistory");

            //IE 7
            txtboxhist.setAttribute("className", "lblWishHistory");
            txtboxhist.innerHTML = results;

        }

        function onView2011(results) {

            var txtboxhist = document.getElementById("<%= txtWishHistory.ClientID %>");
            txtboxhist.setAttribute("class", "lblWishHistory");

            //IE 7
            txtboxhist.setAttribute("className", "lblWishHistory");
            txtboxhist.innerHTML = results;

        }

        function onView2012(results) {

            var txtboxhist = document.getElementById("<%= txtWishHistory.ClientID %>");
            txtboxhist.setAttribute("class", "lblWishHistory");

            //IE 7
            txtboxhist.setAttribute("className", "lblWishHistory");
            txtboxhist.innerHTML = results;

        }                         
 
   </script>
</head>
<body>

    <form id="form1" runat="server">   
    <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true"
     EnablePartialRendering="true" runat="server">
     
    </asp:ScriptManager>
  
    <script language="javascript" type="text/javascript">
        
    </script>
   <div style="top:20px; left:10px; position:absolute ">
        <asp:LoginView runat="server" ID="vwLogin">
            <LoggedInTemplate>
                <fieldset style=" font-family: Arial; font-size: 10pt; color: #410505;
                    border: solid 1pt #161849  ;width: 175px; padding:10px; background-color:white">
                    <asp:Table ID="Table1" runat="server">
                        <asp:TableRow ID="Tablerow1" runat="server">
                            <asp:TableCell>
                                Merry Christmas
                                <span id="loginname" runat="server"></span>
                              <%--  <asp:LoginName ID="loginName1" runat="server" Visible="true"  />--%>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell>
                                <asp:HyperLink ID="HyperLink2" NavigateUrl="" runat="server" Font-Underline="true">Change Password</asp:HyperLink></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:LoginStatus ID="LoginStatus1" runat="server" Visible="true" LogoutPageUrl="~/secretsanta/default.aspx"
                                    LogoutAction="Redirect" Font-Underline="true" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </fieldset>
            </LoggedInTemplate>
        </asp:LoginView>
    </div>
    <div id="wrapper">
        <img alt="" src="../styles/rc1.jpg" style="vertical-align: top;" />
        <img alt="" src="../styles/rc2.jpg" style="vertical-align: top; margin-left: 718px; " />
        
        <div id="main">
         <div class="calendar">
               <div runat="server" id="divmonth" class="month">                
                </div>
                <div runat="server" id="divday" class="day">        
                </div>                
            </div> 
           <%-- <div style="float:right">when and where</div>   --%> 
        <img src="../styles/santahat.png" id="santa" style="position:absolute;
             z-index:10;left:420px; margin-top:-150px" alt="badass santa" title="badass santa"/> 
          <span id="logo">secretsanta</span>
         
        </div>      

        <asp:UpdatePanel runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false"
            ID="UpdatePanel1">
            
            <ContentTemplate>
              <div style="width: 700px; 
                    position:relative; margin-top: 0px; margin-left:auto; margin-right:auto">
                    <div style ="font-family :Arial;  color:Blue; width :550px; text-align :center ;
                         margin-left :auto; margin-right :auto;" id="welcomeMsg" runat="server">
                  </div>
                    <div id="Div1" runat="server" style="width: 500px;  margin-left :auto; 
                        margin-right:auto;">
                       <div id="wheelcontainer" runat="server" style="margin-top: 0px; 
                            margin-left: 0px; height:auto;">
                             <span runat="server" visible="false" id="lblMyAccount" 
                             style="color:#b91d10; font-weight:bold;  font-family:Arial;                                 
                             margin-left:20px; "> My Account</span> 
                             <div class='statuspanel' runat ="server" id='accountpanel' visible="false">
                            
                                <div class='gift'>
                                    Your Gift Recipient:
                                </div>
                                <div class='brownleydata' runat ="server" id='recepientname'>
                                </div>
                                <div class='wish' runat ='server' id='recepientwishlabel'>
                                </div>                                
                                <div class='wishdata'  runat ='server' id='recepientwishdata'> 
                                </div> 
                            </div>
                           
                            <div class='mypanel' id='mywishpanel' runat ='server' visible ='false'>
                                <div class='mywish'>
                                    My Wish List:
                                </div>
                                 
                                <div class='mywishdata' runat ='server' id='mydata'>
                                <span ><img   alt="merry christmas" src="../styles/bow.jpg" border="0" 
                                style="margin-top:-24px; margin-left:-5px; z-index:1000; position:absolute"/></span>
                                <asp:TextBox runat="server"  ID="txtWishList" 
                                TextMode="MultiLine" ></asp:TextBox>
                             
                              <asp:ImageButton runat="server" ID="btnEditMyWish" AlternateText="update wishlist" ImageUrl="~/styles/add.jpg"  OnClientClick="edit()" />
                               <asp:UpdateProgress runat="server" ID="UpdateProgress1" DisplayAfter="1000" >
                               <ProgressTemplate>
                                <div class="hourglass" >
                                    <img src="../styles/Hourglass_icon.gif" id="Img1" alt="Processing" />
                                </div>
                               </ProgressTemplate>
                               </asp:UpdateProgress>
                           
                               </div>
                               
                            </div>
                            <div class='historypanel' id='historyPanel' runat ='server' visible ='false'>
                                <div style="margin-left:130px;">
                                    <span onclick="ViewHistory()" id="historyLink" runat="server" style=" float:right; 
                                    font-size:14px; color:Blue;position:absolute; cursor:pointer; 
                                    margin-left:20px; margin-top:20px; ">
                                 View 2009                                     
                                    </span>
                                     <span onclick="ViewHistory2010()" id="Span1" runat="server" style="  
                                         font-size:14px; color:Blue;position:absolute; cursor:pointer; 
                                         margin-left:20px; margin-top:40px; ">
                                 View 2010                                     
                                    </span>
                                     <span onclick="ViewHistory2011()" id="Span2" runat="server" style="  
                                         font-size:14px; color:Blue;position:absolute; cursor:pointer; 
                                         margin-left:20px; margin-top:60px;">
                                 View 2011                                     
                                    </span>
                                      <span onclick="ViewHistory2012()" id="Span3" runat="server" style="  
                                         font-size:14px; color:Blue;position:absolute; cursor:pointer; 
                                         margin-left:20px; margin-top:80px;">
                                 View 2012                                    
                                    </span>
                               </div>
                                <div class='wishhistory'>
                                   Wish List History: 
                                </div>                            
                                 <span runat="server" ID="txtWishHistory"></span>
                              
                            </div>
                            <span runat="server" id="lblAnimatedWheel" style="font-family: Arial; 
                                margin-left:0px;">
                                <img runat="server" id="staticImg" src="../styles/notspinning.gif" alt="spin" />
                            </span>
                           
                        </div>
                    </div>
                    <div style="margin-top: 10px; font-family: Arial; text-align: center; 
                        margin-left: auto;margin-right: auto; width: 400px; 
                        border: solid 1pt black; background-color: #EDDC1C;
                        visibility: hidden" id="pnlMessage" runat="server">
                        <span runat="server" id="message"></span>
                    </div>                    
                        <asp:Button  CssClass="spinbutton" ID="btnChoose"  runat="server" Text="My Account"
                        OnClick="spin" />
                </div>
            </ContentTemplate>
            <Triggers>
          
               <asp:AsyncPostBackTrigger ControlID="btnChoose"  />
               <%-- <asp:AsyncPostBackTrigger ControlID ="txtWishList" />--%>
                <%--<asp:AsyncPostBackTrigger ControlID="btnEditMyWish"  />--%>
               <%-- <asp:AsyncPostBackTrigger ControlID="historyLink" />--%>
             
           </Triggers>
        </asp:UpdatePanel>
          
     <span id="editlabel"  style="color:red; font-size:11px; position:absolute;
                font-style:italic;margin-top:-417px; margin-left:370px;" ></span>            
    </div>
    
    
     
    </form>

</body>
</html>
