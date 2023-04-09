<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uuserregister.aspx.cs" Inherits="Group_project.uuserregister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link href="uuregister.css" rel="stylesheet" />
    <title></title>
        <style type="text/css">
           
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="registerform">
                        <h1 >User register form</h1>
                <table id="add" class="table">
                <tr>
                    <td class="auto-style1" >Name:</td>
                    <td class="tdbox">
                        <asp:TextBox ID="Memberid" runat="server" CssClass="textbox" placeHolder="Name" ></asp:TextBox> <br />
                        <asp:RequiredFieldValidator ID="rfvId" runat="server" BackColor="#99FFCC" ControlToValidate="Memberid" ErrorMessage="*This field is required." ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                       
                </tr>
                    <td class="tdBox">
                        &nbsp;</tr>
                <tr>
                    <td class="auto-style1">Username:</td>
                    <td class="tdBox">
                        
                        <asp:TextBox ID="Username" runat="server" CssClass="textbox" placeHolder="Username"></asp:TextBox> <br />
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" BackColor="#99FFCC" ControlToValidate="Username" ErrorMessage="*This field is required." ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="Label1" runat="server" ></asp:Label>
                    </td>
                    <td class="tdBox">  
                      &nbsp; &nbsp; &nbsp;   <asp:Button ID="Button2" runat="server" Text="check avalibility" OnClick="Button2_Click"  CssClass="button"/>
                   </td>
                </tr>
                <tr>
                    <td class="auto-style1">Password:</td>
                    <td class="tdBox">
                        <asp:TextBox ID="Password" runat="server" Type="Password" CssClass="textbox" PlaceHolder="Password"></asp:TextBox> <br />
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" BackColor="#99FFCC" ControlToValidate="Password" ErrorMessage="*This field is required." ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator> <br />
 
                        </td>
                    <td class="tdBox">
                                    <asp:RegularExpressionValidator ID="rpassword" runat="server" ControlToValidate="Password" ErrorMessage="The password must combine with number and alphabet" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" Display="Dynamic"></asp:RegularExpressionValidator>
 
                        </td>
                </tr>
                 <tr>
                    <td class="auto-style1">Confirm Password:</td>
                    <td class="tdBox">
                        <asp:TextBox ID="TextBox1" runat="server" Type="Password" CssClass="textbox" placeHolder="confirm password"></asp:TextBox>  <br />
                         <asp:CompareValidator ID="CompareValidator1" runat="server"     ControlToCompare="Password" ControlToValidate="TextBox1" ErrorMessage="The new password is not match with confirm password" BackColor="Yellow" ForeColor="red" Font-Size="12px"></asp:CompareValidator>
                        </tr>
                    <td class="tdBox">
                        
    
                        </tr>
                <tr>
                    <td class="auto-style1">E-mail:</td>
                    <td class="tdBox">
                        <asp:TextBox ID="Email" runat="server" CssClass="textbox" placeHolder="Email"></asp:TextBox> <br />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" BackColor="#99FFCC" ControlToValidate="Email" ErrorMessage="*This field is required." ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                    <td class="tdBox">
                        <asp:RegularExpressionValidator ID="revEmail" runat="server"  ControlToValidate="Email" Display="Dynamic" ErrorMessage="Please Provide Valid Email" BackColor="Yellow" ForeColor="red" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                
                <tr>
                    <td class="auto-style2">Phone Number:</td>
                    <td class="tdBox">
                        <asp:TextBox ID="Phone" runat="server" CssClass="textbox" placeHolder="Phone Number"></asp:TextBox ><br />  <br /> 
                    </td>
                    <td class="tdBox">
                        <asp:RegularExpressionValidator ID="revPhone" runat="server" BackColor="Yellow" ForeColor="red" ControlToValidate="Phone" Display="Dynamic" ErrorMessage="Please Provide Valid Malaysian Phone Number." 
                            ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$"></asp:RegularExpressionValidator>
                  </td>
                </tr>
                
                <tr>
                    <td class="auto-style1">Gender</td>
                    <td class="tdBox">
                        <br />
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdown">
                            <asp:ListItem>Please select gender</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                         <br /> 
                    </td>
                    <td class="tdBox">
                        &nbsp;</td>
                </tr>
                
                <tr>
                    <td class="auto-style1">Age</td>
                    <td class="tdBox">
                          <asp:TextBox ID="txtage" runat="server" CssClass="textbox" placeHolder="Age" ></asp:TextBox ><br />
                        &nbsp;</td>
                    <td class="tdBox">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
    ControlToValidate="txtage" runat="server"
    ErrorMessage="Only Numbers allowed"
    ValidationExpression="\d+">
</asp:RegularExpressionValidator>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td class="tdBox">
                           <asp:Button ID="Button1" runat="server" Text="Register" CssClass="Login" OnClick="Button1_Click" /> <br />
                    </td>
                    <td class="tdBox">
                           &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="tdBox">

                        <asp:Button ID="login" runat="server" Text="Login" CssClass="Login" OnClick="login_Click" /> 
                    </td>
                    <td class="tdBox">

                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1"><asp:Label ID="lblRegister" runat="server" style="background-color:lavenderblush" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
