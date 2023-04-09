using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace chessclub
{
    
    public partial class order : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["FeedbackConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
                      

        }

        protected void dlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("Homestay");
            conn.Open();

            string ProdID = Request.QueryString["ProductID"];
            SqlCommand cmd = new SqlCommand("SELECT * FROM [Product] WHERE ProductID='"+ProdID+"'", conn);

            SqlDataReader dr = cmd.ExecuteReader();
            bool recordfound = dr.Read();
            if (recordfound)
            {
                cookie["ProductName"] = dr["Name"].ToString();
                cookie["Price"] = dr["UnitPrice"].ToString();
                Response.Cookies.Add(cookie);
                cookie.Expires = DateTime.Now.AddDays(20);
                Response.Redirect("booking.aspx");
            }
            else
            {
                Response.Write("Please select Item");
            }
            conn.Close();
           
        }

       
    }
}

