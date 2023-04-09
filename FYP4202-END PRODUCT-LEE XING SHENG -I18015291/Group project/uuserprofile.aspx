<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uuserprofile.aspx.cs" Inherits="Group_project.uuserprofile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="userprofile.css" rel="stylesheet" />
    <title></title>
   
     
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
              <br />
               <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" ForeColor="White">
                <DynamicMenuStyle HorizontalPadding="80px" />
                <Items>
                    <asp:MenuItem Text="Homepage" Value="Homepage" NavigateUrl="~/homepages.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="User profile" Value="User profile" NavigateUrl="~/uuserprofile.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Booking" Value="Booking" NavigateUrl="~/Booking.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Feedback" Value="Feedback" NavigateUrl="~/Feedback.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Log out" Value="Log out" NavigateUrl="~/memberlogin.aspx"></asp:MenuItem>
                </Items>
                <StaticMenuItemStyle BackColor="Black" HorizontalPadding="100px" VerticalPadding="10px" />
                <StaticMenuStyle BackColor="White" />
            </asp:Menu>
        </div>
        <div class="form">
            <h1>User Profile</h1> <br />
            <h2 > Username:</h2>
            <h2 > &nbsp;<asp:TextBox ID="TextBox1" runat="server" CssClass="textboxss"  PlaceHolder="Username" Width="310px"></asp:TextBox></h2> <br />
         <h2> Password:</h2>
            <h2> &nbsp;</h2>
            <h2> <asp:TextBox ID="txtpassword" runat="server" CssClass="textboxss"  PlaceHolder="password" Width="307px"></asp:TextBox> 
                  <asp:RegularExpressionValidator ID="rpassword" runat="server" ControlToValidate="txtpassword" Display="Dynamic" ErrorMessage="The password must combine with alphabet" 
                      ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" ForeColor="Red" Font-Size="X-Small"></asp:RegularExpressionValidator> <br />
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtpassword" ErrorMessage="The field cannot empty" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator>
            </h2>   <br />
         <h2> Email:</h2>
            <h2> &nbsp;</h2>
            <h2>     <asp:TextBox ID="txtemail" runat="server" CssClass="textboxss"  PlaceHolder="Email"  Width="306px"></asp:TextBox>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtemail" Display="Dynamic" ErrorMessage="Please enter correct format" 
                     ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" Font-Size="X-Small"></asp:RegularExpressionValidator>
            </h2> <br />
           <h2>     PhoneNumber:<br />
      &nbsp;<asp:TextBox ID="txtphonenumber" runat="server" CssClass="textboxss"  PlaceHolder="Phone number"  Width="301px"> </asp:TextBox>   <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtphonenumber" Display="Dynamic" ErrorMessage="Please enter correct format" ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$" ForeColor="Red" Font-Size="X-Small"></asp:RegularExpressionValidator>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtphonenumber" ErrorMessage="The field cannot be empty" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator>  </h2>  
            <asp:Button ID="btnupdate" runat="server" OnClick="btnupdate_Click" Text="Update" CssClass="button" Width="301px" style="height: 35px"/><br />
                <asp:Button ID="Button1" runat="server"  Text="View" CssClass="button" Width="301px" OnClick="Button1_Click"  style="height: 35px"/>
        </div>
    </form>
</body>
</html>
