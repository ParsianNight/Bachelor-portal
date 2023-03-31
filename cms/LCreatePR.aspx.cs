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
    public partial class LCreatePR : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreatePR_Click(object sender, EventArgs e)
        { 
            int sid = Int16.Parse(sidInput.Text);
            DateTime date = DateTime.Parse(dateInput.Text);
            string content = contentInput.Text;

            SqlCommand createPR = new SqlCommand("LecCreatePR", conn);
            createPR.CommandType = System.Data.CommandType.StoredProcedure;

            createPR.Parameters.Add(new SqlParameter("@Lecturer_id", Session["user_id"]));
            createPR.Parameters.Add(new SqlParameter("@sid", sid));
            createPR.Parameters.Add(new SqlParameter("@date", date));
            createPR.Parameters.Add(new SqlParameter("@content", content));

            if (sid != null && date!= null && content != null)
            {
                conn.Open();
                createPR.ExecuteNonQuery();
                Response.Write("Succefully created Progress report for student id: " + sid);
                conn.Close();
            }

            if (sid == null)
            {
                Response.Write("Enter id for the student");
            }

            if (date == null)
            {
                Response.Write("Enter date for the progress report");
            }

            if (content == null)
            {
                Response.Write("Enter content for the progress report");
            }


        }
    }
}