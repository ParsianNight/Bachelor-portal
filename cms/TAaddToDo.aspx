<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TAaddToDo.aspx.cs" Inherits="cms.TAaddToDo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
Enter Meeting ID</div>
        <p>
            <asp:TextBox ID="MeetingID" runat="server"></asp:TextBox>
        </p>
        <p>
            Add to the to do list</p>
        <asp:TextBox ID="Addtodolist" runat="server" Height="145px" Width="896px"></asp:TextBox>
        <p>
            <asp:Button ID="ConfirmAdding" runat="server" Text="Add to the to do list" OnClick="ConfirmAdding_Click" />
        </p>
    </form>
</body>
</html>
