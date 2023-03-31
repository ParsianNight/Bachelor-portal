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
    public partial class AssignRecomendations : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
                Response.Redirect("User_login.aspx");
        }

        public string getWhileLoopDataBooked()
        {
            String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand ViewNotBookedMeetings = new SqlCommand("ViewMeeting", conn);
            ViewNotBookedMeetings.CommandType = CommandType.StoredProcedure;
            ViewNotBookedMeetings.Parameters.Add(new SqlParameter("@meeting_id", DBNull.Value));

            ViewNotBookedMeetings.Parameters.Add(new SqlParameter("@sid", Session["user_id"]));
            string htmlStr = "";
            conn.Open();
            SqlDataReader rdr = ViewNotBookedMeetings.ExecuteReader();

            while (rdr.Read())
            {
                String Meeting1 = "Meeting ID: " + rdr.GetValue(0) + "- Start time: " + rdr.GetValue(2) + "- End time: " + rdr.GetValue(3) + "- Meeting Point: " + rdr.GetValue(4); ;
                htmlStr += Meeting1 + "<br>";
            }
            if (htmlStr.Length == 0)
            {
                conn.Close();
                return " NO booked MEETINGS!";
            }

            conn.Close();
            return htmlStr;
        }
    }
}