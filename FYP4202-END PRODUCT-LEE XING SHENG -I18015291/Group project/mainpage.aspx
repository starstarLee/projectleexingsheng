<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mainpage.aspx.cs" Inherits="Group_project.mainpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link href="mainpage.css" rel="stylesheet" />
    <title></title>
        <style type="text/css">
            .auto-style1 {
                height: 464px;
            }
            .auto-style2 {
                background-color: lightgray;
                height: 176px;
            }
        </style>
</head>
<body style="height: 837px">
    <form id="form1" runat="server">
        <div>
            <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" ForeColor="White">
                <DynamicMenuStyle HorizontalPadding="60px" />
                <Items>
                    <asp:MenuItem Text="Homepage" Value="Homepage" NavigateUrl="~/homepages.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="User profile" Value="User profile" NavigateUrl="~/uuserprofile.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Booking" Value="Booking" NavigateUrl="~/booking.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Feedback" Value="Feedback" NavigateUrl="~/Feedback.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Log out" Value="Log out" NavigateUrl="~/memberlogin.aspx"></asp:MenuItem>
                </Items>
                     <StaticMenuItemStyle BackColor="Black" HorizontalPadding="100px" VerticalPadding="8px" />
                <StaticMenuStyle BackColor="White" />
            </asp:Menu>
        
            <h1 class="auto-style1">Homestay online reservation and mangement System</h1>
            
            <h4>Introduction</h4>
            <p>Our Homestay Online reservation and management system provides an online  web based homestay reservation system all over the Malaysia. Our Homestay reservation system allows you to start book the homestay online and customer management. The application is created to simply the work of the host of homestay and promoted the homestay let more people more about the homestay. The system will provided users a unique, user friendly and easy to use the interface that improves the way people use the web today.</p>
      <p>Homestay reservation system is a technology suite that allow you to accept direct booking through your websitye. It is a software tool that display your live rates and inventory in real time, across all of your channels and allow guests to select the dates for their trip and finalize their reservation. <br /> Our services helps to build an impactful presence for your homestay in the virtual world, create greater visibility and great ease of transaction which results in lower unsold inventory through greater online revenue and profits.</p>
          <h4>Our system</h4>
            <p>
                Our Homestay online reservation system is a simple user-friendly systemn that enables users enter the system to reserve rooms instantly through your website after verifying the availability. The reservation manage of your room book easily and monitor the online homestay reservation system.
           
            Our system only accept online banking which provide convenience of secure bank transfer. Our system provides integrated hotel reservation software to the client globally.Our intelligence homestay online  reservation and management system is the best platform, as it adds many benefits and you can easily book the hotel or room through the internet.
It discovers more information about a hotel which is situated in a particular area and you can also select a homestays according to your demands and choice.Our intelligence homestay online  reservation and management system enables customers or users to schedule dates and length of stay, room selection, feedback, and payment all in one place. In addition, user will receive email within 5 days
after make the payment.</p> 
            </div>
        <div class="auto-style2">
  <center>      <asp:Label ID="text" runat="server" Text="Features of the system" CssClass="pp" Font-Bold="True" /></center>   
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" Enabled="False" CssClass="ppp" Width="471px" Height="138px"> 
                <asp:ListItem>Easy to use</asp:ListItem>
                <asp:ListItem>User friendly</asp:ListItem>
                <asp:ListItem>Integrated payment gateway</asp:ListItem>
                <asp:ListItem>Save time &amp;Money</asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div>
           <center>      <asp:Label ID="Label1" runat="server" Text="Benefits of the system" CssClass="pp" Font-Bold="True" /></center>   
            <asp:RadioButtonList ID="RadioButtonList2" runat="server" CssClass="ppp" Enabled="False" Width="471px" Height="138px">
                <asp:ListItem>Hotel details</asp:ListItem>
                <asp:ListItem>Secure</asp:ListItem>
                <asp:ListItem>Fast and easy to used</asp:ListItem>
                <asp:ListItem>Save time &amp;Money</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </form>
</body>
</html>
