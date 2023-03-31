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
    public partial class CViewRecom : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand ViewRecom = new SqlCommand("ViewRecommendation", conn);
            ViewRecom.CommandType = System.Data.CommandType.StoredProcedure;
            int UID = Int16.Parse(VRtxt.Text);
            ViewRecom.Parameters.Add("@lecture_id", UID);
            string htmlStr = "";
            conn.Open();
            SqlDataReader rdr = ViewRecom.ExecuteReader();
            while (rdr.Read())
            {
                string data = "Lecturer ID: " + rdr.GetValue(0) + ", External Examiner ID: " + rdr.GetValue(1) + ", Project Code: " + rdr.GetValue(2);
                htmlStr += data + "<br>";
            }
            if (htmlStr.Length == 0)
            {
                Response.Write("There are no external examiners recommended by this lecturer");
                conn.Close();
            }

            conn.Close();
            Response.Write(htmlStr);
        }
    }
}