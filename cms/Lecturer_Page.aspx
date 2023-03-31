<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lecturer_Page.aspx.cs" Inherits="cms.Lecturer_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Button ID="CreateMeeting" runat="server" Height="52px" Text="Create a meeting" Width="160px" OnClick="CreateMeeting_Click" />
        <asp:Button ID="CreateProject" runat="server" Height="52px" style="margin-top: 0px" Text="Create a local Project" Width="160px" OnClick="CreateProject_Click" />
        <asp:Button ID="ViewMeeting" runat="server" Height="54px" Text="View Meetings" Width="162px" OnClick="ViewMeeting_Click" />
        <asp:Button ID="RecommendEE" runat="server" Height="51px" Text="Recommend External Examiner to an academic project" Width="433px" OnClick="RecommendEE_Click" />
        <asp:Button ID="SuperviseIP" runat="server" Height="53px" Text="Supervise Industrial Projects" Width="226px" OnClick="SuperviseIP_Click" />
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="SpecifyDeadline" runat="server" Text="Specify thesis deadline" Height="54px" Width="199px" OnClick="SpecifyDeadline_Click" />
            <asp:Button ID="Addtodolist" runat="server" Height="54px" Text="Add to the to-do-list" Width="181px" OnClick="Addtodolist_Click" />
            <asp:Button ID="ViewEE" runat="server" Height="54px" Text="View External Examiners that are not recommendend to an academic Project" Width="597px" OnClick="ViewEE_Click" />
        </p>
        <asp:Button ID="GradeThesis" runat="server" Height="51px" Text="Grade Thesis" Width="193px" OnClick="GradeThesis_Click" />
        <asp:Button ID="GradeDefense" runat="server" Height="53px" Text="Grade Defense" Width="157px" OnClick="GradeDefense_Click" />
        <asp:Button ID="CreatePR" runat="server" Height="51px" Text="Create Progress Report" Width="208px" OnClick="CreatePR_Click" />
        <asp:Button ID="GradePR" runat="server" Height="50px" Text="Grade Progress Report" Width="191px" OnClick="GradePR_Click" />
    </form>
</body>
</html>
