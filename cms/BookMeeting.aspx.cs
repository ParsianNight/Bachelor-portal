using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Common;

namespace cms
{
    public partial class BookMeeting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
                if (Session["user_id"] == null)
                {
                    Response.Redirect("User_login.aspx");
                }
            }

        protected void BookMeeting_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            /*
             * 
             * it works as long as there are no wrong inputs 
             * 
             */

            conn.Open();



            /*
             
             */

            try
            {
                SqlCommand ViewNotBookedMeetings = new SqlCommand("BookMeeting", conn);
                ViewNotBookedMeetings.CommandType = CommandType.StoredProcedure;
                ViewNotBookedMeetings.Parameters.Add(new SqlParameter("@sid", Session["user_id"]));
                ViewNotBookedMeetings.Parameters.Add(new SqlParameter("@meeting_id", MeetingNum.Text));
                ViewNotBookedMeetings.ExecuteNonQuery();
                Response.Write("Meeting Booked!");

            }
            catch (Exception )
            {
                Response.Write("Error! Please specify a valid meeting ID");

            }   
            //  SqlDataReader rdrB = MakePreferencesLocalProject.ExecuteReader(CommandBehavior.CloseConnection);
            conn.Close();


        }
        public string getWhileLoopData()
        {
            String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand ViewNotBookedMeetings = new SqlCommand("ViewNotBookedMeetings", conn);
            ViewNotBookedMeetings.CommandType = CommandType.StoredProcedure;
            ViewNotBookedMeetings.Parameters.Add(new SqlParameter("@sid", Session["user_id"]));
            string htmlStr = "";
            conn.Open();
            SqlDataReader rdr = ViewNotBookedMeetings.ExecuteReader();

            while (rdr.Read())
            {
                String Meeting1 = "Meeting ID: " + rdr.GetValue(0) + "- Start time: " + rdr.GetValue(2) + "- End time: " + rdr.GetValue(3) + "- Meeting Point: " + rdr.GetValue(4); ;
                htmlStr += Meeting1 + "<br>";
            }
            if(htmlStr .Length == 0)
            {
                conn.Close();
                return " NO AVAILABE MEETINGS!";
            }

            conn.Close();
            return htmlStr;
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

        public void Update(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand ViewNotBookedMeetings = new SqlCommand("StudentAddToDo", conn);
            ViewNotBookedMeetings.CommandType = CommandType.StoredProcedure;
            ViewNotBookedMeetings.Parameters.Add(new SqlParameter("@meeting_id", Add2.Value));
            ViewNotBookedMeetings.Parameters.Add(new SqlParameter("@to_do_list", Add1.Value));
            string htmlStr = "";
            conn.Open();
            try
            {
                ViewNotBookedMeetings.ExecuteNonQuery();
                Response.Write("Added sucessfully!");
            }
            catch
            {
                Response.Write("Meeting id IS WRONG!");
            }
            conn.Close();
        }
    }
}