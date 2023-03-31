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
    public partial class CAssignEE : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Assign_Click(object sender, EventArgs e)
        {
            SqlCommand assignEE = new SqlCommand("AssignEE",conn);
            assignEE.CommandType = System.Data.CommandType.StoredProcedure;

            assignEE.Parameters.Add(new SqlParameter("@coordinator_id", Session["user_id"]));
            assignEE.Parameters.Add(new SqlParameter("@EE_id",Int16.Parse(idInput.Text)));
            assignEE.Parameters.Add(new SqlParameter("@proj_code",codInput.Text));

            conn.Open();
            assignEE.ExecuteNonQuery();
            conn.Close();
            Response.Write("Assigned External examiner" + idInput.Text + " to project " + codInput.Text);
        }
    }
}