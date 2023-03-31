<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LViewMeeting.aspx.cs" Inherits="cms.LViewMeeting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter Meeting ID:</div>
        <p>
            <asp:TextBox ID="midInput" runat="server" Width="164px"></asp:TextBox>
        </p>
        <asp:Button ID="ViewM" runat="server" Text="View Meeting" OnClick="ViewM_Click" />
    </form>
</body>
</html>
