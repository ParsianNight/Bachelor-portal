<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CAssignEE.aspx.cs" Inherits="cms.CAssignEE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>



            Enter External Examiner ID:</div>
        <p>
            <asp:TextBox ID="idInput" runat="server"></asp:TextBox>
        </p>
        <p>
            Enter Project code:</p>
        <asp:TextBox ID="codInput" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="Assign" runat="server" Text="Assign" OnClick="Assign_Click" />
        </p>
    </form>
</body>
</html>
