<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyGradeThesis.aspx.cs" Inherits="cms.CompanyGradeThesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    <form id="form1" runat="server">
        <div>
    Company Grade Thesis<br /><br />
    
    Enter student id <br />
         <asp:TextBox ID="sid" runat="server"></asp:TextBox><br />
    
    Enter Company grade<br />
         <asp:TextBox ID="C_Grade" runat="server"></asp:TextBox><br />
   
    Enter Thesis title<br />
         <asp:TextBox ID="title" runat="server"></asp:TextBox><br />
   
               <asp:Button ID="Cthesis" runat="server" OnClick="Company_Grade_Thesis" Text="Grade Thesis" /><br />


        </div>
    </form>
</body>
</html>
