using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_project
{
    public partial class addproduct : System.Web.UI.Page
    {
        SqlConnection connt = new SqlConnection(ConfigurationManager.ConnectionStrings["FeedbackConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connt = new SqlConnection(ConfigurationManager.ConnectionStrings["FeedbackConnection"].ConnectionString);
                if (FileUpload1.HasFile)
                {
                    string profileImageName = FileUpload1.PostedFile.FileName;
                    string filePath = Server.MapPath("~/Product/" + profileImageName);
                    FileUpload1.SaveAs(filePath);

                    connt.Open();
                    String insertQuery = "INSERT INTO Product (ProductID, Name, Image, Description, UnitPrice,location,contact,Hostname) " +
                           "VALUES (@id, @name, @image, @Description, @UnitPrice, @location, @contact,@Hostname)";
                    SqlCommand cmd = new SqlCommand(insertQuery, connt);
                    cmd.Parameters.AddWithValue("@id", productID.Text);
                    cmd.Parameters.AddWithValue("@name", Name.Text);
                    cmd.Parameters.AddWithValue("@image", profileImageName);
                    cmd.Parameters.AddWithValue("@Description", description.Text);
                    cmd.Parameters.AddWithValue("@UnitPrice", price.Text);
                    cmd.Parameters.AddWithValue("@location", location.Text);
                    cmd.Parameters.AddWithValue("@contact", contact.Text);
                    cmd.Parameters.AddWithValue("@HostName", HOST.Text);
                    cmd.ExecuteNonQuery();

                    Response.Write("<script>alert('You Have Successfully Registered!')</script>");
                    connt.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write(Label1.Text + "ERORR: Record add failed" + ex.ToString());

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (connt.State == ConnectionState.Closed)
            {
                try
                {
                    connt.Open();
                    using (SqlCommand cdd = new SqlCommand("DELETE FROM Product WHERE ProductID=@ProductID", connt))
                    {
                        cdd.Parameters.AddWithValue("@ProductID", productID.Text);
                        int rows = cdd.ExecuteNonQuery();

                        Response.Write("<script>alert('You Have Deleted Successfully!')</script>");
                        connt.Close();
                    }
                }
                catch (SqlException ex)
                {
                    Response.Write("<script>alert(' Deleted failed!')</script>");
                    Label2.Text = "Error" + ex.ToString();

                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}