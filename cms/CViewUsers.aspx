<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CViewUsers.aspx.cs" Inherits="cms.CViewUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter user type</div>
        <p>
            <asp:TextBox ID="VUuttxt" runat="server"></asp:TextBox>
        </p>
        <p>
            Enter user ID</p>
        <p>
            <asp:TextBox ID="VUuidtxt" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="VUbutt" runat="server" Text="View users" OnClick="VUbutt_Click" />
    </form>
</body>
</html>
