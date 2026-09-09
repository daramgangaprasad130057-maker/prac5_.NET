using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI.WebControls;

namespace AcademicCalendar
{
    public partial class Calendar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadEvents();
            }
        }

        private void LoadEvents()
        {
            string cs =
                ConfigurationManager.ConnectionStrings["AcademicDB"]
                .ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query =
                    "SELECT EventName, EventDate, EventType " +
                    "FROM AcademicCalendar ORDER BY EventDate";

                SqlDataAdapter da =
                    new SqlDataAdapter(query, con);

                DataTable dt = new DataTable();

                da.Fill(dt);

                gvEvents.DataSource = dt;
                gvEvents.DataBind();
            }
        }

        protected void calAcademic_DayRender(
            object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date.DayOfWeek == DayOfWeek.Sunday)
            {
                e.Cell.BackColor = Color.LightPink;
            }

            if (e.Day.IsToday)
            {
                e.Cell.BackColor = Color.LightGreen;
                e.Cell.Font.Bold = true;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
}
