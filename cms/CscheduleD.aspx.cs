using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cms
{
    public partial class CscheduleD : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ScheduleDbutt_Click(object sender, EventArgs e)
        {
            SqlCommand scheduleDef = new SqlCommand("ScheduleDefense", conn);
            scheduleDef.CommandType = System.Data.CommandType.StoredProcedure;

            scheduleDef.Parameters.Add("@sid", Int16.Parse(scheduleDSidtxt.Text));
            scheduleDef.Parameters.Add("@date", DateTime.Parse(scheduleDTtxt.Text));
            scheduleDef.Parameters.Add("@time", scheduleDTtxt.Text);
            scheduleDef.Parameters.Add("@location", scheduleDLtxt.Text);

            conn.Open();
            scheduleDef.ExecuteNonQuery();
            Response.Write("Defense scheduled created");
            conn.Close();

        }
    }
}