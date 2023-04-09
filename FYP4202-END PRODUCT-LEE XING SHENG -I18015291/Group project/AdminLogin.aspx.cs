using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_project
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connt = new SqlConnection(ConfigurationManager.ConnectionStrings["FeedbackConnection"].ConnectionString);
                connt.Open();
                SqlCommand cmdd = new SqlCommand("Select *FROM [Admin] WHERE Username=@username AND Password=@password", connt);
                cmdd.Parameters.AddWithValue("@username", adminusername.Text);
                cmdd.Parameters.AddWithValue("@password", adminpassword.Text);
                SqlDataReader dr = cmdd.ExecuteReader();
             

                if (!dr.HasRows)

                {
                 
                
                    Label1.Text = "Username or password not found. Please try again";

                }
                else
                {
                    Response.Redirect("adminhomepage.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("ERORR:" + ex.ToString());
            }
        }
    }
}