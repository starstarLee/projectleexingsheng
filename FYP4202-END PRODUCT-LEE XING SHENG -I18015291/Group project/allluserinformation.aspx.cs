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
    public partial class allluserinformation : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["FeedbackConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.Visible = false;
                close.Visible = false;
            }
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed)
            {
                try
                {
                    conn.Open();
                    using (SqlCommand cdd = new SqlCommand("DELETE FROM Room WHERE CustomerName=@CustomerName", conn))
                    {
                        cdd.Parameters.AddWithValue("@CustomerName", txtcustomername.Text);
                        int rows = cdd.ExecuteNonQuery();

                        Response.Write("<script>alert('You Have Deleted Successfully!')</script>");
                        conn.Close();
                    }
                }
                catch (SqlException ex)
                {
                    Response.Write("<script>alert(' Deleted failed!')</script>");
                    lbldelete.Text = "Error" + ex.ToString();

                }
            }
        }

        protected void btnEditSearch_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Room WHERE CustomerName=@CustomerName", conn);
            cmd.Parameters.AddWithValue("@CustomerName", txtEditSearch.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            bool record = dr.Read();
            if (record)
            {
                txtcustomername.Text = dr["CustomerName"].ToString();
                txtroom.Text = dr["Room"].ToString();
                txtnoofperson.Text = dr["NoOfPerson"].ToString();
                txtphonenumber.Text = dr["PhoneNumber"].ToString();
                txtcheckin.Text = dr["checkin"].ToString();
                txtcheckout.Text = dr["checkout"].ToString();
                txttime.Text = dr["time"].ToString();
                txtpayment.Text = dr["payment"].ToString();
                txtday.Text = dr["dayofstay"].ToString();
                txttotal.Text = dr["TotalPrice"].ToString();
            }
            else
            {
                Response.Write("<script>alert('Record not found!')</script>");
                //lblEditResult.Text = "Record Not Found!";

            }
            conn.Close();
        }

        protected void btndelete0_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            close.Visible = true;
        }

        protected void close_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            close.Visible = false;
        }
    }
}