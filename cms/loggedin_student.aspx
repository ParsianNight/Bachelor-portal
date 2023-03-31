<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loggedin_student.aspx.cs" Inherits="cms.loggedin_student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

                   Logged in student <br /><br />
          <asp:Button ID="preferences" runat="server" OnClick="preferencesproc" Text="Make preferences for local bachelor projects that belongs to my major." /><br /><br />
    
      <asp:Button ID="View_their_thesis" runat="server" OnClick="View_their_thesisproc" Text="View my thesis." /><br /><br />
    
    <asp:Button ID="Submit_their_thesis" runat="server" OnClick="Submit_their_thesisproc" Text="Submit my thesis" /><br /><br />


    
    <asp:Button ID="View_progress_reports" runat="server" OnClick="View_progress_reportsproc" Text="View my progress reports." /><br /><br />
      <asp:Button ID="View_defense" runat="server" OnClick="View_defenseproc" Text="View my defense" /><br /><br />


    
           <br /><br />
          <asp:Button ID="Update_defense_content" runat="server" OnClick="Update_defense_contentproc" Text=" Update my defense content." /><br /><br />
    
      <asp:Button ID="View_bachelor_project_grade" runat="server" OnClick="View_bachelor_project_gradeproc" Text="View my bachelor project grade." /><br /><br />
    
    <asp:Button ID="View_meetings_that_are_not_booked" runat="server" OnClick="View_meetings_that_are_not_bookedproc" Text="Book a meeting" /><br /><br />
    
    

        <div>
        </div>
    </form>
</body>
</html>
