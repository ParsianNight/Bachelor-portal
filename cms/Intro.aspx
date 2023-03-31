<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Intro.aspx.cs" Inherits="cms.Intro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        Welcome to our Central managment system <br />
          <asp:Button ID="login" runat="server" OnClick="login1" Text="login" /><br />
          <br />

        <div>
          <asp:Button ID="register" runat="server" OnClick="register1" Text="register" />
        </div>
    </form>
</body>
</html>
