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
    public partial class LCreateMeeting : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());    
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateMeeting_Click(object sender, EventArgs e)
        {
            DateTime date = new DateTime();
            date = DateTime.Parse(Date.Text);
            string sTime = Stime.Text;
            string eTime = Etime.Text;
            string mPoint = Meetinpoint.Text;

            SqlCommand createMeeing = new SqlCommand("CreateMeeting", conn);
            createMeeing.CommandType = System.Data.CommandType.StoredProcedure;

            createMeeing.Parameters.Add("@Lecturer_id", Session["user_id"]);
            createMeeing.Parameters.Add("@date", date);
            createMeeing.Parameters.Add("@meeting_point", mPoint);
            createMeeing.Parameters.Add("@start_time", sTime);
            createMeeing.Parameters.Add("@end_time", eTime);

            if (date != null && sTime != null && eTime != null && mPoint != null)
            {
                conn.Open();
                createMeeing.ExecuteNonQuery();
                Response.Write("Meeting created");
                conn.Close();
            }

            if (date == null)
            {
                Response.Write("Please enter date");
            }

            if (sTime == null)
            {
                Response.Write("Please enter start time");
            }

            if (eTime == null)
            {
                Response.Write("Please enter end time");
            }

            if (mPoint == null)
            {
                Response.Write("Please enter meeting point");
            }
        }
    }
}