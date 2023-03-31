<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CassignASTLP.aspx.cs" Inherits="cms.CassignASTLP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="astvBUTT" OnClick ="assignstudents" runat="server" Text="assign students" />
        <br />
        <br />
        <asp:GridView ID="astvGRID" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
