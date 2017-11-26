<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="02.JSDelRowGridView.aspx.cs" Inherits="WebFormsWithJs._02_JSDelRowGridView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sampleDbConnectionString %>" DeleteCommand="DELETE FROM [Employees] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Employees] ([Name], [Gender]) VALUES (@Name, @Gender)" SelectCommand="SELECT * FROM [Employees]" UpdateCommand="UPDATE [Employees] SET [Name] = @Name, [Gender] = @Gender WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Gender" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Gender" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
