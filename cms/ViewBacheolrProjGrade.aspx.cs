using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Policy;

namespace cms
{
    public partial class ViewBacheolrProjGrade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] != null) {
                String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand ViewMyBachelorProjectGrade = new SqlCommand("ViewMyBachelorProjectGrade", conn);
                ViewMyBachelorProjectGrade.CommandType = CommandType.StoredProcedure;
                ViewMyBachelorProjectGrade.Parameters.Add(new SqlParameter("@sid", Session["user_id"]));
                SqlParameter BachelorGrade = new SqlParameter("@BachelorGrade", SqlDbType.Decimal);
                BachelorGrade.Direction = ParameterDirection.Output;
                BachelorGrade.Precision = 4;
                BachelorGrade.Scale = 2;
                BachelorGrade.Value = -1;
                ViewMyBachelorProjectGrade.Parameters.Add(BachelorGrade);
                // Instead of rateParam.Size = 10, set the following, so it matches the SQL structure and StoPro param.

                conn.Open();
                ViewMyBachelorProjectGrade.ExecuteNonQuery();

                conn.Close();
                if (BachelorGrade == null) 
                    Response.Write("Your grade has not been posted yet.");
                else
                gradeProj.InnerText += BachelorGrade.Value;
                
                
            }
            else
            {
                Response.Redirect("user_login.aspx");
            }
        }
    }
}