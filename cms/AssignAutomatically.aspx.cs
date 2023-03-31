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
    public partial class AssignAutomatically : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
                Response.Redirect("User_login.aspx");
        }
        
        protected void AssignAuto(Object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand AssignAllStudentsToLocalProject = new SqlCommand("AssignAllStudentsToLocalProject", conn);
            AssignAllStudentsToLocalProject.CommandType = CommandType.StoredProcedure;
            conn.Open();
            AssignAllStudentsToLocalProject.ExecuteNonQuery();
            conn.Close();

        }

    }
}