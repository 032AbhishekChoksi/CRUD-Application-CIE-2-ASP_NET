<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CRUDApplication.Employee.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="f1" runat="server">
        <div style="width:100%;text-align:center"><h1>Login Employee</h1><hr /></div>
        <div>
            <table cellspacing="10">
                <tbody>
                    <tr>
                        <td>Email ID:</td>
                        <td>
                            <asp:TextBox ID="txtEmailID" runat="server" placeholder="Enter The Email ID" ToolTip="Enter The Email ID" TabIndex="1" TextMode="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVEmailID" runat="server" ControlToValidate="txtEmailID" ErrorMessage="*" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter The Password" ToolTip="Enter The Password" TabIndex="2" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <%--<asp:RegularExpressionValidator ID="REVPassword" runat="server" ErrorMessage="Password Pattern Not Match" ControlToValidate="txtPassword" ValidationExpression="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,20}$" ForeColor="Red"></asp:RegularExpressionValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <td>
                            <asp:CheckBox ID="chkRememberMe" runat="server" Text="Remeber Me" TabIndex="3"/>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" TabIndex="4"/>
                        </td>
                        <td>
                            <a href="registration.aspx">Registration</a>
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
