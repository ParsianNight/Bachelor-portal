<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EE_Page.aspx.cs" Inherits="cms.EE_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Button ID="GradeT" runat="server" Text="Grade Thesis" OnClick="GradeT_Click" />
        <p>
            <asp:Button ID="GradeD" runat="server" Text="Grade Defense" OnClick="GradeD_Click" />
        </p>
    </form>
</body>
</html>
