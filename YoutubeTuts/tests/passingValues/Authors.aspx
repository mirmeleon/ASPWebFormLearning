<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Authors.aspx.cs" Inherits="passingValues.Authors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookShopSystemConnectionString %>" SelectCommand="SELECT * FROM [Authors]"></asp:SqlDataSource>
            <br/>
            <asp:DataGrid ID="DataGrid1" runat="server" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:ButtonColumn>
                      
                    </asp:ButtonColumn>
                </Columns>
            </asp:DataGrid>
            <br/>
            <br/>
            <asp:GridView ID="grAuthors" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="false" ReadOnly="true" SortExpression="Id" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                </Columns>
            </asp:GridView>
            
            
        </div>
        <br/>
            <br/>
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="FirstName" DataValueField="Id"></asp:DropDownList>
        </div>
        <br/><h3> Data object e displaynata po-dolu</h3>
        <br/>
        <div>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllAuthors" TypeName="passingValues.AuthorsDataAccessLayer"></asp:ObjectDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                </Columns>
            </asp:GridView>
        </div>
      
    </form>
</body>
</html>
