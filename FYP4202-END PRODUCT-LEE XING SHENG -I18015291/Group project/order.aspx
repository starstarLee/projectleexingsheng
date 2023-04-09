<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="chessclub.order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Homestay page</title>
    
    <style type="text/css">
        body{
            background: #7f7df9;
        }
    </style>
    
</head>
    
<body>
    <form id="form1" runat="server">
        <div>
            <center>
          <h1 style="color:wheat">Here is the homestay list
          </h1>
                 <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" ForeColor="White">
                <DynamicMenuStyle HorizontalPadding="70px" />
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
        <asp:DataList ID="dlProduct" runat="server" DataKeyField="ProductID" DataSourceID="Product" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnSelectedIndexChanged="dlProduct_SelectedIndexChanged" CssClass="auto-style1">
            <AlternatingItemStyle BackColor="#F7F7F7" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <ItemTemplate>
                ProductID:
                <asp:HyperLink ID="hlProID" runat="server" NavigateUrl='<%# "order.aspx?ProductID="+Eval("ProductID") %>' Text='<%# Eval("ProductID") %>'></asp:HyperLink>
                <br />
                Name:
                <asp:Label ID="Name" runat="server" Text='<%# Eval("Name") %>' />
                <br />
               
                <asp:Image ID="Image" runat="server" ImageUrl='<%# Eval("Image","~/Product/{0}") %>' />
                <br />
                Description:
                <asp:Label ID="Description" runat="server" Text='<%# Eval("Description") %>' />
                <br />
                Price: RM
                <asp:Label ID="UnitPrice" runat="server" Text='<%# Eval("UnitPrice") %>' />
                <br />
            Address
                <asp:Label ID="Location" runat="server" Text='<%# Eval("Location") %>' />
                <br />
                 <br />
                 Contact:
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Contact") %>' />
                <br />
                HostName:
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Hostname") %>' />
                <br />
                <asp:Button ID="btnAddItem" runat="server" Text="Add to cart" OnClick="btnAddItem_Click" EnableTheming="False" />
                <br />
                <br />
               
                <br />
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        </asp:DataList>
              
            <asp:SqlDataSource ID="Product" runat="server" ConnectionString="<%$ ConnectionStrings:FeedbackConnection %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
            </center>
        </div>
    </form>
</body>
</html>
