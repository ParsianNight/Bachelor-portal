using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cms
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login(object sender, EventArgs e)
        {
            try
            {
                String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                String usertype1 = usertype.Text;
                String userName1 = Username.Text;
                String email1 = email.Text;
                String first_name1 = first_name.Text;

                String last_name1 = last_name.Text;

                //            TypeVarCharSchemaImporterExtension
                //                          TypeNVarCharSchemaImporterExtension

                DateTime birth_date1 = Convert.ToDateTime(birth_date.Text, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat); 
                
                Decimal GPA1 = Convert.ToDecimal(GPA.Text);
                int semester1 = Convert.ToInt16(semester.Text);
                String address1 = address.Text;
                String faculty_code1 = faculty_code.Text;
                String major_code1 = major_code.Text;
                String company_name1 = company_name.Text;
                String representative_name1 = representative_name.Text;
                String representative_email1 = representative_email.Text;
                String phone_number1 = phone_number.Text;
                String country_of_residence1 = country_of_residence.Text;

                SqlCommand UserRegister = new SqlCommand("UserRegister", conn);
                UserRegister.CommandType = CommandType.StoredProcedure;

                UserRegister.CommandType = CommandType.StoredProcedure;

                UserRegister.Parameters.Add(new SqlParameter("@usertype", usertype1));
                UserRegister.Parameters.Add(new SqlParameter("@userName", userName1));
                UserRegister.Parameters.Add(new SqlParameter("@email", email1));
                UserRegister.Parameters.Add(new SqlParameter("@phone_number", phone_number1));



                SqlParameter password = UserRegister.Parameters.Add("@password", SqlDbType.VarChar, 10);
                SqlParameter user_id = UserRegister.Parameters.Add("@user_id", SqlDbType.Int);

                user_id.Direction = ParameterDirection.Output;
                password.Direction = ParameterDirection.Output;


                if (usertype1 != "Student" && usertype1 != "Company" && usertype1 == "Lecturer" && usertype1 != "Teaching_Assistant" && usertype1 != "External_Examiner" && usertype1 != "Coordinator" && usertype1 != "external_supervisor")
                    Response.Write("Please enter a valid user type!");
                else
                {
                    if (usertype1 == "Student")
                    {

                        //company inputs
                        UserRegister.Parameters.Add(new SqlParameter("@country_of_residence", DBNull.Value));
                        UserRegister.Parameters.Add(new SqlParameter("@representative_name", DBNull.Value));
                        UserRegister.Parameters.Add(new SqlParameter("@representative_email", DBNull.Value));
                        UserRegister.Parameters.Add(new SqlParameter("@company_name", DBNull.Value));


                        UserRegister.Parameters.Add(new SqlParameter("@faculty_code", faculty_code1));




                        UserRegister.Parameters.Add(new SqlParameter("@first_name", first_name1));
                        UserRegister.Parameters.Add(new SqlParameter("@last_name", last_name1));
                        UserRegister.Parameters.Add(new SqlParameter("@major_code", major_code1));
                        UserRegister.Parameters.Add(new SqlParameter("@birth_date", birth_date1));
                        UserRegister.Parameters.Add(new SqlParameter("@address", address1));
                        UserRegister.Parameters.Add(new SqlParameter("@GPA", GPA1));
                        UserRegister.Parameters.Add(new SqlParameter("@semester", semester1));



                    }
                    else if (usertype1 == "Company")
                    {

                        //student inputs
                        UserRegister.Parameters.Add(new SqlParameter("@first_name", DBNull.Value));
                        UserRegister.Parameters.Add(new SqlParameter("@last_name", DBNull.Value));
                        UserRegister.Parameters.Add(new SqlParameter("@major_code", DBNull.Value));
                        UserRegister.Parameters.Add(new SqlParameter("@birth_date", DBNull.Value));
                        UserRegister.Parameters.Add(new SqlParameter("@address", DBNull.Value));
                        UserRegister.Parameters.Add(new SqlParameter("@GPA", DBNull.Value));
                        UserRegister.Parameters.Add(new SqlParameter("@semester", DBNull.Value));

                        UserRegister.Parameters.Add(new SqlParameter("@faculty_code", DBNull.Value));


                        UserRegister.Parameters.Add(new SqlParameter("@country_of_residence", country_of_residence1));
                        UserRegister.Parameters.Add(new SqlParameter("@representative_name", representative_name1));
                        UserRegister.Parameters.Add(new SqlParameter("@representative_email", representative_email1));
                        UserRegister.Parameters.Add(new SqlParameter("@company_name", company_name1));



                        //UserRegister.Parameters.Add(new SqlParameter("@representative_email", DBNull.Value));

                    }


                    // any other user type willbe inserted after inserting into user AS other types need id only
                    else
                    {
                        //company inputs
                        UserRegister.Parameters.Add(new SqlParameter("@country_of_residence", DBNull.Value));
                        UserRegister.Parameters.Add(new SqlParameter("@representative_name", DBNull.Value));
                        UserRegister.Parameters.Add(new SqlParameter("@representative_email", DBNull.Value));
                        UserRegister.Parameters.Add(new SqlParameter("@company_name", DBNull.Value));

                        //student inputs
                        UserRegister.Parameters.Add(new SqlParameter("@country_of_residence", DBNull.Value));
                        UserRegister.Parameters.Add(new SqlParameter("@first_name", DBNull.Value));
                        UserRegister.Parameters.Add(new SqlParameter("@last_name", DBNull.Value));
                        UserRegister.Parameters.Add(new SqlParameter("@major_code", DBNull.Value));
                        UserRegister.Parameters.Add(new SqlParameter("@birth_date", DBNull.Value));
                        UserRegister.Parameters.Add(new SqlParameter("@address", DBNull.Value));
                        UserRegister.Parameters.Add(new SqlParameter("@GPA", DBNull.Value));
                        UserRegister.Parameters.Add(new SqlParameter("@semester", DBNull.Value));


                        UserRegister.Parameters.Add(new SqlParameter("@faculty_code", DBNull.Value));


                    }

                    conn.Open();
                    UserRegister.ExecuteNonQuery();

                    conn.Close();

                    if (Convert.ToInt16(user_id.Value.ToString()) != 0)
                    {
                        Session["user_id"] = user_id.Value;

                        Response.Write("Your id is " + user_id.Value);
                        Response.Write(" Your password is " + password.Value);

                        // profile_priv.



                    }

                    else
                    {
                        Response.Write("already existed mail try another one ");

                    }
                }
            }
            catch (Exception ea)
            {
                
                Response.Write(ea);
            }

        }


        protected void profile_priv121(object sender, EventArgs e)
        {

                Response.Redirect("User_login.aspx");
        }

    }
}