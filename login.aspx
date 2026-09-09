using System;
using System.Configuration;
using System.Data.SqlClient;

namespace AcademicCalendar
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["Username"] != null)
                {
                    txtUsername.Text =
                        Request.Cookies["Username"].Value;

                    chkRemember.Checked = true;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string cs =
                ConfigurationManager.ConnectionStrings["AcademicDB"]
                .ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query =
                    "SELECT UserId, UserName, Role FROM Users " +
                    "WHERE UserName=@UserName AND Password=@Password";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@UserName",
                    txtUsername.Text);

                cmd.Parameters.AddWithValue("@Password",
                    txtPassword.Text);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    Session["UserId"] = dr["UserId"].ToString();
                    Session["UserName"] = dr["UserName"].ToString();
                    Session["Role"] = dr["Role"].ToString();

                    if (chkRemember.Checked)
                    {
                        Response.Cookies["Username"].Value =
                            txtUsername.Text;

                        Response.Cookies["Username"].Expires =
                            DateTime.Now.AddDays(30);
                    }
                    else
                    {
                        Response.Cookies["Username"].Expires =
                            DateTime.Now.AddDays(-1);
                    }

                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    lblMessage.Text =
                        "Invalid Username or Password";
                }

                dr.Close();
            }
        }
    }
}
