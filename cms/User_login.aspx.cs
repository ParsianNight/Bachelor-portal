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
    public partial class User_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void registe(object sender, EventArgs e)
        {
                Response.Redirect("register.aspx");
            
        }

    

    protected void userLogin(object sender, EventArgs e)
        {

            try
            {
                String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                String userEmail1 = userEmail.Text;
                String userPassword1 = userPassword.Text;
                SqlCommand UserLoginproc = new SqlCommand("UserLogin", conn);
                UserLoginproc.CommandType = CommandType.StoredProcedure;


                UserLoginproc.Parameters.Add(new SqlParameter("@email", userEmail1));
                UserLoginproc.Parameters.Add(new SqlParameter("@password", userPassword1));
                SqlParameter success = UserLoginproc.Parameters.Add("@success", SqlDbType.Bit);
                SqlParameter user_id = UserLoginproc.Parameters.Add("@user_id", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;
                user_id.Direction = ParameterDirection.Output;


                conn.Open();
                UserLoginproc.ExecuteNonQuery();
                conn.Close();

                Response.Write(success.Value.ToString() + "  " + userEmail1 + "  " + userPassword);
                if (success.Value.ToString() == "True")
                {
                    Session["user_id"] = user_id.Value;
                    Response.Redirect("profile.aspx");



                }
                else
                {
                    Response.Write("unregisted user go back and register");
                }

            }
            catch (Exception) 
            {
                Response.Write("Invalid input");
            }



        }
    }
}