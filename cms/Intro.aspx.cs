using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cms
{
    public partial class Intro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void login1(object sender, EventArgs e)
        {
            Response.Redirect("User_login.aspx");
        }

        protected void register1(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }



    }
}