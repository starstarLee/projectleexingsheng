<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="booking.aspx.cs" Inherits="Group_project.booking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link href="booking.css" rel="stylesheet" />
    <title></title>
      <style type="text/css">
          .auto-style1 {
              clear: both;
              text-align: center;
              transition: height .2s ease;
              padding: 10px;
              background: #2d2f31;
              color: white;
              font-size: 12px;
              font-variant: small-caps;
              cursor: pointer;
              display: block;
          }
      </style>
    </head>
<body>
    <form id="form1" runat="server">
        
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
          
        <div class="forms">
            <h2>Reservation Online</h2>
            <h3>Room Name: <br />   <br /> <asp:Label ID="lblname" runat="server" ></asp:Label></h3>
            <h3>Customer Name: <br /> <br />  <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged" CssClass="textbox"> </asp:TextBox>  <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="The field cannot be empty" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator></h3>
            <h3>No of person:</h3>
            <h3><asp:DropDownList ID="DropDownList2" runat="server" CssClass="auto-style1" Height="16px" Width="275px">
                        <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>more than 3</asp:ListItem>
                        </asp:DropDownList></h3>
            <h3>Phone Number: <br /> <br />   <asp:TextBox ID="TextBox4" runat="server" CssClass="textbox"></asp:TextBox></h3>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="The field cannot be empty" ControlToValidate="TextBox4" Font-Bold="True" Font-Size="14px" ForeColor="Red"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid phone number" ControlToValidate="TextBox4" ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$" Display="Dynamic" Font-Bold="True" Font-Size="14px" ForeColor="Red"></asp:RegularExpressionValidator>
            <h3>Check In date:</h3>
            <asp:TextBox ID="txtcheckin" runat="server" CssClass="textbox"></asp:TextBox>
                       
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="25px" ImageUrl="~/images/calendar.jpg" OnClick="ImageButton1_Click" Width="42px" />
              <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" CssClass="calendar" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                  <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                  <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                  <OtherMonthDayStyle ForeColor="#999999" />
                  <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                  <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                  <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>
              <asp:CompareValidator ID="cvtxtStartDate" runat="server" ErrorMessage="Start date must be earlier than finish date" ControlToCompare="txtcheckin"  display="Dynamic" enableclientscript="true"  cultureinvariantvalues="true"  ControlToValidate="TextBox3"   Operator="GreaterThanEqual"   type="Date" Font-Bold="True" ForeColor="Red"></asp:CompareValidator>
                         <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtcheckin" ErrorMessage="Select date between today to next 30 day" ForeColor="Red" Font-Bold="True" Font-Size="20px"></asp:RangeValidator>
                        <asp:Label ID="Label4" runat="server" ForeColor="Red" ></asp:Label>
         <h3>Check-out date:</h3>
              <asp:TextBox ID="TextBox3" runat="server" CssClass="textbox"  ></asp:TextBox> 
                        <asp:ImageButton ID="ImageButton2" runat="server" Height="25px" ImageUrl="~/images/calendar.jpg" OnClick="ImageButton2_Click" Width="42px" />
                        <asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="Calendar2_SelectionChanged" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                            <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>
                         <br />
                         <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Select date between today to next 30 day" ForeColor="Red" Font-Bold="True" Font-Size="14px"></asp:RangeValidator>
            <h3>Chek in time:</h3>
              <asp:DropDownList ID="DropDownList1" runat="server" CssClass="ddd" Width="275px">
                            <asp:ListItem>Morning</asp:ListItem>
                            <asp:ListItem>Afternoon</asp:ListItem>
                            <asp:ListItem>Night</asp:ListItem>
                        </asp:DropDownList>
            <h3>payment method:</h3>
           <h3> <asp:Label ID="Label3" runat="server" Text="Online booking"></asp:Label> <br /></h3>
               <asp:Button ID="Button1" runat="server" Text="Proceed" OnClick="Button1_Click" CssClass="buttons"  Width="243px" /> <br />
               <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Check" CssClass="buttons" Width="243px" />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FeedbackConnection %>" SelectCommand="SELECT [checkin], [Room] FROM [Room]"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <Columns>
                    <asp:BoundField DataField="Room" HeaderText="Room" SortExpression="Room" />
                    <asp:BoundField DataField="checkin" HeaderText="checkin" SortExpression="checkin" />
                </Columns>
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>
            <br />
        </div>
    </form>
</body>
</html>
