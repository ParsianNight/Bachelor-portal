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
    public partial class gradeDefenseEx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Grade(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand EEGradeThesis = new SqlCommand("EEGradedefense", conn);
            EEGradeThesis.Parameters.Add(new SqlParameter("@EE_id", Session["user_id"]));

            EEGradeThesis.Parameters.Add(new SqlParameter("@sid", Text1.Value));
            EEGradeThesis.Parameters.Add(new SqlParameter("@defense_location", Text2.Value));
            EEGradeThesis.Parameters.Add(new SqlParameter("@EE_grade", Text3.Value));

            EEGradeThesis.CommandType = CommandType.StoredProcedure;
            conn.Open();

            try
            {
                int t = EEGradeThesis.ExecuteNonQuery();
                if (t == 0)
                    Response.Write("Wrong data entered, please retry again.");
                else
                    Response.Write("Studed graded sucessfully.");
            }
            catch
            {
                Response.Write("Error occured, wrong data enterd.");
            }
            conn.Close();

        }

    }
}