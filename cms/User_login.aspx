<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_login.aspx.cs" Inherits="cms.User_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        Login page <br /> <br />
                Enter your email<br />
        <asp:TextBox ID="userEmail" runat="server"></asp:TextBox><br />
        Enter your password<br />
        <asp:TextBox ID="userPassword" runat="server"></asp:TextBox><br />
               <asp:Button ID="signin" runat="server" OnClick="userLogin" Text="log in" /><br />

                <asp:Button ID="register" class="submit-button" runat="server" OnClick="registe"  Text="Register" Style="margin-left: 884px" Width="100px" /> 

        <div>
        </div>
    </form>
</body>
</html>
