<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EEGradeThesis.aspx.cs" Inherits="cms.EEGradeThesis" %>

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
            Enter Title:</p>
        <asp:TextBox ID="titleInput" runat="server" Width="204px"></asp:TextBox>
        <p>
            Enter Grade:</p>
        <asp:TextBox ID="gradeInput" runat="server" Width="182px"></asp:TextBox>
        <p>
            <asp:Button ID="GradeT" runat="server" Text="Grade Thesis" OnClick="GradeT_Click" />
        </p>
        </div>
    </form>
</body>
</html>
