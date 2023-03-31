using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cms
{
    public partial class logedinEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
                Response.Redirect("User_login.aspx");

        }


        protected void EmployeeCreatePR1(object sender, EventArgs e)
        {

            Response.Redirect("EmployeeCreatePR.aspx");


        }

        protected void EmployeeGradedefense1(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeGradedefense.aspx");

        }


        protected void EmployeeGradeThesis1(object sender, EventArgs e)
        {


            Response.Redirect("EmployeeGradeThesis.aspx");

        }




    }
}