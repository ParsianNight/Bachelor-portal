using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Reflection.Emit;

namespace cms
{
    public partial class CompanyCreateLocalProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }




        protected void CreateLocalProject(object sender, EventArgs e)
        {

            try
            {
                String connStr = WebConfigurationManager.ConnectionStrings["cms"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            int ID =  (int)Convert.ToInt64(Session["user_id"]);
            String p = pcode.Text;
            String name1 = title.Text;
            String des1 = description.Text;
            String maj1 = mcode.Text;

            conn.Open();

            SqlCommand CompanyCreateLocalProjectproc = new SqlCommand("CompanyCreateLocalProject", conn);
            CompanyCreateLocalProjectproc.CommandType = CommandType.StoredProcedure;




            SqlParameter com = CompanyCreateLocalProjectproc.Parameters.Add(new SqlParameter("@ComapnyID", SqlDbType.Int));
            com.Value = ID;// (int)Convert.ToInt64(Session["user_id"]);


            SqlParameter pc = CompanyCreateLocalProjectproc.Parameters.Add(new SqlParameter("@proj_code", SqlDbType.VarChar, 10));
            pc.Value = p;


            SqlParameter tit = CompanyCreateLocalProjectproc.Parameters.Add(new SqlParameter("@title", SqlDbType.VarChar, 50));
            tit.Value = name1;


            SqlParameter des = CompanyCreateLocalProjectproc.Parameters.Add(new SqlParameter("@description", SqlDbType.VarChar, 200));
            des.Value = des1;


            SqlParameter maj = CompanyCreateLocalProjectproc.Parameters.Add(new SqlParameter("@major_code", SqlDbType.VarChar, 10));
            maj.Value = maj1;




      


            
            CompanyCreateLocalProjectproc.ExecuteNonQuery();
            conn.Close();


            Response.Write("The Local Project have been Created");


            }
            catch (Exception)
            {

                Response.Write("Invalid data input ");
            }

        }
    }
}