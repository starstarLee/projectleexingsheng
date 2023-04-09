<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="Group_project.addproduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link href="auserprofile.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 33%;
             margin-left: auto;
    margin-right: auto;
   
        }
        .auto-style2 {
            width: 168px;
            letter-spacing: 1px;
    margin-bottom: 25px;
    text-align: center;
    font-size:16px;
    font-family:sans-serif;
        }
        .auto-style3 {
            letter-spacing: 1px;
            margin-bottom: 25px;
            text-align: center;
            font-size: 16px;
            font-family: sans-serif;
        }
        .link{
            text-decoration:none;
            left:700px;
            position:absolute;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" >
        <div>

        </div>
    <table class="auto-style1"> 
        <tr>
            <td class="auto-style3" colspan="2">Add Homestay </td>
        </tr>
        <tr>
            <td class="auto-style2">Product ID:</td>
            <td><asp:TextBox ID="productID" runat="server"  CssClass="textbox" Width="395px" ></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style2">Name:</td>
            <td><asp:TextBox ID="Name" runat="server" CssClass="textbox" Width="395px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style2">Image:</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server"  CssClass="textbox"/>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Description:</td>
            <td><asp:TextBox ID="description" runat="server" P CssClass="textbox" Width="395px"></asp:TextBox>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Unit Price:</td>
            <td><asp:TextBox ID="price" runat="server"  CssClass="textbox" Width="395px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style2">Contact:</td>
            <td><asp:TextBox ID="contact" runat="server"  CssClass="textbox" Width="395px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style2">Host NAME:</td>
            <td><asp:TextBox ID="HOST" runat="server"  CssClass="textbox" Width="395px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style2">Location:</td>
            <td><asp:TextBox ID="location" runat="server"  CssClass="textbox" Width="395px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload" CssClass="button" />
                <br />
                <asp:Label ID="Label1" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Delete"  OnClientClick="return confirm('Are You Sure You Want Delete the record');"  CssClass="button"/>
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
        <div>
            <br />
        </div>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="SqlDataSource1" >
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:TemplateField HeaderText="Image" SortExpression="Image">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Image") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="196px" ImageUrl='<%# Eval("Image","~/Product/{0}") %>' Width="283px" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice(RM)" SortExpression="UnitPrice" />
                <asp:BoundField DataField="contact" HeaderText="contact" SortExpression="contact" />
                <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
                <asp:BoundField DataField="Hostname" HeaderText="HostName" SortExpression="Hostname" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:FeedbackConnection %>" DeleteCommand="DELETE FROM [Product] WHERE [ProductID] = @original_ProductID AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Image] = @original_Image) OR ([Image] IS NULL AND @original_Image IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([UnitPrice] = @original_UnitPrice) OR ([UnitPrice] IS NULL AND @original_UnitPrice IS NULL)) AND (([contact] = @original_contact) OR ([contact] IS NULL AND @original_contact IS NULL)) AND (([location] = @original_location) OR ([location] IS NULL AND @original_location IS NULL))" InsertCommand="INSERT INTO [Product] ([ProductID], [Name], [Image], [Description], [UnitPrice], [contact], [location]) VALUES (@ProductID, @Name, @Image, @Description, @UnitPrice, @contact, @location)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Product]" UpdateCommand="UPDATE [Product] SET [Name] = @Name, [Image] = @Image, [Description] = @Description, [UnitPrice] = @UnitPrice, [contact] = @contact, [location] = @location WHERE [ProductID] = @original_ProductID AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Image] = @original_Image) OR ([Image] IS NULL AND @original_Image IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([UnitPrice] = @original_UnitPrice) OR ([UnitPrice] IS NULL AND @original_UnitPrice IS NULL)) AND (([contact] = @original_contact) OR ([contact] IS NULL AND @original_contact IS NULL)) AND (([location] = @original_location) OR ([location] IS NULL AND @original_location IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ProductID" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Image" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
                <asp:Parameter Name="original_contact" Type="String" />
                <asp:Parameter Name="original_location" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductID" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Image" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="contact" Type="String" />
                <asp:Parameter Name="location" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Image" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="contact" Type="String" />
                <asp:Parameter Name="location" Type="String" />
                <asp:Parameter Name="original_ProductID" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Image" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
                <asp:Parameter Name="original_contact" Type="String" />
                <asp:Parameter Name="original_location" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <hr />
        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="link" Font-Bold="True" NavigateUrl="~/adminhomepage.aspx">main page</asp:HyperLink>
    </form>
</body>
</html>
