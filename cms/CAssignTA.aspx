<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CAssignTA.aspx.cs" Inherits="cms.CAssignTA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter TA ID:</div>
        <p>
            <asp:TextBox ID="TAid" runat="server" OnTextChanged="TAid_TextChanged"></asp:TextBox>
        </p>
        <p>
            Enter Project Code:</p>
        <asp:TextBox ID="PCode" runat="server" OnTextChanged="PCode_TextChanged"></asp:TextBox>
        <p>
            <asp:Button ID="Assign" runat="server" Text="Assign" OnClick="Assign_Click" />
        </p>
    </form>
</body>
</html>
