<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComputerOrderForm.aspx.cs" Inherits="ComputerOrderForm.ComputerOrderForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Computer Order</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="OrderId" runat="server" Text="Order Id="></asp:Label>

        <br />
        <asp:Label ID="label7" runat="server" Text="Order Name:"></asp:Label>

    &nbsp;<asp:TextBox ID="OrderNameId" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Customer:"></asp:Label>
&nbsp;&nbsp;&nbsp;
&nbsp;<asp:TextBox ID="Customer" runat="server"></asp:TextBox>

        <br />
        <asp:Label ID="Label2" runat="server" Text="Customer Email:"></asp:Label>
&nbsp;<asp:TextBox ID="CustomerEmail" runat="server"></asp:TextBox>
        <br />
      
        <asp:Label ID="Label6" runat="server" Text="Delivery date:"></asp:Label>
&nbsp;<asp:Calendar ID="DeliveryDate" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
            <DayStyle BackColor="#CCCCCC" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
            <TodayDayStyle BackColor="#999999" ForeColor="White" />
        </asp:Calendar>
      
        <br />
        <asp:Label ID="Label4" runat="server" Text="Partida Number:"></asp:Label>
&nbsp;<asp:TextBox ID="PartNumber" runat="server" Width="80px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Rush:"></asp:Label>
&nbsp;
        <asp:RadioButton ID="RushYes" runat="server" GroupName="Rush" Text="Yes" />
&nbsp;<asp:RadioButton ID="RushNo" runat="server" Checked="True" GroupName="Rush" Text="No" />
        <br />
        <br />
        <asp:Button ID="Submit" runat="server" OnClick="Submit_Click" Text="ok" />
        <br />

    </div>
    </form>
</body>
</html>
