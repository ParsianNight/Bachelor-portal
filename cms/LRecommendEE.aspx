<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LRecommendEE.aspx.cs" Inherits="cms.LRecommendEE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter Project Code:</div>
        <p>
            <asp:TextBox ID="pCodeInput" runat="server"></asp:TextBox>
        </p>
        <p>
            Enter External Examiner&#39;s ID:</p>
        <asp:TextBox ID="EEIDinput" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="RecommendEE" runat="server" Text="Recommend" OnClick="RecommendEE_Click" />
        </p>
    </form>
</body>
</html>
