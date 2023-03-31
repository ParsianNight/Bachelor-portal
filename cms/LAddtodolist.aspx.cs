using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cms
{
    public partial class LAddtodolist : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ConfirmAdding_Click(object sender, EventArgs e)
        {

            int meetingID = Int16.Parse(MeetingID.Text);
            String toDoList = Addtodolist.Text;

            SqlCommand lAddtodoProc = new SqlCommand("LecturerAddToDo", conn);
            lAddtodoProc.CommandType = System.Data.CommandType.StoredProcedure;
            lAddtodoProc.Parameters.Add(new SqlParameter("@meeting_id", meetingID));
            lAddtodoProc.Parameters.Add(new SqlParameter("@to_do_list", toDoList));

            if (meetingID != null && toDoList != null)
            {
                conn.Open();
                lAddtodoProc.ExecuteNonQuery();
                Response.Write("Succesfully added to the do do list");
                conn.Close();
            }

            if (meetingID == null)
            {
                Response.Write("Please specify the meeting");
            }

            if (toDoList == null) 
            {
                Response.Write("Please specify what to to add to the to do list");
            }

        }
    }
}