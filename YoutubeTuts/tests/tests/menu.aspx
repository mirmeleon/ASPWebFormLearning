<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="tests.menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>menu</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
    <style>
      .kvadrat{
          border: 3px solid blue;
      }

      .up{
          display:block;
          width:30px;
          height:30px;
      }

      .down{
          display:block;
          width:30px;
          height:30px;
      }
    </style>

    <form id="form1" runat="server">
        <div>
            <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal">
                <Items>
                    <asp:MenuItem NavigateUrl="menu.aspx" Text="Home" Value="Home"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="products.aspx" Text="Products" Value="Products"></asp:MenuItem>
                </Items>

            </asp:Menu>
          <ul class="top">
  <li><a href="#">Menu1</a></li>
  <li>
    <a href="#">Menu2</a>
    <ul class="sub">
      <li><a href="#">SubMenu1</a></li>
      <li>
        <a href="#">SubMenu2</a>
        <ul class="subsub">
          <li><a href="~/products.aspx">producst</a></li>
          <li><a href="#">SubSubMenu2</a></li>
        </ul>
      </li>
     
    </ul>
  </li>
  <li><a href="#">Menu3</a></li>
</ul>

           <button onclick="showContent()"> <img src="https://d30y9cdsu7xlg0.cloudfront.net/png/35-200.png" class="up" ></button>
            <img src="https://image.freepik.com/free-icon/arrow-pointing-to-right_318-50470.jpg" class="down" onclick="hideContent()">
            <div class="kvadrat">
                inofoto na kvadrata
            </div>
    </form>
  
 <script>
     $(document).ready(function () {
         $("ul.top li").hover(function () { //When trigger is hovered...
             $(this).children("ul.sub").slideDown('fast');
         }, function () {
             $(this).children("ul.sub").slideUp('slow');
             });


     });


     function hideContent() {
         $('.kvadrat').hide();
         $(s.up').hide();
         $('down').show();
     }

     function showContent() {
         $('.kvadrat').show();
         $('down').hide();
         $('up').show();
     }
 </script>
    
</body>
</html>
