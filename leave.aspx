<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Leave.aspx.cs" Inherits="AcademicCalendar.Leave" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Leave Management</title>
    <style>
        body {
            font-family: Arial;
            background: #f2f2f2;
        }
        .container {
            width: 700px;
            margin: 30px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px gray;
        }
        .input {
            padding: 8px;
            width: 250px;
        }
        .btn {
            padding: 10px 20px;
            background: #0066cc;
            color: white;
            border: none;
        }
        .grid {
            width: 100%;
            margin-top: 30px;
        }
        .grid th {
            background: #0066cc;
            color: white;
            padding: 8px;
        }
        .grid td {
            padding: 8px;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

<div class="container">

    <h1>Leave Application</h1>

    <asp:Label ID="lblUser" runat="server" />

    <br /><br />

    <b>From Date:</b><br />

    <asp:TextBox ID="txtFromDate"
        runat="server"
        CssClass="input" />

    <br /><br />

    <b>To Date:</b><br />

    <asp:TextBox ID="txtToDate"
        runat="server"
        CssClass="input" />

    <br /><br />

    <b>Leave Type:</b><br />

    <asp:DropDownList ID="ddlLeaveType"
        runat="server"
        CssClass="input">

        <asp:ListItem>Casual Leave</asp:ListItem>
        <asp:ListItem>Medical Leave</asp:ListItem>
        <asp:ListItem>Emergency Leave</asp:ListItem>

    </asp:DropDownList>

    <br /><br />

    <b>Reason:</b><br />

    <asp:TextBox ID="txtReason"
        runat="server"
        TextMode="MultiLine"
        Rows="4"
        CssClass="input" />

    <asp:RequiredFieldValidator
        ID="rfvReason"
        runat="server"
        ControlToValidate="txtReason"
        ErrorMessage="Please enter reason"
        ForeColor="Red" />

    <br /><br />

    <asp:Button ID="btnApply"
        runat="server"
        Text="Apply Leave"
        CssClass="btn"
        OnClick="btnApply_Click" />

    <br /><br />

    <asp:Label ID="lblMessage"
        runat="server" />

    <hr />

    <h2>My Leave Applications</h2>

    <asp:GridView ID="gvLeaves"
        runat="server"
        CssClass="grid"
        AutoGenerateColumns="True">
    </asp:GridView>

    <br />

    <asp:Button ID="btnBack"
        runat="server"
        Text="Back"
        OnClick="btnBack_Click" />

</div>

</form>
</body>
</html>
