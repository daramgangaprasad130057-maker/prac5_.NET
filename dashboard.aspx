<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="AcademicCalendar.Dashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial;
            background: #f2f2f2;
        }
        .header {
            background: #0066cc;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .menu {
            text-align: center;
            margin-top: 40px;
        }
        .menu a {
            display: inline-block;
            padding: 15px 25px;
            margin: 10px;
            background: white;
            color: #0066cc;
            text-decoration: none;
            border-radius: 5px;
            box-shadow: 0 0 5px gray;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

<div class="header">
    <h1>Academic Calendar & Leave Management System</h1>
</div>

<div style="text-align:center; margin-top:30px;">
    <asp:Label ID="lblWelcome" runat="server"
        Font-Size="Large" />
    <br /><br />
    <asp:Label ID="lblRole" runat="server" />
</div>

<div class="menu">
    <a href="Calendar.aspx">Academic Calendar</a>
    <a href="Leave.aspx">Apply Leave</a>

    <br />

    <asp:Button ID="btnLogout" runat="server"
        Text="Logout" OnClick="btnLogout_Click" />
</div>

</form>
</body>
</html>
