<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignRecomendations.aspx.cs" Inherits="cms.AssignRecomendations" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>        
                        <h3>TA id:</h3>
            <input  runat="server" id="Text1" type="text" />
            <h3>Project code:</h3>
            <input runat="server" id="Text2" type="text" />
            <br />
            <br />
                           <asp:Button ID="Assign" runat="server" OnClick="Assign" Text="Assign" style="margin-left: 43px" Width="73px" />

        </div>
    </form>
</body>
</html>
