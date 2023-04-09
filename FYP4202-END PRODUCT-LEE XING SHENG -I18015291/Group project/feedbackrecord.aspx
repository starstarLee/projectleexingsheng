<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="feedbackrecord.aspx.cs" Inherits="Group_project.feedbackrecord" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link href="auserprofile.css" rel="stylesheet" />
    <title></title>
</head>
<body style="height: 857px">
    <form id="form1" runat="server">
        <div>
     <center>    <h1>  Feedback record </h1></center> <br />
            <br />
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Height="225px" Width="1466px">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="rate" HeaderText="rate" SortExpression="rate" />
                <asp:BoundField DataField="problem" HeaderText="problem" SortExpression="problem" />
                <asp:BoundField DataField="comment" HeaderText="comment" SortExpression="comment" />
                <asp:CommandField ShowDeleteButton="True" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FeedbackConnection %>" DeleteCommand="DELETE FROM [Feedbackk] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Feedbackk] ([Name], [Phone], [Email], [rate], [problem], [comment]) VALUES (@Name, @Phone, @Email, @rate, @problem, @comment)" SelectCommand="SELECT * FROM [Feedbackk]" UpdateCommand="UPDATE [Feedbackk] SET [Name] = @Name, [Phone] = @Phone, [Email] = @Email, [rate] = @rate, [problem] = @problem, [comment] = @comment WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="rate" Type="String" />
                <asp:Parameter Name="problem" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="rate" Type="String" />
                <asp:Parameter Name="problem" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <hr />
        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="link" Font-Bold="True" NavigateUrl="~/adminhomepage.aspx">main page</asp:HyperLink>
    </form>
</body>
</html>
