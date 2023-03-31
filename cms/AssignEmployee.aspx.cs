using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Microsoft.SqlServer.Server;

namespace cms
{
    public partial class AssignEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AssignEmployee1(object sender, EventArgs e)
        {

         try {
                String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);



           // conn.Open();
            SqlCommand AssignEmployeeproc = new SqlCommand("AssignEmployee", conn);

                AssignEmployeeproc.CommandType = System.Data.CommandType.StoredProcedure;

                

            SqlParameter bach = AssignEmployeeproc.Parameters.Add(new SqlParameter("@bachelor_code", SqlDbType.VarChar, 10));
            bach.Value = bcode.Text;


            SqlParameter staf = AssignEmployeeproc.Parameters.Add(new SqlParameter("@staff_id", SqlDbType.Int));
            staf.Value = Int32.Parse(staff_id.Text);


            SqlParameter com = AssignEmployeeproc.Parameters.Add(new SqlParameter("@Company_id", SqlDbType.Int));
            com.Value =  (int)Convert.ToInt64(Session["user_id"]);

            SqlParameter staff_id2 = AssignEmployeeproc.Parameters.Add("@staff_id_OUT", SqlDbType.Int);
            staff_id2.Direction = ParameterDirection.Output;

            GridView12.Visible = true;

            conn.Open();

            AssignEmployeeproc.ExecuteNonQuery();


               


                if (staf.Value.ToString() == "-1") 
            {
                Response.Write("UNREGISTERED EMPLOYEE");

            }
            else {

                Response.Write("the employee with staff id :"+ staf.Value+" has been assigned to the project ");


                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = AssignEmployeeproc;
                DataTable dt = new DataTable();
                da.Fill(dt);
                conn.Close();
                GridView12.DataSource = dt;
                GridView12.DataBind();


            }
            conn.Close();
          }

            catch (Exception)
            {

                Response.Write("Invalid data input ");
            }




        }


    }
}