<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="Group_project.view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link href="viewusercss.css" rel="stylesheet" />
    <title></title>
      <style type="text/css">
        
          .auto-style1 {
              width: 159px;
          }
          .auto-style2 {
              width: 315px;
              height: 260px;
          }
        
          .auto-style3 {
              width: 543px;
          }
          .auto-style5{
              color:white;
          }
        
      </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" ForeColor="White">
                <DynamicMenuStyle HorizontalPadding="80px" />
                <Items>
                    <asp:MenuItem Text="Homepage" Value="Homepage" NavigateUrl="~/homepages.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="User profile" Value="User profile" NavigateUrl="~/uuserprofile.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Booking" Value="Booking" NavigateUrl="~/order.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Feedback" Value="Feedback" NavigateUrl="~/Feedback.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Log out" Value="Log out" NavigateUrl="~/memberlogin.aspx"></asp:MenuItem>
                </Items>
                <StaticMenuItemStyle BackColor="Black" HorizontalPadding="110px" VerticalPadding="10px" />
                <StaticMenuStyle BackColor="White" />
            </asp:Menu>
        <div class="form">
            <h2>User Profile</h2>
            <asp:image ID="image" runat="server" Height="108px" ImageUrl="~/images/icon.png" Width="180px"  CssClass="image"/><br />
      <h1 class="auto-style3">    <asp:TextBox ID="txtsearch" runat="server" CssClass="search" placeHolder="Enter the name to search" ReadOnly="True" ></asp:TextBox>
                  <asp:Button ID="btnsearch" runat="server" Text="Display" OnClick="btnsearch_Click" CssClass="button" /></h1>  
        
              <asp:Label ID="Label1" runat="server" CssClass="label" Font-Bold="True" ForeColor="White"></asp:Label>
                   <br />
                   
                   <table id="show" class="auto-style2" runat="server"  cell-padding="2" border="1">
                        <tr>
                            <td class="auto-style5">Name: &nbsp;</td>
                            <td class="auto-style1"><asp:Label ID="lbleName" runat="server" forecolor="White"/></td>
                        </tr>
                        <tr>
                        <td class="auto-style5">Username : &nbsp</td>  
                            <td class="auto-style1"><asp:Label ID="lblEUsername" runat="server" forecolor="White"/></td>
                        </tr>
                        <tr>
                            <td class="auto-style5">Password : &nbsp</td>
                            <td class="auto-style1"><asp:Label ID="lblEPassword" runat="server" Text="*******" forecolor="White" /></td>
                        </tr>
                        <tr>
                            <td class="auto-style5">Email : &nbsp</td>
                            <td class="auto-style1"><asp:Label ID="lbleEmail" runat="server"  forecolor="White"/></td>
                        </tr>
                        <tr>
                            <td class="auto-style5">phone Number : &nbsp</td>
                            <td class="auto-style1"><asp:Label ID="lblEPhone" runat="server"  forecolor="White"/></td>
                        </tr>
                        <tr>
                            <td class="auto-style5">Gender</td>
                            <td class="auto-style1">
                                <asp:Label ID="lblgender" runat="server"  forecolor="White"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">Age</td>
                            <td class="auto-style1">
                                <asp:Label ID="lblage" runat="server"  forecolor="White"></asp:Label>
                            </td>
                        </tr>
                           </table>
        </div>
    </form>
</body>
</html>
