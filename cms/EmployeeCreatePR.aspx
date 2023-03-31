<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeCreatePR.aspx.cs" Inherits="cms.EmployeeCreatePR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    <form id="form1" runat="server">
        <div>
    Employee Create progress report<br /><br />
    
    Enter student id <br />
         <asp:TextBox ID="sid" runat="server"></asp:TextBox><br />
    
    Enter Content<br />
         <asp:TextBox ID="Content" runat="server"></asp:TextBox><br />
   
    Enter Date<br />
         <asp:TextBox ID="Date" runat="server"></asp:TextBox><br />
   
               <asp:Button ID="EPR" runat="server" OnClick="Employee_Grade_PR" Text="Grade progress report" /><br />


        </div>
    </form>
</body>
</html>
