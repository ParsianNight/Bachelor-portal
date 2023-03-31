using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cms
{
    public partial class logedin_Company : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
                Response.Redirect("User_login.aspx");


        }

        protected void AddEmployee(object sender, EventArgs e)
        {
            Response.Redirect("AddEmployee.aspx");
        }



        protected void CompanyCreateLocalProject(object sender, EventArgs e)
        {
            Response.Redirect("CompanyCreateLocalProject.aspx");

        }


        protected void AssignEmployee(object sender, EventArgs e)
        {
            Response.Redirect("AssignEmployee.aspx");

        }





        protected void CompanyGradeThesis(object sender, EventArgs e)
        {
            Response.Redirect("CompanyGradeThesis.aspx");

        }


        protected void CompanyGradedefense(object sender, EventArgs e)
        {
            Response.Redirect("CompanyGradedefense.aspx");

        }

        protected void CompanyGradePR(object sender, EventArgs e)
        {
            Response.Redirect("CompanyGradePR.aspx");

        }



    }
}