<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoredPrFromDSourceObject.aspx.cs" Inherits="passingValues.StoredPrFromDSourceObject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllDepartments" TypeName="passingValues.AuthorsDataAccessLayer"></asp:ObjectDataSource>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1" DataTextField="DepartmentName" DataValueField="DepartmentId"></asp:DropDownList>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetEmployeesByDepartmet" TypeName="passingValues.EmployeeDataAcessLayer">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="departmentId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="DepartmentName" HeaderText="DepartmentName" SortExpression="DepartmentName" />
                </Columns>
            </asp:GridView>
            </div>
    </form>
</body>
</html>
