<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LSpecifyDeadline.aspx.cs" Inherits="cms.LSpecifyDeadline" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Specify Thesis Deadline</div>
        <p>
            <asp:TextBox ID="deadlineInput" runat="server" Width="241px" type="datetime-local"></asp:TextBox>
        </p>
        <asp:Button ID="deadline" runat="server" Text="Set Deadline" OnClick="deadline_Click" />
    </form>
</body>
</html>
