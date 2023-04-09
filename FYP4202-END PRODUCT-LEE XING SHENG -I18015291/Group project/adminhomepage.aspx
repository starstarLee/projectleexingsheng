<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminhomepage.aspx.cs" Inherits="Group_project.adminhomepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 200px;
            background-color:black;
        }
        .auto-style2 {
            height: 459px;
             background-color:black;
        }
        .auto-style3 {
            height: 523px;
        }
        .auto-style4 {
            width: 1258px;
            height: 356px;
            margin-right: 66px;
        }
        .auto-style5 {
            width: 481px;
        }
        .auto-style6 {
            width: 481px;
            height: 244px;
        }
        .auto-style7 {
            height: 244px;
              width: 380px;
        }
        .auto-style8 {
            width: 530px;
            height: 244px;
        }
        .auto-style9 {
            width: 530px;
        }
        h1{
            color: #ffffff; font-family: 'Lato', sans-serif; font-size: 60px; font-weight: 300; line-height: 58px; margin: 0 0 58px;
          top:60px;  text-transform: uppercase;
          position:relative;
        }
        .h1{
            color: #777;
    font-family: "Roboto", sans-serif;
    text-transform: uppercase;
    font-size: 12px;
    letter-spacing: 1px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <center>
          <h1>Welcome back to the Admin Main Page</h1>
                </center>
        </div>
        <center>
          <div class="auto-style3">
        
             
              <table class="auto-style4">
                  <tr>
                      <td class="auto-style6">
                          <asp:ImageButton ID="ImageButton1" runat="server" Height="182px" ImageUrl="~/images/booking.png" Width="246px" OnClick="ImageButton1_Click" /> <br />
                          <asp:Label ID="Label1" runat="server" Text="Homestay booking record" CssClass="h1"></asp:Label>
                      </td>
                      <td class="auto-style8">
                          &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" Height="184px" Width="176px" ImageUrl="~/images/feedbackx.png" OnClick="ImageButton2_Click" /><br />
                          <asp:Label ID="Label2" runat="server" Text="Feedback record" CssClass="h1"></asp:Label>
                      </td>
                      <td class="auto-style7">
                          <asp:ImageButton ID="ImageButton3" runat="server"  Height="184px" Width="220px" ImageUrl="~/images/icon.png" OnClick="ImageButton3_Click" /><br />
                          <asp:Label ID="Label3" runat="server" Text="check user record"  CssClass="h1"></asp:Label>
                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style5">
                        &nbsp; &nbsp;   <asp:ImageButton ID="ImageButton4" runat="server" Height="184px" Width="221px" ImageUrl="~/images/568148.png" OnClick="ImageButton4_Click"  /><br />
                          <asp:Label ID="Label4" runat="server" Text="send email" CssClass="h1"></asp:Label>
                      </td>
                      <td class="auto-style9">
                          <asp:ImageButton ID="ImageButton5" runat="server" Height="184px" Width="176px" ImageUrl="~/images/add.png" OnClick="ImageButton5_Click"  /><br />
                          <asp:Label ID="Label5" runat="server" Text="Add product" CssClass="h1"></asp:Label>
                      </td>
                      <td>
                          <asp:ImageButton ID="ImageButton6" runat="server" Height="184px" Width="176px" ImageUrl="~/images/126467.png" OnClick="ImageButton6_Click"  /><br />
                          <asp:Label ID="Label6" runat="server" Text="log out" CssClass="h1"></asp:Label>
                      </td>
                  </tr>
              </table>
            
             
        </div>
             </center>
          <div class="auto-style2">
        </div>
    </form>
</body>
</html>
