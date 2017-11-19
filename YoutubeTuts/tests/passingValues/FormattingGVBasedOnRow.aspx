<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormattingGVBasedOnRow.aspx.cs" Inherits="passingValues.FormattingGVBasedOnRow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/SiteStyle.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookShopSystemConnectionString %>" SelectCommand="SELECT * FROM [Employees]"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                    <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" ItemStyle-CssClass="displayNone" HeaderStyle-CssClass="displayNone"/>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
