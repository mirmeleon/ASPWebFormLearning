<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="03.JsToSelectAllCheckbox.aspx.cs" Inherits="WebFormsWithJs._03_JsToSelectAllCheckbox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:CheckBox ID="checkBoxSelectAll" onclick="HeaderCheckBoxClicked(this)" runat="server" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" onclick=" SingleCheckBoxClicked(this)" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <HeaderTemplate>
                            
                            <asp:LinkButton ID="lbDeleteSelected" OnClick="lbDeleteSelected_Click" runat="server" CausesValidation="False" Text="Delete selected"></asp:LinkButton>
                       
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                </Columns>
            </asp:GridView>
            <script type="text/javascript" >

                function HeaderCheckBoxClicked(passedCheckbox) {
                    console.log('entered');
                    let gridView = document.getElementById("GridView1");
                    //minavame po vseki red na grid viewto; pochva ot 1 za da ne vkluchi headera
                    for (var i = 1; i < gridView.rows.length; i++) {
                        //tagname e input shtoto kato transformira asp to html chekboxite stavat innput
                        //zimame samo 0 element shtoto znaem che imame samo 1 checkbox
                        gridView.rows[i].cells[0].getElementsByTagName("INPUT")[0].checked = passedCheckbox.checked;

                        
                    }
                }

                function SingleCheckBoxClicked(passedCheckbox) {
                    console.log('entered single');
                    let gridView = document.getElementById("GridView1");
                    let atLeastOneCheckboxUnchecked = false;

                    //minavame po vseki red na grid viewto
                    for (var i = 1; i < gridView.rows.length; i++) {
                        //tagname e input shtoto kato transformira asp to html chekboxite stavat innput
                        //zimame samo 0 element shtoto znaem che imame samo 1 checkbox
                        if (gridView.rows[i].cells[0].getElementsByTagName("INPUT")[0].checked == false) {
                            atLeastOneCheckboxUnchecked = true;
                            break;
                        }
                    }
                    //zimame header checkboxa i go pravim protivopolojnata stoynost na atLeastOne vara
                    gridView.rows[0].cells[0].getElementsByTagName("INPUT")[0].checked = !atLeastOneCheckboxUnchecked;
                }
                </script>
        </div>
    </form>
</body>
</html>
