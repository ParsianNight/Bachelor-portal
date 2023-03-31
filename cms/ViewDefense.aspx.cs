using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cms
{
    public partial class ViewDefense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand ViewMyDefense = new SqlCommand("ViewMyDefense", conn);
            ViewMyDefense.CommandType = CommandType.StoredProcedure;
            ViewMyDefense.Parameters.Add(new SqlParameter("@sid", Session["user_id"]));
            //open connection
            //execute the procedure
            if (Session["user_id"] != null)
            {
                conn.Open();

                SqlDataReader rdr = ViewMyDefense.ExecuteReader(CommandBehavior.CloseConnection);
                String Defense = "";


                while (rdr.Read())
                {
                    String Defense1 = (String)rdr.GetValue(2);
                    Defense += Defense1 + " ";
                    //creating a lable to put the names in it 
                    
                    def1.InnerHtml = Defense + ",\n";
                    //add lable to the form of this page
                }

                if (Defense.Length == 0)
                {
                    Response.Write("NO AVAILABE defense for you.");
                    conn.Close();
                }

            }
            else
            {
                Response.Redirect("User_login.aspx");
            }



        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        { 


        }
    }
}