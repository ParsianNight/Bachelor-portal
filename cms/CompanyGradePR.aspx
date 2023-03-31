<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyGradePR.aspx.cs" Inherits="cms.CompanyGradePR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    

    <form id="form1" runat="server">
        <div>
      Company Grade Progress report<br /><br />
     
    Enter student id <br />
         <asp:TextBox ID="sid" runat="server"></asp:TextBox><br />
    
    Enter Company grade<br />
         <asp:TextBox ID="C_Grade" runat="server"></asp:TextBox><br />
   
    Enter Date <br />
         <asp:TextBox ID="date" runat="server"></asp:TextBox><br />
   
               <asp:Button ID="CPR" runat="server" OnClick="Company_PR" Text="Grade Progress report" /><br />

        </div>
    </form>
</body>
</html>
