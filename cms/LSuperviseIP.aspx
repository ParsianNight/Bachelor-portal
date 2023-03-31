<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LSuperviseIP.aspx.cs" Inherits="cms.LSuperviseIP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter Project Code:</div>
        <p>
            <asp:TextBox ID="pCodeinput" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="supevise" runat="server" Text="Supervise" OnClick="supevise_Click" />
    </form>
</body>
</html>
