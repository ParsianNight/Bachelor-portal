using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cms
{
    public partial class Coordinator_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ViewU_Click(object sender, EventArgs e)
        {
            Response.Redirect("CViewUsers.aspx");
        }

        protected void AssignS_Click(object sender, EventArgs e)
        {
            Response.Redirect("CassignASTLP.aspx");
        }

        protected void AssignTA_Click(object sender, EventArgs e)
        {
            Response.Redirect("CAssignTA.aspx");
        }

        protected void ViewR_Click(object sender, EventArgs e)
        {
            Response.Redirect("CViewRecom.aspx");
        }

        protected void ScheduleD_Click(object sender, EventArgs e)
        {
            Response.Redirect("CscheduleD.aspx");
        }

        protected void AssignE_Click(object sender, EventArgs e)
        {
            Response.Redirect("CAssignEE.aspx");
        }
    }
}