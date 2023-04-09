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
    public partial class booking : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Button1.Visible = true;
                Calendar1.Visible = false;
                Calendar2.Visible = false;
                RangeValidator2.MinimumValue = DateTime.Now.ToShortDateString();
                RangeValidator2.MaximumValue = DateTime.Now.AddDays(30).ToShortDateString();
                RangeValidator2.Type = ValidationDataType.Date;
                RangeValidator1.MinimumValue = DateTime.Now.ToShortDateString();
                RangeValidator1.MaximumValue = DateTime.Now.AddDays(30).ToShortDateString();
                RangeValidator1.Type = ValidationDataType.Date;
                GridView1.Visible = false;
            
            }
            HttpCookie cookie = Request.Cookies["Homestay"];
            if (cookie != null)
            {
                lblname.Text = cookie["ProductName"];
            }
            HttpCookie customercookie = new HttpCookie("ok");
            customercookie["customername"] = TextBox2.Text;
            customercookie["checkin"] = txtcheckin.Text;
            customercookie["checkout"] = TextBox3.Text;
            customercookie["time"] = DropDownList1.SelectedValue;
            Response.Cookies.Add(customercookie);

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["FeedbackConnection"].ConnectionString);
                conn.Open();
                string insertQuery = "insert into Room (Room,CustomerName,NoOfPerson,PhoneNumber,checkin,checkout,time,payment)values(@Room,@CustomerName,@NoOfPerson,@PhoneNumber,@checkin,@checkout,@time,@payment)";
                SqlCommand cmd = new SqlCommand(insertQuery, conn);
                
                cmd.Parameters.AddWithValue("@CustomerName", TextBox2.Text);
                cmd.Parameters.AddWithValue("@Room", lblname.Text);
                cmd.Parameters.AddWithValue("@NoOfPerson", DropDownList2.SelectedValue);
                cmd.Parameters.AddWithValue("@PhoneNumber", TextBox4.Text);
                cmd.Parameters.AddWithValue("@checkin", txtcheckin.Text);
                cmd.Parameters.AddWithValue("@checkout", TextBox3.Text);
                cmd.Parameters.AddWithValue("@time", DropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("@payment", Label3.Text);
                cmd.ExecuteNonQuery();

                Response.Write("Record added Successfully!!!thank you");
                Response.Redirect("cart.aspx");
                conn.Close();

              

            }
           catch (Exception ex)
            {
                Response.Write("Record added failed!!!thank you");
                Response.Write("ERORR: Record add failed" + ex.ToString());

            }
           
        }
        




            protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible) { 
            Calendar1.Visible = false;
            }else
                Calendar1.Visible = true;
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar2.Visible)
            {
                Calendar2.Visible = false;
            }
            else
                Calendar2.Visible = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtcheckin.Text = Calendar1.SelectedDate.ToString("d");
            Calendar1.Visible = false;


        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            TextBox3.Text = Calendar2.SelectedDate.ToString("d");
            Calendar2.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            GridView1.Visible = true;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
          
            Response.Redirect("viewbook.aspx");
        }
    }
}