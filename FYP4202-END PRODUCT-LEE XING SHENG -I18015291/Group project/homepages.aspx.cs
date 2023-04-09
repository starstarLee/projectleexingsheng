using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace Group_project
{
    public partial class homepages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Login Successfully!')</script>");

        }

        protected void btnnext_Click(object sender, EventArgs e)
        {

            Response.Redirect("mainpage.aspx");
        }
    }
}