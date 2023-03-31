<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CViewRecom.aspx.cs" Inherits="cms.CViewRecom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter Lecturer ID<br />
            <br />
            <asp:TextBox ID="VRtxt" runat="server"></asp:TextBox>
        </div>
        <p>
        <asp:Button ID="VRbutt" runat="server" OnClick="Button1_Click" Text="View recommendations" />
        </p>
    </form>
</body>
</html>
