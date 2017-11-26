<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="09.RegisterScript.aspx.cs" Inherits="WebFormsWithJs._09_RegisterScript" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" onkeyup="getCharachterCount();" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="Label1" runat="server" ></asp:Label>
             <asp:TextBox ID="TextBox2" ClientIDMode="Static" runat="server"></asp:TextBox>
            <script>
                document.getelementById('<%=TextBox2.ClientID%>>');
            </script>
        </div>
    </form>
</body>
</html>
