<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyGradedefense.aspx.cs" Inherits="cms.CompanyGradedefense" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    
    <form id="form1" runat="server">
        <div>


      Company Grade Defense<br /><br />
       
    Enter student id <br />
         <asp:TextBox ID="sid" runat="server"></asp:TextBox><br />
    
    Enter Company grade<br />
         <asp:TextBox ID="C_Grade" runat="server"></asp:TextBox><br />
   
    Enter Defense Location<br />
         <asp:TextBox ID="loc" runat="server"></asp:TextBox><br />
   
               <asp:Button ID="CDefense" runat="server" OnClick="Company_Grade_Defense" Text="Grade Defense" /><br />




        </div>
    </form>
</body>
</html>
