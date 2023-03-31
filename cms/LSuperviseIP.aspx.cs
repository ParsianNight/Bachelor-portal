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
    public partial class LSuperviseIP : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void supevise_Click(object sender, EventArgs e)
        {
            string pCode = pCodeinput.Text;

            SqlCommand superviseIP = new SqlCommand("SuperviseIndustrial", conn);
            superviseIP.CommandType = System.Data.CommandType.StoredProcedure;

            superviseIP.Parameters.Add("@Lecturer_id", Session["user_id"]);
            superviseIP.Parameters.Add("@proj_code", pCode);

            if (pCode != null)
            {
                conn.Open();
                superviseIP.ExecuteNonQuery();
                Response.Write("Supevising Industrial Project" + pCode);
                conn.Close();
            }

            else
            {
                Response.Write("Please Enter Project Code");
            }
        }
    }
}