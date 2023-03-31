using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cms
{
    public partial class LViewMeeting : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ViewM_Click(object sender, EventArgs e)
        {

            int meetingID = 0;
            if (midInput.Text.Length != 0)
            {
                meetingID = Int16.Parse(midInput.Text);
            }

            else 
            {
                meetingID = 0;
            }

            SqlCommand ViewMeetingLecturer = new SqlCommand("ViewMeetingLecturer", conn);
            ViewMeetingLecturer.CommandType = CommandType.StoredProcedure;

            ViewMeetingLecturer.Parameters.Add(new SqlParameter("@Lecturer_id", Session["user_id"]));
            ViewMeetingLecturer.Parameters.Add(new SqlParameter("@meeting_id", meetingID));

            string htmlStr = "";
            conn.Open();
            SqlDataReader rdr = ViewMeetingLecturer.ExecuteReader();

            while (rdr.Read())
            {
                String Prog1 = "Meeting ID: " + rdr.GetValue(0) + " , Lecturer ID: " 
                    + rdr.GetValue(1) + " , Start time: " + rdr.GetValue(2)
                    + " , End time: " + rdr.GetValue(3) + " , Duration: " + rdr.GetValue(4)
                    + " , Date: " + rdr.GetValue(5) + " , Meeting Point: " + rdr.GetValue(6);
                htmlStr += Prog1 + "<br>";
            }

            
            conn.Close();
            Response.Write(htmlStr);

        }
    }
}