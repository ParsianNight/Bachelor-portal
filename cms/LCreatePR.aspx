<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LCreatePR.aspx.cs" Inherits="cms.LCreatePR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter Student ID:</div>
        <p>
            <asp:TextBox ID="sidInput" runat="server" Width="155px"></asp:TextBox>
        </p>
        <p>
            Enter Date:</p>
        <asp:TextBox ID="dateInput" runat="server" Width="194px" type="datetime-local"></asp:TextBox>
        <p>
            Enter Content for the Progress Report:</p>
        <asp:TextBox ID="contentInput" runat="server" Height="175px" Width="912px"></asp:TextBox>
        <p>
            <asp:Button ID="CreatePR" runat="server" Text="Create Progress Report" OnClick="CreatePR_Click" />
        </p>
    </form>
</body>
</html>
