using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace chessclub
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
            HttpCookie cookie = Request.Cookies["Homestay"];
            if (cookie != null)
            {
                lblNames.Text = cookie["ProductName"];
                string unitPrice = cookie["Price"];
                //double price = double.Parse(unitPrice);
                lblPrices.Text = string.Format("{0:#.0}", unitPrice);
                //lblPrice.Text = cookie["Price"];
            }
            HttpCookie customercookie = new HttpCookie("receipt");
            customercookie["dayofstay"]= txtdayofstay.Text ;
            customercookie["payment"] = ddbank.SelectedValue;
            customercookie["totalprice"] = lbltotalprice.Text;
            Response.Cookies.Add(customercookie);
        }

        protected void btnTotal_Click(object sender, EventArgs e)
        {
            Label1.Visible = true;
            double price = Convert.ToDouble(lblPrices.Text);
            int dayofstay = Int32.Parse(txtdayofstay.Text);
            double totalprice = price * dayofstay;
            lbltotalprice.Text = Convert.ToString(totalprice);
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            if (ddbank.SelectedValue == "CIMB Bank")
            {
                String URL = "https://www.cimbclicks.com.my/clicks/#/";
                Response.Redirect(URL);
                Response.Redirect("userreceipt");
            }
            else if (
               ddbank.SelectedValue == "Maybank")
            {
                String URL = "https://www.maybank2u.com.my/home/m2u/common/login.do";
                Response.Redirect(URL);
                Response.Redirect("userreceipt");
            }
            else if (
               ddbank.SelectedValue == "Public Bank")
            {
                String URL = "https://www2.pbebank.com/myIBK/apppbb/servlet/BxxxServlet?RDOName=BxxxAuth&MethodName=login";
                Response.Redirect(URL);
                Response.Redirect("userreceipt");
            }
            else if (
               ddbank.SelectedValue == "Heong Leong Bank")
            {
                String URL = "https://s.hongleongconnect.my/rib/app/fo/login?mc=D";
                Response.Redirect(URL);
                Response.Redirect("userreceipt");
            }
            else { Response.Write("Please select one "); }
                   
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userreceipt.aspx");
        }
    }
}