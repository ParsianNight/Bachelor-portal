using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace cms
{
    public partial class LViewEE : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            //Need to research on how to display a table
            SqlCommand viewEE = new SqlCommand("ViewEE",conn);
            viewEE.CommandType = CommandType.StoredProcedure;

            string htmlStr = "";
            conn.Open();
            SqlDataReader rdr = viewEE.ExecuteReader();

            while (rdr.Read())
            {
                string data = "EE ID: " + rdr.GetValue(0) + ", Schedule: " + rdr.GetValue(1);
                htmlStr += data + "<br>";
            }

            if (htmlStr.Length == 0)
            {
                conn.Close();
                Response.Write("There are no external Examiners that are recommended to any academic projects");
            }

            conn.Close();
            Response.Write(htmlStr);

           
        }


    }
}