<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/EmployeeMaster.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CRUDApplication.Employee.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="server">
    <div style="text-align:center;">
        <h2>
            <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Names="Times New Roman"></asp:Label>
        </h2>
    </div>
    <div style="margin-top:10px;">
        <table cellspacing="10">
            <tbody>
                <tr>
                    <td>Reason:</td>
                    <td>
                        <asp:TextBox ID="txtReason" runat="server" placeholder="Reason" ToolTip="Reason" Rows="5" Columns="25" TextMode="MultiLine" />
                        <asp:RequiredFieldValidator ID="RFVReason" runat="server" ControlToValidate="txtReason"  ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" />
                    </td>
                </tr>
                <tr>
                    <td>From Date:</td>
                    <td>
                        <asp:TextBox ID="txtFromDate" runat="server" ToolTip="From Date" TextMode="Date" />
                        <asp:RequiredFieldValidator ID="RFVFromDate" runat="server" ControlToValidate="txtFromDate"  ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" />
                    </td>
                </tr>
                <tr>
                    <td>To Date:</td>
                    <td>
                        <asp:TextBox ID="txtToDate" runat="server" ToolTip="To Date" TextMode="Date" />
                        <asp:RequiredFieldValidator ID="RFVToDate" runat="server" ControlToValidate="txtToDate"  ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" />
                    </td>
                </tr>
                <tr>
                    <td>Leave Type:</td>
                    <td>
                        <asp:RadioButtonList ID="RBLLeaveType" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Text="Casual" Value="Causal" Selected="True" />
                            <asp:ListItem Text="Sick" Value="Sick" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnApplyLeave" runat="server" Text="Apply Leave" ToolTip="Apply Leave" OnClick="btnApplyLeave_Click" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
