using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace AcademicCalendar
{
    public partial class Leave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                lblUser.Text =
                    "User: " + Session["UserName"].ToString();

                LoadLeaves();
            }
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            DateTime fromDate;
            DateTime toDate;

            if (!DateTime.TryParse(
                txtFromDate.Text, out fromDate))
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Enter valid From Date.";

                return;
            }

            if (!DateTime.TryParse(
                txtToDate.Text, out toDate))
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Enter valid To Date.";

                return;
            }

            if (toDate < fromDate)
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "To Date cannot be before From Date.";

                return;
            }

            string cs =
                ConfigurationManager.ConnectionStrings["AcademicDB"]
                .ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"
                    INSERT INTO LeaveApplication
                    (UserId, FromDate, ToDate, LeaveType, Reason, Status)
                    VALUES
                    (@UserId, @FromDate, @ToDate,
                     @LeaveType, @Reason, 'Pending')";

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue(
                    "@UserId",
                    Convert.ToInt32(Session["UserId"]));

                cmd.Parameters.AddWithValue(
                    "@FromDate", fromDate);

                cmd.Parameters.AddWithValue(
                    "@ToDate", toDate);

                cmd.Parameters.AddWithValue(
                    "@LeaveType",
                    ddlLeaveType.SelectedValue);

                cmd.Parameters.AddWithValue(
                    "@Reason",
                    txtReason.Text);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.ForeColor =
                System.Drawing.Color.Green;

            lblMessage.Text =
                "Leave applied successfully.";

            txtFromDate.Text = "";
            txtToDate.Text = "";
            txtReason.Text = "";

            LoadLeaves();
        }

        private void LoadLeaves()
        {
            string cs =
                ConfigurationManager.ConnectionStrings["AcademicDB"]
                .ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"
                    SELECT LeaveId,
                           FromDate,
                           ToDate,
                           LeaveType,
                           Reason,
                           Status
                    FROM LeaveApplication
                    WHERE UserId=@UserId
                    ORDER BY LeaveId DESC";

                SqlDataAdapter da =
                    new SqlDataAdapter(query, con);

                da.SelectCommand.Parameters.AddWithValue(
                    "@UserId",
                    Convert.ToInt32(Session["UserId"]));

                DataTable dt = new DataTable();

                da.Fill(dt);

                gvLeaves.DataSource = dt;
                gvLeaves.DataBind();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
}
