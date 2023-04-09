<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userreceipt.aspx.cs" Inherits="Group_project.userreceipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link href="receipt.css" rel="stylesheet" />
    <title></title>
      <style type="text/css">
          .auto-style1 {
              width: 268px;
              background: #fff;
              padding: 60px;
              margin: 100px auto;
              border-radius: 10px;
              position: relative;
              height: 280px;
              left: 0px;
              top: 0px;
          }
          .auto-style2 {
              width: 315px;
              margin-left: 0px;
          }
          .auto-style3 {
              width: 311px;
              height: -12px;
          }
      </style>
</head>
<body style="height: 79px; width: 1339px">
    <form id="form1" runat="server">
        <div class="auto-style1">
            <h1>Receipt of Payment</h1>
             <h3>Customer Name:<asp:Label ID="Label2" runat="server" ></asp:Label>
                 &nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label9" runat="server" Text="Date:"></asp:Label></h3>
            <hr class="auto-style2" />
            <h2>Room Name:<asp:Label ID="Label1" runat="server" ></asp:Label>
                </h2>
          
            <h2>Check-in date:<asp:Label ID="Label3" runat="server" ></asp:Label>
                </h2>
            <h2>check-out date:<asp:Label ID="Label4" runat="server" ></asp:Label>
                </h2>
              <h2>check-in time:<asp:Label ID="Label8" runat="server" ></asp:Label>
                </h2>
               <h2>Bank Payment:<asp:Label ID="Label6" runat="server" ></asp:Label>
                </h2>
             <h2>Day to stay:<asp:Label ID="Label5" runat="server" ></asp:Label>
                </h2>
            <hr class="auto-style3" />
             <h2>Total Price:RM<asp:Label ID="Label7" runat="server" ></asp:Label>
                </h2>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="OK" Width="69px" CssClass="button" />
    
        </div>
       
        <div>
           <h6  >  <asp:Label ID="note" runat="server" Text="Important Note" Cssclass="label" Font-Bold="True"></asp:Label>
         Thank you for the payment, User can screenshot the receipt and we will send the email to the user within 5 days. Thank you</h6>
        </div>
    </form>
</body>
</html>
