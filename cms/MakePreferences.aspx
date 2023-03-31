<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MakePreferences.aspx.cs" Inherits="cms.MakePreferences" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 252px;
        }
        #css {
            width: 245px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
           <h1 style="text-align:center">Make Prefence for your local project!</h1>
               
            <p style="width: 173px; height: 20px; margin-left: 667px; margin-top: 20px">project ID</p>
               
           <asp:TextBox ID="PrefProj" runat="server" Height="16px" style="margin-left: 291px; margin-top: -10px" Width="607px" ></asp:TextBox>
           <br />
           <div>
               <p style="margin-left: 655px">preference Number</p>
        
               
               <br/>
                              
           <asp:TextBox ID="PrefNum" runat="server" Height="16px" style="margin-left: 610px; margin-top: 0px" Width="258px" ></asp:TextBox><br />
           
    <asp:Button ID="MakePref" runat="server" Text="Make preference" style="margin-top: 27px; margin-left: 638px;" Width="187px" OnClick="MakePref_Click" />
            </div>
                
    </form>
    </body>
</html>
