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
    public partial class LCreateLProject : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateP_Click(object sender, EventArgs e)
        {
            string pCode = PCodeinput.Text;
            string title = Titleinput.Text;
            string description = DecInput.Text;
            string mCode = majorInput.Text;

            SqlCommand lCreateLPproc = new SqlCommand("LecturerCreateLocalProject",conn);
            lCreateLPproc.CommandType = System.Data.CommandType.StoredProcedure;

            lCreateLPproc.Parameters.Add(new SqlParameter("@Lecturer_id", Session["user_id"]));
            lCreateLPproc.Parameters.Add(new SqlParameter("@title", title));
            lCreateLPproc.Parameters.Add(new SqlParameter("@description", description));
            lCreateLPproc.Parameters.Add(new SqlParameter("@proj_code", pCode));
            lCreateLPproc.Parameters.Add(new SqlParameter("@major_code", mCode));

            if (pCode != null && title != null && description != null && mCode != null)
            {
                conn.Open();
                lCreateLPproc.ExecuteNonQuery();
                Response.Write("Succesfully Created Local Project");
                conn.Close();
            }

            if (pCode == null)
            {
                Response.Write("Please specify the project code");
            }

            if (title == null)
            {
                Response.Write("Please specify the project title");
            }

            if (description == null)  
            {
                Response.Write("Please enter description for the project");
            }

            if (mCode == null)
            {
                Response.Write("Please specify major");
            }
        }

        
    }
}