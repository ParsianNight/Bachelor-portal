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
    public partial class SubmitThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
                Response.Redirect("User_login.aspx");


        }
        protected void Update(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand ViewMyDefense = new SqlCommand("SubmitMyThesis", conn);
            ViewMyDefense.CommandType = CommandType.StoredProcedure;
            ViewMyDefense.Parameters.Add(new SqlParameter("@sid", Session["user_id"]));
            //open connection
            //execute the procedure
                conn.Open();
                String text = Thesis2.Value;
                ViewMyDefense.Parameters.Add(new SqlParameter("@title", text));
                String text1 = Thesis1.Value;
                ViewMyDefense.Parameters.Add(new SqlParameter("@PDF_Document", text1));
                int t  = ViewMyDefense.ExecuteNonQuery();
                conn.Close();
            if (t == 0)
                Response.Write("thesis title is not correct, try agains");
            else
                Response.Write("Submitted sucessfully!");
        }

    }
}