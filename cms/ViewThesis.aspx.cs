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
    public partial class ViewThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
                Response.Redirect("User_login.aspx");
        }

        public void ThesisShow(Object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand ViewMyThesis = new SqlCommand("ViewMyThesis", conn);
            ViewMyThesis.CommandType = CommandType.StoredProcedure;
            ViewMyThesis.Parameters.Add(new SqlParameter("@sid", Session["user_id"]));
            ViewMyThesis.Parameters.Add(new SqlParameter("@title", Thesis.Text));

            string htmlStr = "";
            conn.Open();
            SqlDataReader rdr = ViewMyThesis.ExecuteReader();

            while (rdr.Read())
            {
                String Prog1 = "Title: " + rdr.GetValue(1) + " Deadline: " + rdr.GetValue(2) + " </br> Pdf content: </br>" + rdr.GetValue(3);
                htmlStr += Prog1 + "<br>";
            }

            if (htmlStr.Length == 0)
            {
                conn.Close();
                Response.Write("NO AVAILABE Thesis with that title!");
            }
            conn.Close();
            Response.Write(htmlStr);

        }



    }
}