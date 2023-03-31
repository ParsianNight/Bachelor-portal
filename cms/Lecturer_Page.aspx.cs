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
    public partial class Lecturer_Page : System.Web.UI.Page
    {

        
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());


        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void CreateMeeting_Click(object sender, EventArgs e)
        {
            Response.Redirect("LCreateMeeting.aspx");
        }

        protected void CreateProject_Click(object sender, EventArgs e)
        {
            Response.Redirect("LCreateLProject.aspx");
        }

        protected void ViewMeeting_Click(object sender, EventArgs e)
        {
            Response.Redirect("LViewMeeting.aspx");
        }

        protected void RecommendEE_Click(object sender, EventArgs e)
        {
            Response.Redirect("LRecommendEE.aspx");
        }

        protected void SuperviseIP_Click(object sender, EventArgs e)
        {
            Response.Redirect("LSuperviseIP.aspx");
        }

        protected void SpecifyDeadline_Click(object sender, EventArgs e)
        {
            Response.Redirect("LSpecifyDeadline.aspx");
        }

        protected void Addtodolist_Click(object sender, EventArgs e)
        {
            Response.Redirect("LAddtodolist.aspx");
        }

        protected void ViewEE_Click(object sender, EventArgs e)
        {
            Response.Redirect("LViewEE.aspx");
        }

        protected void GradeThesis_Click(object sender, EventArgs e)
        {
            Response.Redirect("LGradeThesis.aspx");
        }

        protected void GradeDefense_Click(object sender, EventArgs e)
        {
            Response.Redirect("LGradeDefense.aspx");
        }

        protected void CreatePR_Click(object sender, EventArgs e)
        {
            Response.Redirect("LCreatePR.aspx");
        }

        protected void GradePR_Click(object sender, EventArgs e)
        {
            Response.Redirect("LGradePR.aspx");
        }
    }
}