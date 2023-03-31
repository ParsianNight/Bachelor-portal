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
    public partial class TA_Page : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreatePR_Click(object sender, EventArgs e)
        {
            Response.Redirect("TACreatePR.aspx");
        }

        protected void AddToDO_Click(object sender, EventArgs e)
        {
            Response.Redirect("TAaddToDo.aspx");
        }
    }
}