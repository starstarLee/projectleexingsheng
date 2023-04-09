using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_project
{
    public partial class resetpassword : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["FeedbackConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)//reset button
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
              
                string updateQuery = "UPDATE memberss SET username=@Id, password=@password WHERE username=@Id";
                SqlCommand com = new SqlCommand(updateQuery, conn);
                com.Parameters.AddWithValue("@Id", TextBox1.Text);
                com.Parameters.AddWithValue("@password", TextBox2.Text);
              
                com.ExecuteNonQuery();

                Response.Write("<script>alert('Password reset Successfully!')</script>");
                com.Dispose();
                conn.Close();
            }

           

        }
    }
}