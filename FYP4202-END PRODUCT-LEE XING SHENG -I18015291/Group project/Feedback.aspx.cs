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
    public partial class Feedback : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        protected void ddproblem_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {


            
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["FeedbackConnection"].ConnectionString);
                conn.Open();
          
            string insertQuery = "insert into Feedbackk(Name,Phone,Email,rate,problem,comment)values (@Name,@Phone,@Email,@rate,@problem,@comment)";
                SqlCommand cmd = new SqlCommand(insertQuery, conn);
           
            cmd.Parameters.AddWithValue("@Name",txtname.Text);
                cmd.Parameters.AddWithValue("@Phone", txtphone.Text);
                cmd.Parameters.AddWithValue("@Email", txtstudentid.Text);
                cmd.Parameters.AddWithValue("@rate", rdrate.SelectedValue);
                cmd.Parameters.AddWithValue("@problem", rdsa.SelectedValue);
                cmd.Parameters.AddWithValue("@comment",txtsend.Text);
               cmd.ExecuteNonQuery();
          
            Response.Write(Label1.Text+"Record added Successfully!!!thank you");
                conn.Close();




        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepages.aspx");
        }
    }
}