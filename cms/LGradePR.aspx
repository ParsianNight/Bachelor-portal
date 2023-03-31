<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LGradePR.aspx.cs" Inherits="cms.LGradePR" %>

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
            <asp:TextBox ID="sidInput" runat="server"></asp:TextBox>
        </p>
        <p>
            Enter Date:</p>
        <asp:TextBox ID="dateInput" runat="server" Width="204px" type="datetime-local"></asp:TextBox>
        <p>
            Enter Grade:</p>
        <asp:TextBox ID="gradeInput" runat="server" Width="182px"></asp:TextBox>
        <p>
            <asp:Button ID="GradePR" runat="server" Text="Grade Progress Report" OnClick="GradePR_Click" />
        </p>
        </div>
    </form>
</body>
</html>
