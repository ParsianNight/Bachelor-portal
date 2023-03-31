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
    public partial class EEGradeThesis : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GradeT_Click(object sender, EventArgs e)
        {
            int sid = Int16.Parse(sidInput.Text);
            string title = titleInput.Text;
            decimal grade = Convert.ToDecimal(gradeInput.Text);

            SqlCommand gradeT = new SqlCommand("EEGradeThesis", conn);
            gradeT.CommandType = System.Data.CommandType.StoredProcedure;

            gradeT.Parameters.Add(new SqlParameter("@EE_id", Session["user_id"]));
            gradeT.Parameters.Add(new SqlParameter("@sid", sid));
            gradeT.Parameters.Add(new SqlParameter("@thesis_title", title));
            gradeT.Parameters.Add(new SqlParameter("@EE_grade", grade));

            if (sid != null && title != null && grade != null)
            {
                conn.Open();
                gradeT.ExecuteNonQuery();
                Response.Write("Succesfully Graded Thesis");
                conn.Close();
            }

            if (sid == null)
            {
                Response.Write("Please enter student id");
            }

            if (title == null)
            {
                Response.Write("Please enter title");
            }

            if (grade == null)
            {
                Response.Write("Please Enter grade");
            }
        }
    }
}