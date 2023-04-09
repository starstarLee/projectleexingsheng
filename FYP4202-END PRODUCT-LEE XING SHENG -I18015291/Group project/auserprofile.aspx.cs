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
    public partial class auserprofile : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["FeedbackConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                edit.Visible = false;
                btnEdit.Visible = false;
                show.Visible = false;
               
            }
        }
       

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            labeldelete0.Visible = false;
            show.Visible = false;
            btnEditSearch.Visible = false;
            txtEditSearch.Visible = false;
            edit.Visible = true;
            lblEId.Text = lblEditId.Text;
            txtNewUsername.Text = lblEditUsername.Text;
            txtNewPassword.Text = lblEditPassword.Text;
            txtNewEmail.Text = lblEditEmail.Text;
            txtNewPhone.Text = lblEditPhone.Text;
            txtNewage.Text = lblEditAge.Text;
            txtNewgender.Text = lblEditGender.Text;
        }

        protected void btnEditSearch_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM memberss WHERE name=@name ", conn);
            cmd.Parameters.AddWithValue("@name", txtEditSearch.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            bool record = dr.Read();

            if (record)
            {
                show.Visible = true;
                btnEdit.Visible = true;
                labeldelete0.Text = "Record Found!";
                lblEditId.Text = dr["name"].ToString();
                lblEditUsername.Text = dr["username"].ToString();
                lblEditPassword.Text = dr["password"].ToString();
                lblEditEmail.Text = dr["email"].ToString();
                lblEditPhone.Text = dr["PhoneNumber"].ToString();
                lblEditAge.Text = dr["Age"].ToString();
                lblEditGender.Text = dr["Gender"].ToString();
            }
            else
            {
                Response.Write("<script>alert('Record not found!')</script>");
                show.Visible = false;
            }
            conn.Close();
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed)
            {
                try
                {
                    conn.Open();
                    using (SqlCommand cdd = new SqlCommand("DELETE FROM memberss WHERE name=@Id ", conn))
                    {
                        cdd.Parameters.AddWithValue("@Id", lblEditId.Text);
                        int rows = cdd.ExecuteNonQuery();

                        Response.Write("<script>alert('You Have Deleted Successfully!')</script>");
                        conn.Close();
                    }
                }
                catch (SqlException ex)
                {
                    labeldelete.Text = "Error" + ex.ToString();
                   
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            show.Visible = true;
            btnEditSearch.Visible = true;
            txtEditSearch.Visible = true;
            edit.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed)
            {
                btnEdit.Visible = false;
                conn.Open();
                string updateQuery = "UPDATE memberss SET  username=@username, password=@password, email=@email, PhoneNumber=@Phone, Age=@Age, Gender=@Gender WHERE name=@name ";
                SqlCommand com = new SqlCommand(updateQuery, conn);
                {
                    com.Parameters.AddWithValue("@name", lblEId.Text);
                    com.Parameters.AddWithValue("@username", txtNewUsername.Text);
                    com.Parameters.AddWithValue("@password", txtNewPassword.Text);
                    com.Parameters.AddWithValue("@email", txtNewEmail.Text);
                    com.Parameters.AddWithValue("@Phone", txtNewPhone.Text);
                    com.Parameters.AddWithValue("@Age", txtNewage.Text);
                    com.Parameters.AddWithValue("@Gender", txtNewgender.Text);
                    com.ExecuteNonQuery();

                    Response.Write("<script>alert('You Have Updated Successfully!')</script>");
                    com.Dispose();
                    conn.Close();
                  
                }

            }
            else
            {
                Response.Write("<script>alert('Updated failed. Please try again')</script>");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}