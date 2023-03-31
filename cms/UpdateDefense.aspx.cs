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
    public partial class UpdateDefense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
                Response.Redirect("User_login.aspx");


            if (!IsPostBack)
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

                        Def1.Value = Defense + "";
                        //add lable to the form of this page
                    }


                }
                else
                {
                    Response.Redirect("User_login.aspx");
                }
            }
        }
        protected void Update(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand ViewMyDefense = new SqlCommand("UpdateMyDefense", conn);
            ViewMyDefense.CommandType = CommandType.StoredProcedure;
            ViewMyDefense.Parameters.Add(new SqlParameter("@sid", Session["user_id"]));
            //open connection
            //execute the procedure
            if (Session["user_id"] != null)
            {
                conn.Open();
                String text = Def1.InnerText;
                ViewMyDefense.Parameters.Add(new SqlParameter("@defense_content", text));

                ViewMyDefense.ExecuteNonQuery();
                conn.Close();
                Response.Write("Updated defense successfully!");
            }
            else
            {
                Response.Redirect("User_login.aspx");
            }
        }

    }
}