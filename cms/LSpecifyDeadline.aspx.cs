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
    public partial class LSpecifyDeadline : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void deadline_Click(object sender, EventArgs e)
        {
            DateTime deadline = DateTime.Parse(deadlineInput.Text);

            SqlCommand tDeadline = new SqlCommand("SpecifyThesisDeadline", conn);
            tDeadline.CommandType = System.Data.CommandType.StoredProcedure;

            tDeadline.Parameters.Add("@deadline", deadline);

            if (deadline != null)
            {
                conn.Open();
                tDeadline.ExecuteNonQuery();
                Response.Write("Succefully Set Deadline for Thesis");
                conn.Close();
            }

            else
            {
                Response.Write("Please specify deadline");
            }
        }
    }
}