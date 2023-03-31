<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewThesis.aspx.cs" Inherits="cms.ViewThesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:TextBox ID="Thesis" runat="server" Height="16px" style="margin-left: 777px; margin-top: 0px" Width="258px" Text="Enter thesis title:" ></asp:TextBox><br />
           
           
    <asp:Button ID="Thesis1" runat="server" Text="Submit" style="margin-top: 27px; margin-left: 827px;" Width="187px" OnClick="ThesisShow" />
                        <br />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
