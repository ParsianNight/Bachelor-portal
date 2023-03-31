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
    public partial class loggedin_student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
                Response.Redirect("User_login.aspx");
        }




        protected void preferencesproc(object sender, EventArgs e)
        {
            Response.Redirect("MakePreferences.aspx");
        }

        protected void View_their_thesisproc(object sender, EventArgs e)
        {
            Response.Redirect("ViewThesis.aspx");

        }


        protected void Submit_their_thesisproc(object sender, EventArgs e)
        {
            Response.Redirect("SubmitThesis.aspx");
        }

        protected void View_progress_reportsproc(object sender, EventArgs e)
        {
            Response.Redirect("ViewProgressReport.aspx");
        }


        protected void View_defenseproc(object sender, EventArgs e)
        {
            Response.Redirect("ViewDefense.aspx");
        }

        protected void Update_defense_contentproc(object sender, EventArgs e)
        {
            Response.Redirect("UpdateDefense.aspx");
        }


        protected void View_bachelor_project_gradeproc(object sender, EventArgs e)
        {
            Response.Redirect("ViewBacheolrProjGrade.aspx");
        }

        protected void View_meetings_that_are_not_bookedproc(object sender, EventArgs e)
        {
            Response.Redirect("BookMeeting.aspx");
        }


        protected void Book_meeting_with_their_lecturerproc(object sender, EventArgs e)
        {
            Response.Redirect("BookMeeting.aspx");

        }

        protected void View_booked_meetingsproc(object sender, EventArgs e)
        {
            Response.Redirect("BookMeeting.aspx");

        }


        protected void Add_to_the_to_do_list_in_meetingsproc(object sender, EventArgs e)
        {
            Response.Redirect("BookMeeting.aspx");

        }




    }
}