<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GradeThesisEx.aspx.cs" Inherits="cms.GradeThesisEx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <h3>student id:</h3>
            <input  runat="server" id="Text1" type="text" />
            <h3>Thesis title:</h3>
            <input runat="server" id="Text2" type="text" />
            <h3 style="margin-left: 36px" >grade: </h3>
            <input runat="server" id="Text3" type="text" />
            <br />
            <br />
                           <asp:Button ID="signin" runat="server" OnClick="Grade" Text="log in" />

        </div>
    </form>
</body>
</html>
