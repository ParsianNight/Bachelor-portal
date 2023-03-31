<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LGradeDefense.aspx.cs" Inherits="cms.LGradeDefense" %>

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
            Enter Defense Location:</p>
        <asp:TextBox ID="locInput" runat="server" Width="204px"></asp:TextBox>
        <p>
            Enter Grade:</p>
        <asp:TextBox ID="gradeInput" runat="server" Width="182px"></asp:TextBox>
        <p>
            <asp:Button ID="GradeD" runat="server" Text="Grade Defense" OnClick="GradeD_Click" />
        </p>
    </form>
</body>
</html>
