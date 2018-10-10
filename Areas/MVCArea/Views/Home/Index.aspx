<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Badass Santa</title>
    <%--<link href="../styles/secretsanta.css" rel="stylesheet" type="text/css" />
    <script src="../scripts/jquery-1.4.1.js" type="text/javascript"></script>
     <script src="../scripts/jquery.lettering-0.6.1.min.js" type="text/javascript"></script>--%>
  
    <link href="../../../../styles/secretsanta.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery.lettering-0.6.1.min.js"></script>
        <script type="text/javascript">

        $(document).ready(function () {

            $("#logo").lettering();

            $("#santa").animate({

                marginTop: "75px"

            }, 1500);
        });      
    </script>
</head>
<body>
    <div>
        <img src="../../../../styles/santahat.png" id="santa" style="position:absolute; z-index:10;left:420px; margin-top:-150px" alt="badass santa" title="badass santa"/> 
         <span id="logo">secretsanta</span>   
        
        
    </div>
</body>
</html>
