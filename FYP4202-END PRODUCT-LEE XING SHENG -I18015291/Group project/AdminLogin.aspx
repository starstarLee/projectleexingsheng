<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Group_project.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <link href="adminlogin.css" rel="stylesheet" />
    <title></title>
       <style type="text/css">
        
          .user{
              text-decoration:none;
          }
          p{
              font-family: times, Times New Roman, times-roman, georgia, serif;
    text-transform: uppercase;
    font-size: 20px;
    color: black;
    font-weight: bold;
          }
        
       </style>
</head>
<body>
    <form id="form1" runat="server">
       <div class="login-form">
           <h1>Admin Login Form</h1>
           <p>Username :</p> <asp:TextBox ID="adminusername" runat="server" PlaceHolder="Username" CssClass="textbox" Width="295px"></asp:TextBox> <br />
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="The field cannot be empty"  ControlToValidate="adminusername" ForeColor="Red" Font-Bold="True"></asp:RequiredFieldValidator>
             
           <p>Password :</p><asp:TextBox ID="adminpassword" runat="server" Type="password" PlaceHolder="Password" CssClass="textbox" Width="295px"></asp:TextBox><br />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="The field cannot be empty"  ControlToValidate="adminpassword" ForeColor="Red" Font-Bold="True"></asp:RequiredFieldValidator><br />
           <asp:Button ID="Login" runat="server" Text="Login" CssClass="login" Width="295px" OnClick="Login_Click" />
           <asp:Label ID="Label1" runat="server" ></asp:Label><br />
           <hr />
     <center>  <asp:HyperLink ID="HyperLink1" runat="server" CssClass="user" NavigateUrl="~/memberlogin.aspx" ForeColor="White">User Login</asp:HyperLink></center>    
        </div>
              
    </form>
</body>
</html>
