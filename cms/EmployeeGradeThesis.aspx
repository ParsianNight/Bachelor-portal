<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeGradeThesis.aspx.cs" Inherits="cms.EmployeeGradeThesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    
    <form id="form1" runat="server">
        <div>

      Employee Grade Thesis<br /><br />
    
    Enter student id <br />
         <asp:TextBox ID="sid" runat="server"></asp:TextBox><br />
    
    Enter EMployee grade<br />
         <asp:TextBox ID="E_Grade" runat="server"></asp:TextBox><br />
   
    Enter Thesis title<br />
         <asp:TextBox ID="title" runat="server"></asp:TextBox><br />
   
               <asp:Button ID="Ethesis" runat="server" OnClick="Employee_Grade_Thesis" Text="Grade Thesis" /><br />



        </div>
    </form>
</body>
</html>
