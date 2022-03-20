<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="CRUDApplication.Employee.registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:100%;text-align:center"><h1>Registration Employee</h1><hr /></div>
        <div>
            <table cellspacing="10">
                <tbody>
                    <tr>
                        <td>Name:</td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" placeholder="Enter The Name" ToolTip="Enter The Name" TabIndex="2" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVName" runat="server" ControlToValidate="txtName" ErrorMessage="*" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Email ID:</td>
                        <td>
                            <asp:TextBox ID="txtEmailID" runat="server" placeholder="Enter The Email ID" ToolTip="Enter The Email ID" TabIndex="2" TextMode="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVEmailID" runat="server" ControlToValidate="txtEmailID" ErrorMessage="*" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter The Password" ToolTip="Enter The Password" TabIndex="3" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Confirm Password:</td>
                        <td>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" placeholder="Enter The Password" ToolTip="Enter The Password" TabIndex="4" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="*" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CVPassword" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ErrorMessage="Does Not Match Password" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Resume Upload:</td>
                        <td>
                            <asp:FileUpload ID="FUResume" runat="server" ToolTip="Resume Upload" TabIndex="5" />
                            <asp:RequiredFieldValidator ID="RFVResume" runat="server" ControlToValidate="FUResume" ErrorMessage="*" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnRegister" runat="server" Text="Register" TabIndex="6" OnClick="btnRegister_Click"/>
                        </td>
                        <td>
                            <a href="login.aspx">Login</a>
                        </td>
                    </tr>
                     <tr>
                        <td colspan="2">
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </form>
</body>
</html>
