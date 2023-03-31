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
    public partial class EmployeeGradeThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Employee_Grade_Thesis(object sender, EventArgs e)
        {

            try { 
            String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            int com =  (int)Convert.ToInt64(Session["user_id"]);

            int sid1 = Convert.ToInt16(sid.Text);
            String title1 = title.Text;
            Decimal E_Grade1 = Convert.ToDecimal(E_Grade.Text);
            conn.Open();

            SqlCommand EmployeeGradeThesisproc = new SqlCommand("EmployeeGradeThesis", conn);
            EmployeeGradeThesisproc.CommandType = CommandType.StoredProcedure;


            SqlParameter compID = EmployeeGradeThesisproc.Parameters.Add(new SqlParameter("@Employee_id", SqlDbType.Int));
            compID.Value = com;


            SqlParameter sid12 = EmployeeGradeThesisproc.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            sid12.Value = sid1;

            SqlParameter title12 = EmployeeGradeThesisproc.Parameters.Add(new SqlParameter("@thesis_title", SqlDbType.VarChar, 50));
            title12.Value = title1;

            SqlParameter CG12 = EmployeeGradeThesisproc.Parameters.Add(new SqlParameter("@Employee_grade", SqlDbType.Decimal)
            {
                Precision = 4,
                Scale = 2
            });
            CG12.Value = E_Grade1;


      





            EmployeeGradeThesisproc.ExecuteNonQuery();
            conn.Close();

            Response.Write("thesis is graded");

            }
            catch (Exception ) 
            {

                Response.Write("Invalid data input ");
            }

        }





    }
}