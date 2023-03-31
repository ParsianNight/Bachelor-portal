<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateDefense.aspx.cs" Inherits="cms.UpdateDefense" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #Text1 {
            height: 416px;
            width: 1110px;
            margin-left: 184px;
            margin-right: 4px;
        }
        #Reset1 {
            width: 100px;
            margin-left: 64px;
        }
        #Submit1 {
            width: 100px;
            margin-left: 781px;
        }
        #Def1 {
            height: 391px;
            width: 882px;
            margin-left: 299px;
        }
    </style>
    <script>
        function ClearFields() {

            document.getElementById("Def1").value = "";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 style="text-align: center; font-family: sans-serif; background-color: antiquewhite; color: white; -webkit-text-stroke: 1.4px black; direction: ltr;">Update your defense.</h1>
        </div>
               <textarea id="Def1" runat="server" style="width: 985px; height: 247px; margin-left: 452px;" autocapitalize="none" spellcheck="false" tabindex="0" ></textarea>
        <asp:Button ID="Update1" runat="server" OnClick="Update" Text="Update" style="margin-left: 812px" Width="100px" /><input id="Reset1" type="reset" value="reset" onclick="ClearFields()" /></p>

    </form>
        
</body>
</html>
