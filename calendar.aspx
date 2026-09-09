<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="AcademicCalendar.Calendar" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Academic Calendar</title>
    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
        }
        .container {
            width: 90%;
            margin: 30px auto;
        }
        h1 {
            text-align: center;
            color: #0066cc;
        }
        .calendar {
            margin: 20px auto;
        }
        .grid {
            width: 100%;
            margin-top: 30px;
        }
        .grid th {
            background: #0066cc;
            color: white;
            padding: 10px;
        }
        .grid td {
            padding: 10px;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

<div class="container">

    <h1>Academic Calendar</h1>

    <div style="text-align:center">

        <asp:Calendar ID="calAcademic"
            runat="server"
            CssClass="calendar"
            BackColor="White"
            BorderColor="#999999"
            DayNameFormat="Shortest"
            Font-Names="Verdana"
            Font-Size="10pt"
            ForeColor="Black"
            Height="300px"
            Width="500px"
            OnDayRender="calAcademic_DayRender">

            <SelectedDayStyle
                BackColor="#666666"
                Font-Bold="True"
                ForeColor="White" />

            <SelectorStyle BackColor="#CCCCCC" />

            <TodayDayStyle
                BackColor="#CCCCCC"
                ForeColor="Black" />

            <OtherMonthDayStyle
                ForeColor="#CC9966" />

            <DayHeaderStyle
                BackColor="#CCCCCC"
                Font-Bold="True"
                Font-Size="7pt" />

            <TitleStyle
                BackColor="#0066CC"
                Font-Bold="True"
                Font-Size="12pt"
                ForeColor="White" />

        </asp:Calendar>

    </div>

    <h2>Academic Events</h2>

    <asp:GridView ID="gvEvents"
        runat="server"
        CssClass="grid"
        AutoGenerateColumns="True">
    </asp:GridView>

    <br />

    <asp:Button ID="btnBack" runat="server"
        Text="Back to Dashboard"
        OnClick="btnBack_Click" />

</div>

</form>
</body>
</html>
