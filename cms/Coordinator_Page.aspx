<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Coordinator_Page.aspx.cs" Inherits="cms.Coordinator_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Button ID="ViewU" runat="server" Text="View Users" Width="116px" OnClick="ViewU_Click" />

        </div>

        <asp:Button ID="AssignS" runat="server" Text="Assign all students to a local project" OnClick="AssignS_Click" />
        <p>
            <asp:Button ID="AssignTA" runat="server" Text="Assign TA to a local bachelor project" OnClick="AssignTA_Click" />
        </p>
        <asp:Button ID="ViewR" runat="server" Text="View Recommendation" OnClick="ViewR_Click" />
        <p>
            <asp:Button ID="AssignE" runat="server" Text="Assign External examiner" OnClick="AssignE_Click" />
        </p>
        <p>
            <asp:Button ID="ScheduleD" runat="server" Text="Schedule Defense" OnClick="ScheduleD_Click" />
        </p>

    </form>
</body>
</html>
