<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewbook.aspx.cs" Inherits="Group_project.viewbook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 48%;
            height: 173px;
        }
        .auto-style2 {
            width: 580px;
        }
        .auto-style3 {
            width: 1174px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>  View Homestay Order<br />
                <br />
            </center>
          
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Room Name</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Customer name</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">phone number</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">check in date</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label4" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">check out date</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label5" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">check time</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label6" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Return" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
