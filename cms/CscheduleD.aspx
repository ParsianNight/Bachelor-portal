<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CscheduleD.aspx.cs" Inherits="cms.CscheduleD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter sid<br />
            <asp:TextBox ID="scheduleDSidtxt" runat="server"></asp:TextBox>
            <br />
            <br />
            Enter Time</div>
        <p>
            <asp:TextBox ID="scheduleDTtxt" runat="server" TextMode ="Time" format ="HH:mm" style="margin-bottom: 0px"></asp:TextBox>
        </p>
        <p>
            Enter date</p>
        <p>
            <asp:TextBox ID="scheduleDDtxt" runat="server" type="datetime-local"></asp:TextBox>
        </p>
        <p>
            Enter location</p>
        <p>
            <asp:TextBox ID="scheduleDLtxt" runat="server"></asp:TextBox>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="ScheduleDbutt" runat="server" Text="schedule defenses" OnClick="ScheduleDbutt_Click" />
            </p>
    </form>
</body>
</html>
