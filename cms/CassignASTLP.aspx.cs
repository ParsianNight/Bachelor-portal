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
    public partial class CassignASTLP : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void assignstudents(object sender, EventArgs e)
        {
            SqlCommand assignStd = new SqlCommand("AssignTAs", conn);
            assignStd.CommandType = System.Data.CommandType.StoredProcedure;

            
            conn.Open();
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[3]
            {
               new DataColumn( "sid"),new DataColumn("PreferenceNumber"),new DataColumn("PCode")
            }
            ) ;

            using  (SqlDataReader reader = assignStd.ExecuteReader())
            {
                while (reader.Read())
                {
                    dt.Rows.Add(reader["sid"], reader["PreferenceNumber"], reader["PCode"]);
                }
            }
            astvGRID.DataSource = dt;
            astvGRID.DataBind();
                conn.Close();
            
        }
    }
    }
