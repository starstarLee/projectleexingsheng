<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="chessclub.cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <link href="orderconfirmation.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
      
        table{
            border: 1px;
            border-color:snow;
        }
        tr{
            font-size:25px;
            color:lightblue;
            text-align:center;
        }
        .auto-style1 {
            text-align: center;
        }
       
        .auto-style2 {
            width: 189px;
            background: #fff;
            padding: 80px;
            margin: 40px auto;
            border-radius: 10px;
            position: relative;
            left: 11px;
            top: 122px;
            height: 360px;
        }
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style2">
                         <h2 style="color:wheat">Confirm your order</h2>
            <h3>Room Name:</h3> <asp:TextBox ID="lblNames" runat="server" CssClass="textbox"></asp:TextBox> <br />
           
            <h1>Price:</h1>
            
            <asp:TextBox ID="lblPrices" runat="server" CssClass="textbox"></asp:TextBox><br />
                         
            <h1>Day of Books:  </h1><asp:TextBox ID="txtdayofstay" runat="server" TextMode="Number"  CssClass="textbox">1</asp:TextBox><br />
                       
            <h1>Bank Payment:</h1><asp:DropDownList ID="ddbank" runat="server" CssClass="dd">
                                <asp:ListItem>Select bank</asp:ListItem>
                                <asp:ListItem>Maybank</asp:ListItem>
                                <asp:ListItem>Public Bank</asp:ListItem>
                                <asp:ListItem>Heong Leong Bank</asp:ListItem>
                                <asp:ListItem>CIMB Bank</asp:ListItem>
                            </asp:DropDownList>
                         <br />
                         <h1>Total:<asp:Label ID="Label1" runat="server" Text="RM"></asp:Label><asp:Label ID="lbltotalprice" runat="server"></asp:Label>
                             <asp:Button ID="btnTotal" runat="server" Text="Total" OnClick="btnTotal_Click" CssClass="btn"></asp:Button></h1>
              <asp:Button ID="btnback" runat="server" Text="PAYMENT" OnClick="btnback_Click"   OnClientClick="return confirm('Are you sure you want make payment');" CssClass="button"/> <br />
             <asp:Button ID="Button1" runat="server" Text="next" OnClick="Button1_Click"  CssClass="button"  />
                         
            </div>

       
    
        <div class="auto-style1">
          
        </div>
    </form>
</body>
</html>
