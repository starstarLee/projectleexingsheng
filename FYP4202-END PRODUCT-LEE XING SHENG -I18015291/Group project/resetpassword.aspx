<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetpassword.aspx.cs" Inherits="Group_project.resetpassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="reset.css" rel="stylesheet" />

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center">       <h1 >Reset Password</h1></div>
  
      
        <div class="box">
              
            <asp:Label ID="Label1" runat="server" Text="Username" Font-Bold="True" ForeColor="White" ></asp:Label> <br />
            <asp:TextBox ID="TextBox1" runat="server" CssClass="username" ForeColor="White" ></asp:TextBox> <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="The field cannot be empty" ControlToValidate="TextBox1" ForeColor="Red" BackColor="Yellow"></asp:RequiredFieldValidator>
            <br />
            <br />
             <asp:Label ID="Label2" runat="server" Text="New password" Font-Bold="True" Font-Size="Medium" ForeColor="White"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" CssClass="username" ForeColor="White" Type="Password"></asp:TextBox>
            <br />
             <asp:RegularExpressionValidator ID="rpassword" runat="server" ControlToValidate="TextBox2" ErrorMessage="The password must combine with number and alphabet like (A123-)"
                 ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" Display="Dynamic" BackColor="Yellow" ForeColor="Red"></asp:RegularExpressionValidator>
        <br />
            <br />
         <asp:Label ID="Label3" runat="server" Text="Confirm password" Font-Bold="True" ForeColor="White"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" CssClass="username" Type="Password" ForeColor="White" ></asp:TextBox>
        <br />
          <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ControlToCompare="TextBox2" ControlToValidate="TextBox3" ErrorMessage="The new password is not match with confirm password" BackColor="Yellow" ForeColor="red"></asp:CompareValidator>
        <br />
        
        <asp:Button ID="Button1" runat="server" Text="update" OnClick="Button1_Click"  CssClass="button"/>
             <br />
                <asp:HyperLink ID="HyperLink1" runat="server"  NavigateUrl="~/memberlogin.aspx"  CssClass="link" ForeColor="#6699FF" > &nbsp;&nbsp;&nbsp;&nbsp;Return back to the login page.</asp:HyperLink>
            
           
        </div>
       
    </form>
</body>
</html>
