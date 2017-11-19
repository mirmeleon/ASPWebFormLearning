<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="passingValues.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" method="post">
        <div>dd
            <asp:Table ID="Table1" runat="server">
              <asp:TableRow>
                   <asp:TableCell>
                       <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="https://www-assets.particle.io/images/Approved-Icons/checkInCircle.png?mtime=20160727114205" Height="80" Width="80" />
                   </asp:TableCell>
              </asp:TableRow>
                
                      <asp:TableRow>
                     <asp:TableCell>
                            <asp:Label ID="Label1" runat="server" Text="name"></asp:Label>
                         </asp:TableCell>
                   <asp:TableCell>
                  <asp:TextBox ID="tbName" runat="server"></asp:TextBox>
                       </asp:TableCell>
                  </asp:TableRow>

              <asp:TableRow>
                  <asp:TableCell>
                      <asp:Button ID="btnSubmit" runat="server" Text="Search" />
                  </asp:TableCell>
                  </asp:TableRow>
            </asp:Table>
            
        </div>
        <div class="result">
            <asp:GridView ID="gvBooks" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sqlBooksTable">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="EditionType" HeaderText="EditionType" SortExpression="EditionType" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Copies" HeaderText="Copies" SortExpression="Copies" />
                    <asp:BoundField DataField="ReleaseDate" HeaderText="ReleaseDate" SortExpression="ReleaseDate" />
                    <asp:BoundField DataField="AgeRestriction" HeaderText="AgeRestriction" SortExpression="AgeRestriction" />
                    <asp:BoundField DataField="Author_Id" HeaderText="Author_Id" SortExpression="Author_Id" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sqlBooksTable" runat="server" ConnectionString="<%$ ConnectionStrings:BookShopSystemConnectionString %>" SelectCommand="SELECT [Title], [EditionType], [Price], [Copies], [ReleaseDate], [AgeRestriction], [Author_Id] FROM [Books]"></asp:SqlDataSource>
            </div>
    </form>
</body>
</html>
