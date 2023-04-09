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
    public partial class uuserprofile : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["FeedbackConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["democookie"];
            if (cookie != null)
            {

                TextBox1.Text = cookie["Username"];

            }
        }

        protected void txtusername_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();



                string updateQuery = "UPDATE memberss SET  email=@email, PhoneNumber=@Phone, password=@password WHERE username=@username";
                SqlCommand com = new SqlCommand(updateQuery, conn);
                {
                    com.Parameters.AddWithValue("@username", TextBox1.Text);

                    com.Parameters.AddWithValue("@password", txtpassword.Text);
                    com.Parameters.AddWithValue("@email", txtemail.Text);
                    com.Parameters.AddWithValue("@Phone", txtphonenumber.Text);

                    com.ExecuteNonQuery();

                    Response.Write("<script>alert('You Have Updated Successfully!')</script>");
                    com.Dispose();
                    conn.Close();

                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("view.aspx");
        }
    }
}
