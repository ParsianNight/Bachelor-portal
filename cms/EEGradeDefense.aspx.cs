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
    public partial class EEGradeDefense : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GradeD_Click(object sender, EventArgs e)
        {
            int sid = Int16.Parse(sidInput.Text);
            string dLoc = locInput.Text;
            decimal grade = Convert.ToDecimal(gradeInput.Text);

            SqlCommand gradeDefense = new SqlCommand("EEGradedefense", conn);
            gradeDefense.CommandType = System.Data.CommandType.StoredProcedure;

            gradeDefense.Parameters.Add(new SqlParameter("@EE_id", Session["user_id"]));
            gradeDefense.Parameters.Add(new SqlParameter("@sid", sid));
            gradeDefense.Parameters.Add(new SqlParameter("@defense_location", dLoc));
            gradeDefense.Parameters.Add(new SqlParameter("@@EE_grade", grade));

            if (sid != null && dLoc != null && grade != null)
            {
                conn.Open();
                gradeDefense.ExecuteNonQuery();
                Response.Write("Succesfully Graded Defense");
                conn.Close();
            }

            if (sid == null)
            {
                Response.Write("Please enter student id");
            }

            if (dLoc == null)
            {
                Response.Write("Please specify location of defense");
            }

            if (grade == null)
            {
                Response.Write("Please Enter grade");
            }
        }
    }
}