<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pictures.aspx.cs" Inherits="thescruffster.reunion.pictures" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>First Colonial Class of 88 20 Year Reunion </title>
    <link rel="StyleSheet" href="../styles.css" type="text/css" />
    
      <script language="javascript" type="text/javascript">
    <!--
     
     function EnlargeMe(img)
        {
         
       var originalImg = img.replace("b","");
       var crl=   document.getElementById('EnlargedImg');
       crl.src=originalImg;
       var relimgPath = originalImg.substring(originalImg.lastIndexOf("/") +1);
     // alert(relimgPath);             
       CallServerMethod(relimgPath)
      
       

}
function next()
{
 var crl=   document.getElementById("<%=EnlargedImg.ClientID %>");
 var imgPath = crl.src;
 var getSlash = imgPath.lastIndexOf("/") + 5
 var number = imgPath.substring(getSlash,imgPath.indexOf(".jpg"))
 var newnumber  = parseFloat(number);
 newnumber=newnumber+1
  if (newnumber == "558")
    {
        newnumber="508";
 
    }
 var newimgPath = imgPath.replace(number,"0" + newnumber)
 var relimgPath = newimgPath.substring(imgPath.lastIndexOf("/") +1);
 crl.src=newimgPath;
 CallServerMethod(relimgPath)

   }
    
  function CallServerMethod(relimgPath)
  {
  
  // call server side method
 PageMethods.SetCaption(relimgPath,CallSuccess, CallFailed);
 
 // set the destination label with the caption
   function CallSuccess(res)
   { 
   var dest = document.getElementById("caption");
   dest.innerHTML = res;

   }
   // alert message on some failure
   function CallFailed(res)
   {
   alert(res.get_message());
   }  
  
  } 
      

function previous()
{
 var crl=   document.getElementById('EnlargedImg');
 //alert(crl.src);
 var imgPath = crl.src;
 var getSlash = imgPath.lastIndexOf("/") + 5
 var number = imgPath.substring(getSlash,imgPath.indexOf(".jpg"))
var newnumber  = parseFloat(number);
newnumber=newnumber-1
 if (newnumber == "507")
 {
        newnumber="557";
 
 }
 var newimgPath = imgPath.replace(number,"0" + newnumber)
 crl.src=newimgPath;
var relimgPath = newimgPath.substring(imgPath.lastIndexOf("/") +1);
crl.src=newimgPath
CallServerMethod(relimgPath)
}
//-->
</script>
     
</head>
<body class="bg" >
    <form id="form1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
        <div class="wrapper">       
        <div class="mainhome"> 
            <div class="calendar">
               <div runat="server" id="divmonth" class="month">                
                </div>
                <div runat="server" id="divday" class="day">        
                </div>                            
            </div>                                       
        </div> 
         <span  class="loginview" >
                <asp:LoginView runat="server" ID="vwLogin" >
                 <LoggedInTemplate>                                        
                           Hi, <asp:LoginName ID="loginName1" runat="server" Visible="true" />  <br />                                       
                            <asp:LoginStatus ID="LoginStatus1" runat="server" Visible="true"
                            LogoutPageUrl="~/default.aspx"  LogoutAction="Redirect"  Font-Underline="true" />                                          
                  </LoggedInTemplate>
                </asp:LoginView>      
         </span>     
       <span class="scruffy"><img src="../images/scruff.jpg" alt="badass"   /></span>     
      
       <div class="maincontentb" >
        <div class="mainwrapper">
          
    <div  class="mainimage">
       
         <img runat="server" id="EnlargedImg"  class="displayed"/>
         <span class="navigate">  <a href="javascript:previous()" class="previous"><img src="../images/previous.jpg"  border="0" alt="previous" / ></a><a href="javascript:next()" class="next"><img src="../images/next.jpg"  border="0" alt="Next" id="nextImg"/ ></a>
         </span>
         
    </div>
    
   <asp:UpdatePanel runat="server"  UpdateMode="Always"  RenderMode="Inline" ID="upcaption">
    <ContentTemplate>
        <div id="caption" runat="server" class="description"></div>
    </ContentTemplate>
    </asp:UpdatePanel>
    <div class="container">
    <div>
    <img OnClick="javascript: EnlargeMe(this.src)"   runat="server" class="thumbs" src="~/images/IMG_0508b.jpg"  /><img onclick="return EnlargeMe(this.src)"  runat="server" class="thumbs" src="../images/IMG_0509b.jpg" /><img OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0510b.jpg" /><img OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0511b.jpg" /><img OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0512b.jpg" /><img OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0513b.jpg" /><img id="Img1" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0514b.jpg" /><img id="Img2" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0515b.jpg" /><img id="Img3" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0516b.jpg" />
    </div>
     <div>
   <img OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0517b.jpg" /><img OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0518b.jpg" /><img OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0519b.jpg" /><img id="Img4" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0520b.jpg" /><img id="Img5" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0521b.jpg" /><img id="Img6" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0522b.jpg" /><img id="Img24" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0523b.jpg" /><img id="Img25" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0524b.jpg" /><img id="Img26" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0525b.jpg" />
    </div>
    <div>  
      <img id="Img7" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0526b.jpg" /><img id="Img8" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0527b.jpg" /><img id="Img9" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0528b.jpg" /><img id="Img10" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0529b.jpg" /><img id="Img11" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0530b.jpg" /><img id="Img12" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0531b.jpg" /><img id="Img27" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0532b.jpg" /><img id="Img28" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0533b.jpg" /><img id="Img29" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0534b.jpg" />
    </div>   
     <div>
  <img OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0535b.jpg" /><img OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0536b.jpg" /><img OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0537b.jpg" /><img id="Img13" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0538b.jpg" /><img id="Img14" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0539b.jpg" /><img id="Img15" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0540b.jpg" /><img id="Img30" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0541b.jpg" /><img id="Img31" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0542b.jpg" /><img id="Img32" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0543b.jpg" />
   </div>
    <div>
     <img id="Img16" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0544b.jpg" /><img id="Img17" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0545b.jpg" /><img id="Img18" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0546b.jpg" /><img id="Img33" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0547b.jpg" /><img id="Img34" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0548b.jpg" /><img id="Img35" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0549b.jpg" /><img id="Img19" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0550b.jpg" /><img id="Img20" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0551b.jpg" /><img id="Img21" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0552b.jpg" />
    </div>    
     <div>   
    <img id="Img36" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0553b.jpg" /><img id="Img37" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0554b.jpg" /><img id="Img38" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0555b.jpg" /><img id="Img22" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0556b.jpg" /><img id="Img23" OnClick="javascript: EnlargeMe(this.src)"  runat="server" class="thumbs" src="~/images/IMG_0557b.jpg" />
    </div>   
    </div>
   </div>  
   </div> 
   </div>
    </form>
</body>
</html>
