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
    public partial class CompanyGradePR : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Company_PR(object sender, EventArgs e)
        {
            try
            {

                String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            int com =  (int)Convert.ToInt64(Session["user_id"]);
            int sid1 = Convert.ToInt16(sid.Text);
            DateTime date1 =     Convert.ToDateTime( date.Text);
            Decimal C_Grade1 = Convert.ToDecimal(C_Grade.Text);

            conn.Open();


            SqlCommand CompanyGradePR = new SqlCommand("CompanyGradePR", conn);
            CompanyGradePR.CommandType = CommandType.StoredProcedure;





            SqlParameter compID = CompanyGradePR.Parameters.Add(new SqlParameter("@Company_id", SqlDbType.Int));
            compID.Value = com;


            SqlParameter sid12 = CompanyGradePR.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            sid12.Value = sid1;

            SqlParameter date12 = CompanyGradePR.Parameters.Add(new SqlParameter("@date", SqlDbType.DateTime, 5));
            date12.Value = date1;

            SqlParameter CG12 = CompanyGradePR.Parameters.Add(new SqlParameter("@Company_grade", SqlDbType.Decimal)
            {
                Precision = 4,
                Scale = 2
            });
            CG12.Value = C_Grade1;







            CompanyGradePR.ExecuteNonQuery();
            conn.Close();
            Response.Write("progress report has been graded");
            }
            catch (Exception)
            {

                Response.Write("Invalid data input ");
            }

        }




    }
}