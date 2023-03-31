<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="cms.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
    </title>
</head>
<body>

    <div>
    <form id="form1" runat="server">


              please register<br /><br />
              UserType <br />
        <asp:TextBox ID="usertype" runat="server"></asp:TextBox><br />

              Username <br />
        <asp:TextBox ID="Username" runat="server"></asp:TextBox><br />

              email <br />
        <asp:TextBox ID="email" runat="server"></asp:TextBox><br />


              first name <br />
        <asp:TextBox ID="first_name" runat="server"></asp:TextBox><br />

              last name <br />
        <asp:TextBox ID="last_name" runat="server"></asp:TextBox><br />



              birth date <br />
        <asp:TextBox ID="birth_date" runat="server"></asp:TextBox><br />
            GPA <br />
     <asp:TextBox ID="GPA" runat="server"></asp:TextBox><br />

            semester <br />
     <asp:TextBox ID="semester" runat="server"></asp:TextBox><br />



            address <br />
     <asp:TextBox ID="address" runat="server"></asp:TextBox><br />

                    faculty code <br />
     <asp:TextBox ID="faculty_code" runat="server"></asp:TextBox><br />
            
        major code <br />
     <asp:TextBox ID="major_code" runat="server"></asp:TextBox><br />
            
        
        company name <br />
     <asp:TextBox ID="company_name" runat="server"></asp:TextBox><br />
            
        representative name <br />
     <asp:TextBox ID="representative_name" runat="server"></asp:TextBox><br />
        
        representative email <br />
     <asp:TextBox ID="representative_email" runat="server"></asp:TextBox><br />
       
        phone number <br />
     <asp:TextBox ID="phone_number" runat="server"></asp:TextBox><br />
           
        country of residence <br />
     <asp:TextBox ID="country_of_residence" runat="server"></asp:TextBox><br />



       <asp:Button ID="signin" runat="server" OnClick="Login" Text="register" /><br />


        <asp:Button ID="profile_priv" class="submit-button" runat="server" OnClick="profile_priv121"  Text="my user profile" Style="margin-left: 884px" Width="100px" /> 

         </form>
          </div>
    
        <div>
        </div>
   
</body>
</html>