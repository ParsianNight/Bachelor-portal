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
    public partial class LRecommendEE : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RecommendEE_Click(object sender, EventArgs e)
        {
            string pCode = pCodeInput.Text;
            int EE_id = Int16.Parse(EEIDinput.Text);

            SqlCommand recommendEE = new SqlCommand("RecommendEE", conn);
            recommendEE.CommandType = System.Data.CommandType.StoredProcedure;

            recommendEE.Parameters.Add(new SqlParameter("@Lecturer_id", Session["user_id"]));
            recommendEE.Parameters.Add(new SqlParameter("@proj_code", pCode));
            recommendEE.Parameters.Add(new SqlParameter("@EE_id", EE_id));

            if (pCode != null && EE_id != null)
            {
                conn.Open();
                recommendEE.ExecuteNonQuery();
                Response.Write("Successfully Reccomended External Examiner" + EE_id + "to project " + pCode);
                conn.Close();
            }

            if (pCode == null) 
            {
                Response.Write("Please Enter Project Code");
            }

            if (EE_id == null)
            {
                Response.Write("Please Enter External Examiner's ID");
            }
        }
    }
}