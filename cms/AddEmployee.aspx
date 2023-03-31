<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="cms.AddEmployee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>


    <form id="form1" runat="server">
        <div>
        Add employee to system<br /><br />


          Enter email of Employee<br />
            <asp:TextBox ID="email" runat="server"></asp:TextBox><br /><br />


          Enter name of Employee<br />
            <asp:TextBox ID="name" runat="server"></asp:TextBox><br /><br />

          Enter phone number of Employee<br />
            <asp:TextBox ID="phone_number" runat="server"></asp:TextBox><br /><br />

          Enter field of Employee<br />
            <asp:TextBox ID="field" runat="server"></asp:TextBox><br /><br />

              <asp:Button ID="AddtheEmployee" runat="server" OnClick="Add_Employee" Text="Add the Employee" /><br /><br />

        </div>
    </form>
</body>
</html>
