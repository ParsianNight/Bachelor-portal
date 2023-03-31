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
    public partial class EE_Page : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GradeT_Click(object sender, EventArgs e)
        {
            Response.Redirect("EEGradeThesis.aspx");
        }

        protected void GradeD_Click(object sender, EventArgs e)
        {
            Response.Redirect("EEGradeDefense.aspx");
        }
    }
}