using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cms
{
    public partial class MakePreferences : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
                Response.Redirect("profile.aspx");


        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

      

        protected void MakePref_Click(object sender, EventArgs e)

        {
            String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string PrefProj1 = PrefProj.Text;
            int PrefNum1 = (int) Convert.ToInt16(PrefNum.Text);
            SqlCommand MakePreferencesLocalProject = new SqlCommand("MakePreferencesLocalProject", conn);
            MakePreferencesLocalProject.CommandType = CommandType.StoredProcedure;
            MakePreferencesLocalProject.Parameters.Add(new SqlParameter("@sid", Session["user_id"]));
            MakePreferencesLocalProject.Parameters.Add(new SqlParameter("@bachelor_code", PrefProj1));
            MakePreferencesLocalProject.Parameters.Add(new SqlParameter("@preference_number", PrefNum1));

             /*
              * 
              * it works as long as there are no wrong inputs 
              * 
              */

            conn.Open();
            int k = MakePreferencesLocalProject.ExecuteNonQuery();
           //  SqlDataReader rdrB = MakePreferencesLocalProject.ExecuteReader(CommandBehavior.CloseConnection);
            conn.Close();
            if(k == 0)
            {
                Response.Write("Please specify a valid project code in your major!");
            }
            else
                Response.Write("Your preferences have been updated!");

        }

        protected void Home(object sender, EventArgs e)
        {
            Response.Redirect("profile.aspx");
        }

    }
}