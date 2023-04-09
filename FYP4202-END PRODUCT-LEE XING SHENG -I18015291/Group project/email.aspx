<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="email.aspx.cs" Inherits="Group_project.email" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <link href="email.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        body{
              background-image: linear-gradient(#bdc3c7,#2c3e50);
    background-size: cover;
        }
        .auto-style1 {
            width: 600px;
            height: 525px;
        }
        .auto-style2 {
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .auto-style3 {
            width: 101px;
            font-family: "Roboto", sans-serif;
    text-transform: uppercase;
    font-size: 18px;
        }
        .auto-style4 {
            width: 4px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Email Form</h1>
        </div>
        <center>
        <table border="0" cellpadding="0" cellspacing="0" class="auto-style1">
    <tr>
        <td class="auto-style3">To:</td>
        <td><asp:TextBox ID="txtTo" runat="server"  CssClass="textbox"/> <br />     
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid format" ControlToValidate="txtTo" ForeColor="Red"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
    </tr>

    <tr>
        <td class="auto-style3">Title:</td>
        <td><asp:TextBox ID="txtSubject" runat="server" CssClass="textbox"/></td>
    </tr>
    <tr>
        <td valign = "top" class="auto-style3">
            <br />
            <br />
            Message:</td>
        <td><asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine" Height="292px" Width="417px" CssClass="auto-style2"/></td>
    </tr>
    <tr>
        <td class="auto-style3"></td>
        <td><asp:Button ID="btnSend" Text="Send" runat="server" OnClick = "SendEmail" CssClass="button" Height="52px" Width="396px" /></td>
    </tr>
</table>
 </center>
        <hr />
        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="link" Font-Bold="True" NavigateUrl="~/adminhomepage.aspx">main page</asp:HyperLink>
    </form>
</body>
</html>
