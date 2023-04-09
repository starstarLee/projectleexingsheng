<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="allluserinformation.aspx.cs" Inherits="Group_project.allluserinformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="auserprofile.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 191px;
            font-family:sans-serif;
        }
        .auto-style3 {
            width: 100px;
              font-family:sans-serif;
        }
        .auto-style4 {
            height: 1263px;
        }
        .link{
            text-decoration:none;
            position:absolute;
            left:700px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style4">
        <div>
            <center>
             <asp:TextBox ID="txtEditSearch" runat="server" placeHolder="Enter the username or name" CssClass="search"/>
                    <asp:Button ID="btnEditSearch" Class="btnsearch" runat="server" Text="Search" OnClick="btnEditSearch_Click"   />
     <h1>User Booking Information</h1>
                </center></div>
        <table class="tableS">
            <tr>
                <td class="auto-style2">Room:<br />
                </td>
                <td class="auto-style3">
                    <asp:Label ID="txtroom" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Customer Name:<br />
                </td>
                <td class="auto-style3">
                    <asp:Label ID="txtcustomername" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">No of person:<br />
                </td>
                <td class="auto-style3">
                    <asp:Label ID="txtnoofperson" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Phone Number:<br />
                </td>
                <td class="auto-style3">
                    <asp:Label ID="txtphonenumber" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">check in date:<br />
                </td>
                <td class="auto-style3">
                    <asp:Label ID="txtcheckin" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">check out date:<br />
                </td>
                <td class="auto-style3">
                    <asp:Label ID="txtcheckout" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">check in time:<br />
                </td>
                <td class="auto-style3">
                    <asp:Label ID="txttime" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Payment method:<br />
                </td>
                <td class="auto-style3">
                    <asp:Label ID="txtpayment" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Day to stay:<br />
                </td>
                <td class="auto-style3">
                    <asp:Label ID="txtday" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Total Price:<br />
                </td>
                <td class="auto-style3">
                    <asp:Label ID="txttotal" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click" OnClientClick="return confirm('are you sure you want delete');" CssClass="buttons"/>
                    <asp:Label ID="lbldelete" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="btndelete0" runat="server" Text="View"  CssClass="buttons" OnClick="btndelete0_Click"/>
                </td>
            </tr>
        </table>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="CustomerName" DataSourceID="SqlDataSource1" GridLines="Vertical" ForeColor="Black" Height="362px" Width="1659px">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" ReadOnly="True" SortExpression="CustomerName" />
                <asp:BoundField DataField="Room" HeaderText="Room" SortExpression="Room" />
                <asp:BoundField DataField="NoOfPerson" HeaderText="NoOfPerson" SortExpression="NoOfPerson" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                <asp:BoundField DataField="checkin" HeaderText="checkin" SortExpression="checkin" />
                <asp:BoundField DataField="checkout" HeaderText="checkout" SortExpression="checkout" />
                <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
                <asp:BoundField DataField="payment" HeaderText="payment" SortExpression="payment" />
                <asp:BoundField DataField="dayofstay" HeaderText="dayofstay" SortExpression="dayofstay" />
                <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" SortExpression="TotalPrice" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FeedbackConnection %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Room]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Room] WHERE [CustomerName] = @original_CustomerName AND (([Room] = @original_Room) OR ([Room] IS NULL AND @original_Room IS NULL)) AND (([NoOfPerson] = @original_NoOfPerson) OR ([NoOfPerson] IS NULL AND @original_NoOfPerson IS NULL)) AND (([PhoneNumber] = @original_PhoneNumber) OR ([PhoneNumber] IS NULL AND @original_PhoneNumber IS NULL)) AND (([checkin] = @original_checkin) OR ([checkin] IS NULL AND @original_checkin IS NULL)) AND (([checkout] = @original_checkout) OR ([checkout] IS NULL AND @original_checkout IS NULL)) AND (([time] = @original_time) OR ([time] IS NULL AND @original_time IS NULL)) AND (([payment] = @original_payment) OR ([payment] IS NULL AND @original_payment IS NULL)) AND (([dayofstay] = @original_dayofstay) OR ([dayofstay] IS NULL AND @original_dayofstay IS NULL)) AND (([TotalPrice] = @original_TotalPrice) OR ([TotalPrice] IS NULL AND @original_TotalPrice IS NULL))" InsertCommand="INSERT INTO [Room] ([CustomerName], [Room], [NoOfPerson], [PhoneNumber], [checkin], [checkout], [time], [payment], [dayofstay], [TotalPrice]) VALUES (@CustomerName, @Room, @NoOfPerson, @PhoneNumber, @checkin, @checkout, @time, @payment, @dayofstay, @TotalPrice)" UpdateCommand="UPDATE [Room] SET [Room] = @Room, [NoOfPerson] = @NoOfPerson, [PhoneNumber] = @PhoneNumber, [checkin] = @checkin, [checkout] = @checkout, [time] = @time, [payment] = @payment, [dayofstay] = @dayofstay, [TotalPrice] = @TotalPrice WHERE [CustomerName] = @original_CustomerName AND (([Room] = @original_Room) OR ([Room] IS NULL AND @original_Room IS NULL)) AND (([NoOfPerson] = @original_NoOfPerson) OR ([NoOfPerson] IS NULL AND @original_NoOfPerson IS NULL)) AND (([PhoneNumber] = @original_PhoneNumber) OR ([PhoneNumber] IS NULL AND @original_PhoneNumber IS NULL)) AND (([checkin] = @original_checkin) OR ([checkin] IS NULL AND @original_checkin IS NULL)) AND (([checkout] = @original_checkout) OR ([checkout] IS NULL AND @original_checkout IS NULL)) AND (([time] = @original_time) OR ([time] IS NULL AND @original_time IS NULL)) AND (([payment] = @original_payment) OR ([payment] IS NULL AND @original_payment IS NULL)) AND (([dayofstay] = @original_dayofstay) OR ([dayofstay] IS NULL AND @original_dayofstay IS NULL)) AND (([TotalPrice] = @original_TotalPrice) OR ([TotalPrice] IS NULL AND @original_TotalPrice IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_CustomerName" Type="String" />
                <asp:Parameter Name="original_Room" Type="String" />
                <asp:Parameter Name="original_NoOfPerson" Type="Int32" />
                <asp:Parameter Name="original_PhoneNumber" Type="String" />
                <asp:Parameter DbType="Date" Name="original_checkin" />
                <asp:Parameter DbType="Date" Name="original_checkout" />
                <asp:Parameter Name="original_time" Type="String" />
                <asp:Parameter Name="original_payment" Type="String" />
                <asp:Parameter Name="original_dayofstay" Type="String" />
                <asp:Parameter Name="original_TotalPrice" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerName" Type="String" />
                <asp:Parameter Name="Room" Type="String" />
                <asp:Parameter Name="NoOfPerson" Type="Int32" />
                <asp:Parameter Name="PhoneNumber" Type="String" />
                <asp:Parameter DbType="Date" Name="checkin" />
                <asp:Parameter DbType="Date" Name="checkout" />
                <asp:Parameter Name="time" Type="String" />
                <asp:Parameter Name="payment" Type="String" />
                <asp:Parameter Name="dayofstay" Type="String" />
                <asp:Parameter Name="TotalPrice" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Room" Type="String" />
                <asp:Parameter Name="NoOfPerson" Type="Int32" />
                <asp:Parameter Name="PhoneNumber" Type="String" />
                <asp:Parameter DbType="Date" Name="checkin" />
                <asp:Parameter DbType="Date" Name="checkout" />
                <asp:Parameter Name="time" Type="String" />
                <asp:Parameter Name="payment" Type="String" />
                <asp:Parameter Name="dayofstay" Type="String" />
                <asp:Parameter Name="TotalPrice" Type="String" />
                <asp:Parameter Name="original_CustomerName" Type="String" />
                <asp:Parameter Name="original_Room" Type="String" />
                <asp:Parameter Name="original_NoOfPerson" Type="Int32" />
                <asp:Parameter Name="original_PhoneNumber" Type="String" />
                <asp:Parameter DbType="Date" Name="original_checkin" />
                <asp:Parameter DbType="Date" Name="original_checkout" />
                <asp:Parameter Name="original_time" Type="String" />
                <asp:Parameter Name="original_payment" Type="String" />
                <asp:Parameter Name="original_dayofstay" Type="String" />
                <asp:Parameter Name="original_TotalPrice" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <hr />
        <center>
        <asp:Button ID="close" runat="server" Text="close" CssClass="buttons" OnClick="close_Click"/></center>
        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="link" Font-Bold="True" NavigateUrl="~/adminhomepage.aspx">main page</asp:HyperLink>
    </form>
</body>
</html>
