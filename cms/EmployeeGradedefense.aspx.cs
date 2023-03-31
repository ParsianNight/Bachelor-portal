using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cms
{
    public partial class EmployeeGradedefense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Employee_Grade_defense(object sender, EventArgs e)
        {

            try
            {
                String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
         
            
            conn.Open();


            int EM = (int)Convert.ToInt64(Session["user_id"]);
            int sid1 = Convert.ToInt16(sid.Text);
            String loc1 = loc.Text;
            Decimal E_Grade1 = Convert.ToDecimal(E_Grade.Text);

            SqlCommand EmployeeGradedefenseproc = new SqlCommand("EmployeeGradedefense", conn);
            EmployeeGradedefenseproc.CommandType = CommandType.StoredProcedure;







            SqlParameter EMID = EmployeeGradedefenseproc.Parameters.Add(new SqlParameter("@Employee_id", SqlDbType.Int));
            EMID.Value = EM;

            SqlParameter sid12 = EmployeeGradedefenseproc.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            sid12.Value = sid1;

            SqlParameter loc12 = EmployeeGradedefenseproc.Parameters.Add(new SqlParameter("@defense_location", SqlDbType.VarChar,5));
            loc12.Value = loc1;

            SqlParameter E_Grade12 = EmployeeGradedefenseproc.Parameters.Add(new SqlParameter("@Employee_grade", SqlDbType.Decimal)
            {
                Precision = 4,
                Scale = 2
            });
            E_Grade12.Value = E_Grade1;






            EmployeeGradedefenseproc.ExecuteNonQuery();
            conn.Close();

            Response.Write("congratlations Defense is graded");
            }
            catch (Exception)
            {

                Response.Write("Invalid data input ");
            }

        }



    }
}