<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubmitThesis.aspx.cs" Inherits="cms.SubmitThesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 style="text-align: center; font-family: sans-serif; background-color: antiquewhite; color: white; -webkit-text-stroke: 1.4px black; direction: ltr;">Submit your thesis.</h1>
        </div>
       <h3 style="text-align:center">Thesis Title:</h3> <input type="text" id="Thesis2" runat="server" style="width: 307px; height: 27px; margin-left: 812px;" autocapitalize="none" spellcheck="false" tabindex="0" ></input>
        <br />
        <h3 style="text-align:center"> Content of thesis:</h3>
        <br/>
        <textarea id="Thesis1" runat="server" style="width: 985px; height: 247px; margin-left: 452px;" autocapitalize="none" spellcheck="false" tabindex="0" ></textarea>
        <asp:Button ID="Submit" runat="server" OnClick="Update" Text="Submit" style="margin-left: 812px" Width="100px" />

     </form>

</body>
</html>
