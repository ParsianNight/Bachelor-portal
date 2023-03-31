<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logedin_Company.aspx.cs" Inherits="cms.logedin_Company" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    <form id="form1" runat="server">
        <div>

           Logged in Company <br /><br />
          <asp:Button ID="AddEmployee1" runat="server" OnClick="AddEmployee" Text="AddEmployee" /><br /><br />
    
      <asp:Button ID="CompanyCreateLocalProject1" runat="server" OnClick="CompanyCreateLocalProject" Text="Create Local Project" /><br /><br />
    
    <asp:Button ID="AssignEmployee1" runat="server" OnClick="AssignEmployee" Text="Assign Employee" /><br /><br />
      <asp:Button ID="CompanyGradeThesis1" runat="server" OnClick="CompanyGradeThesis" Text="Company Grade Thesis" /><br /><br />
    
    <asp:Button ID="CompanyGradedefense1" runat="server" OnClick="CompanyGradedefense" Text="Company Grade defense" /><br /><br />
      <asp:Button ID="CompanyGradePR1" runat="server" OnClick="CompanyGradePR" Text="Company Grade progress report" /><br /><br />
    

        </div>
    </form>
</body>
</html>
