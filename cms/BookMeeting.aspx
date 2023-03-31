<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookMeeting.aspx.cs" Inherits="cms.BookMeeting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Meetings</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Label ID="Label1" runat="server" Text="Label" style="align-items:center;font-family:sans-serif;background-color:antiquewhite;color:black; height: 78px;">
                <h2 style="text-align:center">Availabe Meetings</h2>
                <%=getWhileLoopData()%> 
                <hr />
                             </asp:Label>
             <p style="text-align:center">Book a meeting</p>
        
               
               <br/>
                              
           <asp:TextBox ID="MeetingNum" runat="server" Height="16px" style="margin-left: 777px; margin-top: 0px" Width="258px" Text="Enter meeting id" ></asp:TextBox><br />
           
    <asp:Button ID="BookMeeting1" runat="server" Text="Book Meeting" style="margin-top: 27px; margin-left: 827px;" Width="187px" OnClick="BookMeeting_Click" />
        <hr />
                            <h2 style="text-align:center">Your booked meetings</h2>
                <%=getWhileLoopDataBooked()%> 
            <hr />
                                        <h2 style="text-align:center">Add to-do in meeting</h2>
                <textarea id="Add1" runat="server" style="width: 985px; height: 247px; margin-left: 452px;" autocapitalize="none" spellcheck="false" tabindex="0" ></textarea>
                <input type="text" id="Add2" runat="server" style="width: 310px; height: 32px; margin-left: 763px;" autocapitalize="none" spellcheck="false" tabindex="0" value="Meeting id" ></input>

        <asp:Button ID="Update1" runat="server" OnClick="Update" Text="Update" style="margin-left: 884px" Width="100px" /> 

        </div>

    </form>
</body>
</html>
