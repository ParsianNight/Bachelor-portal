using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cms
{
    public partial class CViewUsers : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cms"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void VUbutt_Click(object sender, EventArgs e)
        {
            SqlCommand ViewUsers = new SqlCommand("ViewUsers", conn);
            ViewUsers.CommandType = System.Data.CommandType.StoredProcedure;
            ViewUsers.Parameters.Add("@User_type", VUuttxt.Text);
            int UID = Int16.Parse(VUuidtxt.Text);
            ViewUsers.Parameters.Add("@User_id", UID);
            string htmlStr = "";
            conn.Open();
            SqlDataReader rdr = ViewUsers.ExecuteReader();
            while (rdr.Read())
            {
                if (VUuttxt.Text == "Student")
                {
                    string data = "Student ID: " + rdr.GetValue(0) + ", First name: " + rdr.GetValue(1) + " , Last Name: " + rdr.GetValue(2) + ", Major Code: " + rdr.GetValue(3) + " , Date Of Birth : " + rdr.GetValue(4) + ", Addres: " + rdr.GetValue(5) + ", Age: " + rdr.GetValue(6) + ", Semester: " + rdr.GetValue(7) + ", GPA: " + rdr.GetValue(8) + ", Total bachelor grade: " + rdr.GetValue(9) + ", Assigned Project Code: " + rdr.GetValue(10);
                    htmlStr += data + "<br>";
                }
                else if (VUuttxt.Text == "Lecturer")
                {
                    string data = "Lecturer ID: " + rdr.GetValue(0) + ", Schedule: " + rdr.GetValue(1);
                    htmlStr += data + "<br>";
                }

                else if (VUuttxt.Text == "Company")
                {
                    string data = "Company ID: " + rdr.GetValue(0) + ", Name: " + rdr.GetValue(1) + " , Reperesentative Name: " + rdr.GetValue(2) + ", Reperesentative Email: " + rdr.GetValue(3) + " , Location: " + rdr.GetValue(4);
                    htmlStr += data + "<br>";
                }

                else if (VUuttxt.Text == "Employee")
                {
                    string data = "Staff ID: " + rdr.GetValue(0) + ", Company ID: " + rdr.GetValue(1) + " , Username: " + rdr.GetValue(2) + " , Email: " + rdr.GetValue(4) + ", Field: " + rdr.GetValue(5) + ", Phone: " + rdr.GetValue(6);
                    htmlStr += data + "<br>";
                }

                else if (VUuttxt.Text == "External Examiner")
                {
                    string data = "EE ID: " + rdr.GetValue(0) + ", Schedule: " + rdr.GetValue(1);
                    htmlStr += data + "<br>";
                }

                else
                {
                    Response.Write("This type of user does not exist");
                    conn.Close();
                }
            }

            if (htmlStr.Length == 0)
            {
                conn.Close();
                Response.Write("There is no such user");
            }
            conn.Close();
            Response.Write(htmlStr);
        }
    }
}