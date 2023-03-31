<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyCreateLocalProject.aspx.cs" Inherits="cms.CompanyCreateLocalProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


    

</head>
<body>
    <form id="form1" runat="server">
        <div>


        Create Local Project<br /><br />

 
          Enter project code <br />
            <asp:TextBox ID="pcode" runat="server"></asp:TextBox><br /><br />


          Enter title of project<br />
            <asp:TextBox ID="title" runat="server"></asp:TextBox><br /><br />

          Enter description of Employee<br />
            <asp:TextBox ID="description" runat="server"></asp:TextBox><br /><br />

          Enter major code of Employee<br />
            <asp:TextBox ID="mcode" runat="server"></asp:TextBox><br /><br />

              <asp:Button ID="CreateLocalProject1" runat="server" OnClick="CreateLocalProject" Text="Create Local Project" /><br /><br />


        </div>
    </form>
</body>
</html>
