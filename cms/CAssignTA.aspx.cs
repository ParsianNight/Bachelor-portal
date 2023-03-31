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
    public partial class CAssignTA : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Assign_Click(object sender, EventArgs e)
        {
            SqlCommand assignTA = new SqlCommand("AssignTAs",conn);
            assignTA.CommandType = System.Data.CommandType.StoredProcedure;

            int UID = Int16.Parse(TAid.Text);
            assignTA.Parameters.Add("@TA_id", UID);
            assignTA.Parameters.Add("@proj_code", PCode.Text);
            assignTA.Parameters.Add("@coordinator_id", Session["user_id"]);

            conn.Open();
            assignTA.ExecuteNonQuery();
            conn.Close();
            Response.Write("Assigned TA" + UID + " to project " + PCode.Text);
        }

      
        }
    }
