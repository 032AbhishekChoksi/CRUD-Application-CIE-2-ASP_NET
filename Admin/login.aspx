<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CRUDApplication.Admin.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
      <form id="f1" runat="server">
        <div style="width:100%;text-align:center"><h1>Login Admin</h1><hr /></div>
        <div>
            <table cellspacing="10">
                <tbody>
                    <tr>
                        <td>Name:</td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" placeholder="Enter The Name" ToolTip="Enter The Name" TabIndex="1" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVName" runat="server" ControlToValidate="txtName" ErrorMessage="*" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter The Password" ToolTip="Enter The Password" TabIndex="2" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                   
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" TabIndex="4"/>
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
