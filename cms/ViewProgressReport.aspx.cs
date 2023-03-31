using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cms
{
    public partial class ViewProgressReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
                Response.Redirect("User_login.aspx");
        }
        public String getWhileLoopDataProgressReport()
        {
            if (!IsPostBack)
            {
                String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand ViewMyProgressReports = new SqlCommand("ViewMyProgressReports", conn);
                ViewMyProgressReports.CommandType = CommandType.StoredProcedure;
                ViewMyProgressReports.Parameters.Add(new SqlParameter("@sid", Session["user_id"]));
                ViewMyProgressReports.Parameters.Add(new SqlParameter("@date", DBNull.Value));

                string htmlStr = "";
                conn.Open();
                SqlDataReader rdr = ViewMyProgressReports.ExecuteReader();

                while (rdr.Read())
                {
                    String Prog1 = "Date: " + rdr.GetValue(1) + " Content: " + rdr.GetValue(2) + " grade: " + rdr.GetValue(3);
                    htmlStr += Prog1 + "<br>";
                }

                if (htmlStr.Length == 0)
                {
                    conn.Close();
                    return " NO AVAILABE progress reports!";
                }
                conn.Close();
                return htmlStr;

            }
            return "";
        }
        protected void getWhileLoopDataProgressReport(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand ViewMyProgressReports = new SqlCommand("ViewMyProgressReports", conn);
            ViewMyProgressReports.CommandType = CommandType.StoredProcedure;
            ViewMyProgressReports.Parameters.Add(new SqlParameter("@sid", Session["user_id"]));
            ViewMyProgressReports.Parameters.Add(new SqlParameter("@date", ProgressRep.Text));

            string htmlStr = "";
            conn.Open();
            try
            {
                SqlDataReader rdr = ViewMyProgressReports.ExecuteReader();
                while (rdr.Read())
                {
                    String Prog1 = "Date: " + rdr.GetValue(1) + " Content: " + rdr.GetValue(2) + " grade: " + rdr.GetValue(3);
                    htmlStr += Prog1 + "<br>";

                }
                Label1.Text = htmlStr;

                if (htmlStr.Length == 0)
                {
                    conn.Close();
                    Label1.Text = "No available progress reports!";
                }

            }
            catch
            {
                Response.Write("Enter Date on the following form mm/dd/yyyy");
            }

            conn.Close();

        }
    }
}