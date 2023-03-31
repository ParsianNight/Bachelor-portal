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

namespace cms
{
    public partial class CompanyGradedefense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Company_Grade_Defense(object sender, EventArgs e)
        {

            try
            {
                String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();

            int com =   (int)Convert.ToInt64(Session["user_id"]);

            int sid1 = Convert.ToInt16(sid.Text);
            String loc1 = loc.Text;
            Decimal C_Grade1 = Convert.ToDecimal(C_Grade.Text);

            SqlCommand CompanyGradedefense = new SqlCommand("CompanyGradedefense", conn);
            CompanyGradedefense.CommandType = CommandType.StoredProcedure;







            SqlParameter compID = CompanyGradedefense.Parameters.Add(new SqlParameter("@Company_id", SqlDbType.Int));
            compID.Value = com;


            SqlParameter sid12 = CompanyGradedefense.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            sid12.Value = sid1;

            SqlParameter def12 = CompanyGradedefense.Parameters.Add(new SqlParameter("@defense_location", SqlDbType.VarChar, 5));
            def12.Value = loc1;

            SqlParameter CG12 = CompanyGradedefense.Parameters.Add(new SqlParameter("@Company_grade", SqlDbType.Decimal )
            {
                Precision = 4,
                Scale = 2
            });
            CG12.Value = C_Grade1;
            
            
           
            CompanyGradedefense.ExecuteNonQuery();
            Response.Write(CG12.Value);


            conn.Close();
            Response.Write("congratlations Defense has been graded");


            }
            catch (Exception)
            {

                Response.Write("Invalid data input ");
            }

        }



    }
}