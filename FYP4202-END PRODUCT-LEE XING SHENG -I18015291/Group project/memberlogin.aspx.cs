using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

namespace Group_project
{
    public partial class login2 : System.Web.UI.Page
    {
        string usernaame;
        string password;
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("democookie");
            cookie["username"] = txxtusername.Text;
            cookie["password"] = txxxtpassword.Text;
            DateTime now = DateTime.Now;
            cookie.Expires = now.AddMinutes(30);
            Response.Cookies.Add(cookie);
           
         

            try
            {
                SqlConnection connt = new SqlConnection(ConfigurationManager.ConnectionStrings["FeedbackConnection"].ConnectionString);
                connt.Open();
                SqlCommand cmdd = new SqlCommand("Select *FROM [memberss] WHERE username=@username AND password=@password", connt);
                cmdd.Parameters.AddWithValue("@username", txxtusername.Text);
                cmdd.Parameters.AddWithValue("@password", txxxtpassword.Text);
                SqlDataReader dr = cmdd.ExecuteReader();


                if (dr.HasRows)
                {
                    Response.Write("<script>alert('Login Successfully!')</script>");
                    Response.Redirect("homepages.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Username or password not found. Please try again')</script>");
                    lblerror.Text = "Username or password not found. Please try again";
                }

            }
            
            catch (Exception ex)
            {
                Response.Write("ERORR:" + ex.ToString());
            }
           
        }

       
    }
}