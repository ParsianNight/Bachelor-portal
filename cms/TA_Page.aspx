<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TA_Page.aspx.cs" Inherits="cms.TA_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Button ID="CreatePR" runat="server" Text="Create Progress Report" OnClick="CreatePR_Click" />
        <p>
            <asp:Button ID="AddToDO" runat="server" Text="Add to the to do list" OnClick="AddToDO_Click" />
        </p>
    </form>
</body>
</html>
