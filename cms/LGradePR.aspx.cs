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
    public partial class LGradePR : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GradePR_Click(object sender, EventArgs e)
        {
            int sid = Int16.Parse(sidInput.Text);
            DateTime date = DateTime.Parse(dateInput.Text);
            decimal grade = Convert.ToDecimal(gradeInput.Text);

            SqlCommand gradePR = new SqlCommand("LecGradePR", conn);
            gradePR.CommandType = System.Data.CommandType.StoredProcedure;

            gradePR.Parameters.Add(new SqlParameter("@Lecturer_id", Session["user_id"]));
            gradePR.Parameters.Add(new SqlParameter("@sid", sid));
            gradePR.Parameters.Add(new SqlParameter("@date", date));
            gradePR.Parameters.Add(new SqlParameter("@lecturer_grade", grade));

            if (sid != null && date != null && grade != null)
            {
                conn.Open();
                gradePR.ExecuteNonQuery();
                Response.Write("Succesfully Graded Progress Report");
                conn.Close();
            }

            if (sid == null)
            {
                Response.Write("Please enter student id");
            }

            if (date == null)
            {
                Response.Write("Please enter date");
            }

            if (grade == null)
            {
                Response.Write("Please Enter grade");
            }
        }
    }
}