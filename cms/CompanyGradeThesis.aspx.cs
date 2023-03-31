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
    public partial class CompanyGradeThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Company_Grade_Thesis(object sender, EventArgs e)
        {

            try
            {
                String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            int com =  (int)Convert.ToInt64(Session["user_id"]);

            int sid1 = Convert.ToInt16(sid.Text);
            String title1 = title.Text;
            Decimal C_Grade1 =Convert.ToDecimal( C_Grade.Text);
            conn.Open();

            SqlCommand CompanyGradeThesis = new SqlCommand("CompanyGradeThesis", conn);
            CompanyGradeThesis.CommandType = CommandType.StoredProcedure;



            SqlParameter compID = CompanyGradeThesis.Parameters.Add(new SqlParameter("@Company_id", SqlDbType.Int));
            compID.Value = com;


            SqlParameter sid12 = CompanyGradeThesis.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            sid12.Value = sid1;

            SqlParameter title12 = CompanyGradeThesis.Parameters.Add(new SqlParameter("@thesis_title", SqlDbType.VarChar, 50));
            title12.Value = title1;

            SqlParameter CG12 = CompanyGradeThesis.Parameters.Add(new SqlParameter("@Company_grade", SqlDbType.Decimal)
            {
                Precision = 4,
                Scale = 2
            });
            CG12.Value = C_Grade1;



            

            CompanyGradeThesis.ExecuteNonQuery();
            conn.Close();
            Response.Write("congratlations thesis has been graded");


            }
            catch (Exception)
            {

                Response.Write("Invalid data input ");
            }



        }




    }
}