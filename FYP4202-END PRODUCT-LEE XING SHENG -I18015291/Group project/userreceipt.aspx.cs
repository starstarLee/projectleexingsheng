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
    public partial class userreceipt : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["FeedbackConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)

            
        {
            Response.Write("<script>alert('We will sent you within 3-5 days!')</script>");
            Label9.Text = DateTime.Now.ToString();
            HttpCookie cookie = Request.Cookies["Homestay"];
            if (cookie != null)
            {
                Label1.Text = cookie["ProductName"];
            }
            HttpCookie customercookie = Request.Cookies["ok"];
            if (customercookie != null)
            {

                Label2.Text = customercookie["customername"];
                Label3.Text = customercookie["checkin"];
                Label4.Text = customercookie["checkout"];
                Label8.Text = customercookie["time"];

            }
            HttpCookie customercookies = Request.Cookies["receipt"];
            if (customercookie != null)
            {
                Label5.Text = customercookies["dayofstay"];
                Label6.Text = customercookies["payment"];
                Label7.Text = customercookies["totalprice"];
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
                string updateQuery = "UPDATE  Room SET  dayofstay=@dayofstay, Totalprice=@Totalprice WHERE CustomerName=@CustomerName";
            SqlCommand com = new SqlCommand(updateQuery, conn);
            com.Parameters.AddWithValue("@CustomerName", Label2.Text);
            com.Parameters.AddWithValue("@dayofstay", Label5.Text);
            com.Parameters.AddWithValue("@TotalPrice", Label7.Text);

            com.ExecuteNonQuery();
                Response.Redirect("order.aspx");
                com.Dispose();
                conn.Close();

            }
        }
    }
}