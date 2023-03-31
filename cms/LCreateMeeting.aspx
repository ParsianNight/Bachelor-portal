<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LCreateMeeting.aspx.cs" Inherits="cms.LCreateMeeting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter Start Time:</div>
        <p>
            <asp:TextBox ID="Stime" runat="server" Width="238px" TextMode ="Time" format ="HH:mm"></asp:TextBox>
        </p>
        <p>
            Enter End TIme:
        </p>
        <asp:TextBox ID="Etime" runat="server" Width="238px" TextMode ="Time" format ="HH:mm"></asp:TextBox>
        <p>
            Enter Date:</p>
        <asp:TextBox ID="Date" runat="server" Width="238px" type="datetime-local"></asp:TextBox>
        <p>
            Enter Meeting Point:</p>
        <p>
            <asp:TextBox ID="Meetinpoint" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="CreateMeeting" runat="server" Text="Create Meeting" OnClick="CreateMeeting_Click" />
        </p>
    </form>
</body>
</html>
