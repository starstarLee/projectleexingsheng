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
    public partial class view : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["FeedbackConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                show.Visible = false;
            }
            HttpCookie cookie = Request.Cookies["democookie"];
            if (cookie != null)
            {

                txtsearch.Text = cookie["Username"];

            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM memberss WHERE username=@MemberId", conn);
            cmd.Parameters.AddWithValue("@MemberId", txtsearch.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            bool record = dr.Read();
            if (record)
            {
                Label1.Text = "Record found";
                show.Visible = true;
                lbleName.Text = dr["name"].ToString();
                lblEUsername.Text = dr["username"].ToString();

                lbleEmail.Text = dr["email"].ToString();
                lblEPhone.Text = dr["PhoneNumber"].ToString();
                lblgender.Text = dr["Gender"].ToString();
                lblage.Text = dr["Age"].ToString();
            }
            else
            {
                Label1.Text = "Record cannot be found";
                show.Visible = false;
            }
        }
    }
}