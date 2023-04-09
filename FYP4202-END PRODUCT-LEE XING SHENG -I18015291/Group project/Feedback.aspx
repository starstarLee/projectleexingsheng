<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="Group_project.Feedback" %>

<!DOCTYPE html>
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <link href="feedbacks.css" rel="stylesheet" />
    <title>Feedback</title>
    </head>
<body style="height: 3px">

    <form id="form1" runat="server" class="box">
          <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" ForeColor="White">
                <DynamicMenuStyle HorizontalPadding="80px" />
                <Items>
                    <asp:MenuItem Text="Homepage" Value="Homepage" NavigateUrl="~/homepages.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="User profile" Value="User profile" NavigateUrl="~/uuserprofile.aspx" ></asp:MenuItem>
                    <asp:MenuItem Text="Booking" Value="Booking" NavigateUrl="~/order.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Feedback" Value="Feedback" NavigateUrl="~/Feedback.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Log out" Value="Log out" NavigateUrl="~/memberlogin.aspx"></asp:MenuItem>
                </Items>
                <StaticMenuItemStyle BackColor="Black" HorizontalPadding="110px" VerticalPadding="10px" />
                <StaticMenuStyle BackColor="White" />
            </asp:Menu>
        <div class="feedback">
        <div style="text-align:center">
         <h2>
Feedback Form</h2>
           
            <div class="form-items">
         <p>Full Name:</p>
                <br />
           <asp:TextBox ID="txtname" runat="server" CssClass="textbox"   placeHolder="Enter your full name"></asp:TextBox >  
          </div>
            <div>
                <p>Contact Number:</p> 
            <br />
           
             <asp:TextBox ID="txtphone" runat="server" CssClass="textbox"  placeHolder="Enter your contact number"></asp:TextBox> <br />
            <asp:RegularExpressionValidator ID="validationphone" runat="server" ErrorMessage="Please enter correct phone number" ControlToValidate="txtphone" ForeColor="Red" ValidationExpression="^(\+?6?01)[0-46-9]- *[0-9]{7,8}$" Font-Size="Small"></asp:RegularExpressionValidator> </div>
     <div>    <p>Email:</p>
         <br />
             <asp:TextBox ID="txtstudentid" runat="server" CssClass="textbox"  placeHolder="Enter your email"></asp:TextBox>  <br />
           <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtstudentid" ErrorMessage="*This field is required." ForeColor="#FF3300" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator> <br />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtstudentid" Display="Dynamic" ErrorMessage="Please Provide Valid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Font-Size="Small"></asp:RegularExpressionValidator></div> 
          
        
    <h5>   <p>Do you happy with our service?</p> 
           
            
            <asp:RadioButtonList ID="rdrate" runat="server" RepeatDirection="Horizontal" CssClass="radio" >
                <asp:ListItem>Satisfied  &nbsp;</asp:ListItem>
                <asp:ListItem>Neutral  &nbsp;</asp:ListItem>
                <asp:ListItem>Disatisfied  &nbsp;</asp:ListItem>
          </asp:RadioButtonList> 
                <br />
          <br />
      <h5>   <p>  How the experience by using the application </p>
             <asp:RadioButtonList ID="rdsa" runat="server" RepeatDirection="Horizontal" CssClass="radio">
                <asp:ListItem>Bad  &nbsp;</asp:ListItem>
                <asp:ListItem>Average</asp:ListItem>
                <asp:ListItem>Good</asp:ListItem>
                 </asp:RadioButtonList>
            <br /> 
               <br /> 
          <h5><p>Message:</p>
            <h5> <asp:TextBox ID="txtsend" runat="server"   placeHolder="write your message here" CssClass="textbox" TextMode="MultiLine"></asp:TextBox></h5>
            <asp:Button ID="btnsubmit" runat="server" Text="Send" CssClass="submit"  OnClick="btnsubmit_Click" />
           
        
            <br />
           
        
            <br />
             <asp:Button ID="btncancel" runat="server" Text="Cancel" OnClick="btncancel_Click" CssClass="cancel"  />

              
        </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FeedbackConnection %>" SelectCommand="SELECT * FROM [Feedback]"></asp:SqlDataSource>
            


        
        <asp:Label ID="Label1" runat="server" ></asp:Label>
            


         </div>
    </form>
   
</body>
</html>
