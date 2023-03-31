<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeGradedefense.aspx.cs" Inherits="cms.EmployeeGradedefense" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>


    <form id="form1" runat="server">
        <div>

      Employee Grade Defense<br /><br />
    
    Enter student id <br />
         <asp:TextBox ID="sid" runat="server"></asp:TextBox><br />
    
    Enter Employee grade<br />
         <asp:TextBox ID="E_Grade" runat="server"></asp:TextBox><br />
   
    Enter Defense location<br />
         <asp:TextBox ID="loc" runat="server"></asp:TextBox><br />
   
               <asp:Button ID="EDefense" runat="server" OnClick="Employee_Grade_defense" Text="Grade defense" /><br />




        </div>
    </form>
</body>
</html>
