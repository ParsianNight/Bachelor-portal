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
    public partial class EmployeeCreatePR : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Employee_Grade_PR(object sender, EventArgs e)
        {

            try
            {
                String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            int EM =  (int)Convert.ToInt64(Session["user_id"]);
            int sid1 = Convert.ToInt16(sid.Text);
            String Content1 = Content.Text;
            DateTime Date1 = Convert.ToDateTime(Date.Text);


            conn.Open();

            SqlCommand EmployeeCreatePRproc = new SqlCommand("EmployeeCreatePR", conn);
            EmployeeCreatePRproc.CommandType = CommandType.StoredProcedure;




            SqlParameter EMID = EmployeeCreatePRproc.Parameters.Add(new SqlParameter("@Employee_id", SqlDbType.Int));
            EMID.Value = EM;


            SqlParameter sid12 = EmployeeCreatePRproc.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            sid12.Value = sid1;

            SqlParameter Date12  = EmployeeCreatePRproc.Parameters.Add(new SqlParameter("@date", SqlDbType.DateTime));
            Date12.Value = Date1;

            SqlParameter Content12 = EmployeeCreatePRproc.Parameters.Add(new SqlParameter("@content", SqlDbType.VarChar,1000));
            Content12.Value = Content1;





            EmployeeCreatePRproc.ExecuteNonQuery();
            conn.Close();

            Response.Write("progress report is graded");


            }
            catch (Exception)
            {

                Response.Write("Invalid data input ");
            }


        }



    }
}