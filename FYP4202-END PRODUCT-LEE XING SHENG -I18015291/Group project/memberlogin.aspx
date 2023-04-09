<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="memberlogin.aspx.cs" Inherits="Group_project.login2" %>

<!DOCTYPE html>
    <link href="login.css" rel="stylesheet" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 
   
    
   
    <style type="text/css">
       
       
    </style>
   
    
   
    </head>
<body>
    <form id="form1" runat="server">
      <center>  <h6 >&nbsp;Intelligence Homestay Online Reservation And Management System</h6> 
         

  <p>  <asp:Label ID="Label1" runat="server" Text="User Login Page " CssClass="label1" ></asp:Label></p>  </center>
        <div class="loginbox"> <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <br />
            <br />
         <p>Username:<p> <asp:TextBox ID="txxtusername" runat="server" CssClass="ccusername" Width="320px" PlaceHolder="Username"  ></asp:TextBox> 
            <asp:RequiredFieldValidator ID="rqqusername" runat="server" ErrorMessage="Please enter the username" ControlToValidate="txxtusername" ForeColor="#CC0000" Font-Size="16px"></asp:RequiredFieldValidator>
            <br />
            <p>Password:&nbsp;&nbsp;</p> <asp:TextBox ID="txxxtpassword" runat="server" CssClass="ccpassword" Width="320px" PlaceHolder="Password" Type="password"></asp:TextBox> <br />
            <asp:RequiredFieldValidator ID="rqqqpassword" runat="server" ErrorMessage="Please enter the password" ControlToValidate="txxxtpassword" ForeColor="#CC0000"  ></asp:RequiredFieldValidator>
             <br />
      
     
         
           
                 
              <br />
                 
                <asp:Button ID="btn3" runat="server" Text="Login" CssClass="loginButton" OnClick="BtnLogin_Click" />
                <br />
            
              <h1>New here? <asp:HyperLink ID="register" runat="server" NavigateUrl="uuserregister.aspx" CssClass="link" ForeColor="#CCFFCC">Sign In</asp:HyperLink></h1> <br />
        
       <h2>Forget Password?   <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="resetpassword.aspx" CssClass="link" ForeColor="#CCFFCC">Recover here</asp:HyperLink></h2>  <br />
             <hr />
             <center>  <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Adminlogin.aspx" CssClass="link" ForeColor="White" Text="AdminLogin"/></center> 
                <asp:Label ID="lblerror" runat="server" ></asp:Label></p>
            </div>
        
     
               
        
        
     
       
      
        
     
               
        
        
     
       
    </form>
</body>
</html>
