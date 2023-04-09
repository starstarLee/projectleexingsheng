<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="auserprofile.aspx.cs" Inherits="Group_project.auserprofile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <link href="auserprofile.css" rel="stylesheet" />
    <title></title>
       <style type="text/css">
           .auto-style1 {
               width: 172px;
                  font-family:sans-serif;
           }
           .auto-style2 {
               width: 177px;
                  font-family:sans-serif;
           }
           .auto-style3 {
               width: 180px;
               font-family:sans-serif;
           }
           .auto-style4 {
               height: 83px;
           }
           .auto-style5 {
               height: 1443px;
           }
           .link{
               position:relative;
               left:700px;
               text-decoration:none;
           }
       </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style5">
            <center class="auto-style4">
          <asp:TextBox ID="txtEditSearch" runat="server" placeHolder="Enter the username or name" CssClass="search"/>
                    <asp:Button ID="btnEditSearch" Class="btnsearch" runat="server" Text="Search" OnClick="btnEditSearch_Click" CssClass="btnsearch" 
                        />
             
            <br />
                                <asp:Label ID="labeldelete0" runat="server" ></asp:Label>
                   
     
          </center>
           <table id="show" class="tableS" runat="server" >
                        <tr>
                            <td class="auto-style3">Name: &nbsp</td>
                            <td><asp:Label ID="lblEditId" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Username : &nbsp</td>
                            <td><asp:Label ID="lblEditUsername" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Password : &nbsp</td>
                            <td><asp:Label ID="lblEditPassword" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Email : &nbsp</td>
                            <td><asp:Label ID="lblEditEmail" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="auto-style3">phone Number : &nbsp</td>
                            <td><asp:Label ID="lblEditPhone" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Age:</td>
                            <td><asp:Label ID="lblEditAge" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Gender</td>
                            <td><asp:Label ID="lblEditGender" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="auto-style3"></td>
                            <td><asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" CssClass="buttons" Width="108px"/></td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td><asp:Button ID="btndelete" runat="server" Text="delete" OnClick="btndelete_Click"  CssClass="buttons" OnClientClick="return confirm('are you sure you want delete');" Width="108px" />
                                <asp:Label ID="labeldelete" runat="server" ></asp:Label>
                            </td>
                        </tr>
                        </table>
          <table id="edit" class="tableE" runat="server" border="0" >
                        <tr>
                            <td class="auto-style1">Name : </td>
                            <td class="auto-style2"><asp:Label ID="lblEId" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="td">New Username : </td>
                            <td class="tdBox">
                                <asp:TextBox ID="txtNewUsername" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" BackColor="#99FFCC" ControlToValidate="txtNewUsername" ErrorMessage="*This field is required." ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="td">New Password : </td>
                            <td class="tdBox">
                                <asp:TextBox ID="txtNewPassword" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" BackColor="#99FFCC" ControlToValidate="txtNewPassword" ErrorMessage="*This field is required." ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="td">New Email : </td>
                            <td class="tdBox">
                                <asp:TextBox ID="txtNewEmail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" BackColor="#99FFCC" ControlToValidate="txtNewEmail" ErrorMessage="*This field is required." ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" BackColor="#99FFCC" ControlToValidate="txtNewEmail" Display="Dynamic" ErrorMessage="Please Provide Valid Email" ForeColor="#FF9900" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="td">New Phone Number : </td>
                            <td class="tdBox">
                                <asp:TextBox ID="txtNewPhone" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revPhone" runat="server" BackColor="#99FFCC" ControlToValidate="txtNewPhone" Display="Dynamic" ErrorMessage="Please Provide Valid Malaysian Phone Number." ForeColor="#FF9900" ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="td">Age</td>
                            <td class="tdBox">
                                <asp:TextBox ID="txtNewage" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td">Gender:</td>
                            <td class="tdBox">
                                <asp:TextBox ID="txtNewgender" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click"  CssClass="buttons"/>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="Button2" runat="server" Text="Return" OnClick="Button2_Click" CssClass="buttons"/>
                            </td>
                        </tr>
                        </table>
      
      
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True"  DataKeyNames="Id" DataSourceID="SqlDataSource1" CellPadding="4" GridLines="Horizontal" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
             <Columns>
        <asp:BoundField ItemStyle-Width="150px" DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" InsertVisible="False" > 
                 <ItemStyle Width="150px" />
                 </asp:BoundField>
                 <asp:BoundField ItemStyle-Width="150px" DataField="name" HeaderText="name" SortExpression="name" >
                 <ItemStyle Width="150px" />
                 </asp:BoundField>
                 <asp:BoundField ItemStyle-Width="150px" DataField="username" HeaderText="username" SortExpression="username" >
                 <ItemStyle Width="150px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                 <asp:BoundField ItemStyle-Width="150px" DataField="Gender" HeaderText="Gender" SortExpression="Gender" >
                 <ItemStyle Width="150px" />
                 </asp:BoundField>
                 <asp:BoundField ItemStyle-Width="150px" DataField="password" HeaderText="password" SortExpression="password" >
                 <ItemStyle Width="150px" />
                 </asp:BoundField>
                 <asp:BoundField ItemStyle-Width="150px" DataField="email" HeaderText="email" SortExpression="email" >
                 <ItemStyle Width="150px" />
                 </asp:BoundField>
                 <asp:BoundField ItemStyle-Width="150px" DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" >
                 <ItemStyle Width="150px" />
                 </asp:BoundField>
                 <asp:TemplateField ShowHeader="False">
                     <EditItemTemplate>
                         <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                         &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                         &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('are you sure you want delete');"></asp:LinkButton>
                     </ItemTemplate>
                 </asp:TemplateField>
             </Columns>
             <FooterStyle BackColor="White" ForeColor="#333333" />
             <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="White" ForeColor="#333333" />
             <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#F7F7F7" />
             <SortedAscendingHeaderStyle BackColor="#487575" />
             <SortedDescendingCellStyle BackColor="#E5E5E5" />
             <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FeedbackConnection %>" SelectCommand="SELECT * FROM [memberss]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [memberss] WHERE [Id] = @original_Id AND [name] = @original_name AND [username] = @original_username AND [password] = @original_password AND [email] = @original_email AND [PhoneNumber] = @original_PhoneNumber AND (([Gender] = @original_Gender) OR ([Gender] IS NULL AND @original_Gender IS NULL)) AND (([Age] = @original_Age) OR ([Age] IS NULL AND @original_Age IS NULL))" InsertCommand="INSERT INTO [memberss] ([name], [username], [password], [email], [PhoneNumber], [Gender], [Age]) VALUES (@name, @username, @password, @email, @PhoneNumber, @Gender, @Age)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [memberss] SET [name] = @name, [username] = @username, [password] = @password, [email] = @email, [PhoneNumber] = @PhoneNumber, [Gender] = @Gender, [Age] = @Age WHERE [Id] = @original_Id AND [name] = @original_name AND [username] = @original_username AND [password] = @original_password AND [email] = @original_email AND [PhoneNumber] = @original_PhoneNumber AND (([Gender] = @original_Gender) OR ([Gender] IS NULL AND @original_Gender IS NULL)) AND (([Age] = @original_Age) OR ([Age] IS NULL AND @original_Age IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_username" Type="String" />
                <asp:Parameter Name="original_password" Type="String" />
                <asp:Parameter Name="original_email" Type="String" />
                <asp:Parameter Name="original_PhoneNumber" Type="String" />
                <asp:Parameter Name="original_Gender" Type="String" />
                <asp:Parameter Name="original_Age" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="PhoneNumber" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Age" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="PhoneNumber" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Age" Type="Int32" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_username" Type="String" />
                <asp:Parameter Name="original_password" Type="String" />
                <asp:Parameter Name="original_email" Type="String" />
                <asp:Parameter Name="original_PhoneNumber" Type="String" />
                <asp:Parameter Name="original_Gender" Type="String" />
                <asp:Parameter Name="original_Age" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
              <hr />
        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="link" Font-Bold="True" NavigateUrl="~/adminhomepage.aspx">main page</asp:HyperLink>
            </div>
    </form>
</body>
</html>
