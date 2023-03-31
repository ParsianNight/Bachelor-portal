<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProgressReport.aspx.cs" Inherits="cms.ViewProgressReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%=getWhileLoopDataProgressReport()%>
                         <p style="text-align:center">Specify a date.</p>
        
               
               <br/>
                              
           <asp:TextBox ID="ProgressRep" runat="server" Height="16px" style="margin-left: 777px; margin-top: 0px" Width="258px" Text="Enter progress report date " ></asp:TextBox><br />
           
           
    <asp:Button ID="ProgressRep1" runat="server" Text="Select date" style="margin-top: 27px; margin-left: 827px;" Width="187px" OnClick="getWhileLoopDataProgressReport" />
                        <br />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

        </div>
    </form>
</body>
</html>
