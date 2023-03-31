using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cms
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

      


        }
        protected void Add_Employee(object sender, EventArgs e)
        {

            try
            {
                String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);



            
            conn.Open();

           

          
            int ID = (int)Convert.ToInt64(Session["user_id"]);
          
            SqlCommand AddEmployeeproc = new SqlCommand("AddEmployee", conn);


            SqlParameter compID = AddEmployeeproc.Parameters.Add(new SqlParameter("@ComapnyID", SqlDbType.Int) );
            compID.Value = ID;


            SqlParameter email12 = AddEmployeeproc.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar, 50));
            email12.Value = email.Text;

            SqlParameter name12 = AddEmployeeproc.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar, 20));
            name12.Value = name.Text;

            SqlParameter phone12 = AddEmployeeproc.Parameters.Add(new SqlParameter("@phone_number", SqlDbType.VarChar, 20));
            phone12.Value = phone_number.Text;

            SqlParameter field12 = AddEmployeeproc.Parameters.Add(new SqlParameter("@field", SqlDbType.VarChar, 25));
            field12.Value = field.Text;


            AddEmployeeproc.CommandType = CommandType.StoredProcedure;



            SqlParameter staff_id = AddEmployeeproc.Parameters.Add("@StaffID", SqlDbType.Int);
            SqlParameter com_id = AddEmployeeproc.Parameters.Add("@ComapnyID_OUT", SqlDbType.Int);
            SqlParameter pass = AddEmployeeproc.Parameters.Add("@password", SqlDbType.VarChar,10);

            staff_id.Direction = ParameterDirection.Output;
            com_id.Direction = ParameterDirection.Output;
            pass.Direction = ParameterDirection.Output;


            AddEmployeeproc.ExecuteNonQuery();




            conn.Close();

            if (Convert.ToInt16(staff_id.Value.ToString()) == -1)
            {
                Response.Write("already registered email change the email ");
            }
            else 
            {
                Response.Write("the employee is added");
            }

            }
            catch (Exception)
            {

                Response.Write("Invalid data input ");
            }


        }




    }
}