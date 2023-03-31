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
    public partial class profile : System.Web.UI.Page
    {
        String Role = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] != null)
                try
                {

                    String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
                    SqlConnection conn = new SqlConnection(connStr);

                    conn.Open();

                    SqlCommand User_profile = new SqlCommand("ViewProfile", conn);


                    int ID1 = (int)Convert.ToInt64(Session["user_id"]);

                    User_profile.CommandType = System.Data.CommandType.StoredProcedure;



                    SqlParameter i = User_profile.Parameters.Add(new SqlParameter("@user_id", SqlDbType.Int));
                    i.Value = ID1;


                    User_profile.ExecuteNonQuery();
                    SqlDataReader rdr = User_profile.ExecuteReader();





                    while (rdr.Read())
                    {




                        Int32 ID = rdr.GetInt32(rdr.GetOrdinal("user_id"));
                        String name = rdr.GetString(rdr.GetOrdinal("Username"));
                        Role = rdr.GetString(rdr.GetOrdinal("Role"));
                        String ema = rdr.GetString(rdr.GetOrdinal("Email"));
                        String phone = rdr.GetString(rdr.GetOrdinal("phone_number"));



                        Response.Write("ID: " + ID + " ");

                        Response.Write("name: " + name + " ");


                        Response.Write("Role: " + Role + " ");

                        Response.Write("ema: " + ema + " ");

                        Response.Write("phone: " + phone + " ");




                    }
                    conn.Close();

                }
                catch (Exception)
                {
                    Response.Write("Invalid input");
                }
            else
                Response.Redirect("User_login.aspx");


            }


        protected void priv1(object sender, EventArgs e)
        {



            if (Role == "Company")
            {

                Response.Redirect("logedin_Company.aspx");


            }
            else if (Role == "Employee")
            {
                Response.Redirect("logedinEmployee.aspx");


            }
            else if (Role == "Student")
            {

                Response.Redirect("loggedin_student.aspx");
            }
            else if (Role == "External_Examiner")
            {
                Response.Redirect("EE_Page.aspx");
            }
            else if (Role == "Teaching_Assistant")
            {
                Response.Redirect("TA_Page.aspx");
            }
            else if (Role == "Lecturer")
            {
                Response.Redirect("Lecturer_Page.aspx");

            }
            else if (Role == "Coordinator")
            {
                Response.Redirect("Coordinator_Page.aspx");

            }





        }




    }
    }