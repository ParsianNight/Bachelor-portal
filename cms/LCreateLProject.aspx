<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LCreateLProject.aspx.cs" Inherits="cms.LCreateLProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        Enter The project code<p>
            <asp:TextBox ID="PCodeinput" runat="server"></asp:TextBox>
        </p>
        <p>
            Specify Major:</p>
        <asp:TextBox ID="majorInput" runat="server" ></asp:TextBox>
        <br />
        <br />
        Specify TItle of the project<p>
            <asp:TextBox ID="Titleinput" runat="server"></asp:TextBox>
        </p>
        Description<p>
            <asp:TextBox ID="DecInput" runat="server" Height="119px" Width="516px"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="CreateP" runat="server" Text="Create Project" OnClick="CreateP_Click" />
        </p>
    </form>
</body>
</html>
