<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepages.aspx.cs" Inherits="Group_project.homepages" %>

<!DOCTYPE html>
 <link href="homepage.css" rel="stylesheet" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 824px">
    <form id="form1" runat="server">
        <h1>Welcome to Intelligent homestay reservation system</h1>
        <br />
        <div>

            <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" ForeColor="White">
                <DynamicMenuStyle HorizontalPadding="80px" />
                <Items>
                    <asp:MenuItem Text="Homepage" Value="Homepage" NavigateUrl="~/homepages.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="User profile" Value="User profile" NavigateUrl="~/uuserprofile.aspx" ></asp:MenuItem>
                    <asp:MenuItem Text="Booking" Value="Booking" NavigateUrl="~/order.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Feedback" Value="Feedback" NavigateUrl="~/Feedback.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Log out" Value="Log out" NavigateUrl="~/memberlogin.aspx"></asp:MenuItem>
                </Items>
                <StaticMenuItemStyle BackColor="Black" HorizontalPadding="100px" VerticalPadding="10px" />
                <StaticMenuStyle BackColor="White" />
            </asp:Menu>

        </div>
        <p>
            <br />
             <br />
        <div class="class"style="text-align:center">   
            
            <asp:Label ID="lbltitle" runat="server" Text="Be Good with your Money" Font-Bold="True" Font-Size="XX-Large"  CssClass="word" ForeColor="#9900CC"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="So you can make booking from our homestay " Font-Size="XX-Large" Font-Bold="True" CssClass="words" ForeColor="#CC00FF"></asp:Label>

        </div>
   </p>
        <div >
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnnext" runat="server" Text="view more" CssClass="submit" Height="60px" OnClick="btnnext_Click" />
           
            </div>
       
      <hr />
    <div>

        <asp:HyperLink ID="HyperLink1" runat="server"  CssClass="link" NavigateUrl="~/AdminLogin.aspx">Admin Login</asp:HyperLink>

    </div>
       
    </form>
      </body>
</html>
