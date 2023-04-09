using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_project
{
    public partial class viewbook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie customercookie = Request.Cookies["ok"];
            if (customercookie != null)
            {
              
                Label2.Text = customercookie["customername"];
                Label3.Text = customercookie["phonenumber"];
                Label4.Text = customercookie["checkin"];
                Label5.Text = customercookie["checkout"];
                Label6.Text = customercookie["time"];
            }
            HttpCookie cookie = Request.Cookies["Homestay"];
            if (customercookie != null)

            {
                Label1.Text = cookie["ProductName"];
            }

            }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("booking.aspx");
        }
    }
}