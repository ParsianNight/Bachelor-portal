using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace cms
{
    public partial class viewBachelorProjects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
                Response.Redirect("User_login.aspx");


            String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand ViewNotBookedMeetings = new SqlCommand("SELECT * FROM Bachelor_Project b INNER JOIN MajorHasBachelorProject m ON b.Code =m.Project_code INNER JOIN Major mm ON mm.Major_code =m.Major_code ", conn);
            string htmlStr = "";
            htmlStr+=  "<table><tr>    <th>Project code</th>    <th>Project name</th>    <th>project description</th><th>Major name</th><tr/> " ;

            conn.Open();
            SqlDataReader rdr = ViewNotBookedMeetings.ExecuteReader();

            while (rdr.Read())
            {
                htmlStr +=  "<tr><td>" + rdr.GetValue(0) + "</td><td>" + rdr.GetValue(1) + "</td><td>" + rdr.GetValue(2) + "</td><td>"+rdr.GetValue(5) +"</td></tr> ";
            }
            htmlStr += "<table/>";
            table.Text = htmlStr;
            conn.Close();

        }
    }
}