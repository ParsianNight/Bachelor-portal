<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignEmployee.aspx.cs" Inherits="cms.AssignEmployee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    
    <form id="form1" runat="server">
        <div>
    Assign Employee to bachelor project<br /><br />

    Enter bachelor project code<br />
        <asp:TextBox ID="bcode" runat="server"></asp:TextBox><br />
    Enter staff id <br />
            <asp:TextBox ID="staff_id" runat="server"></asp:TextBox><br />
                    <asp:Button ID="Bachelor" runat="server" OnClick="AssignEmployee1" Text="assign" />
            <br />
            <asp:GridView ID="GridView12" Visible="false" runat="server">
            </asp:GridView>
            <br />


        </div>
    </form>
</body>
</html>
