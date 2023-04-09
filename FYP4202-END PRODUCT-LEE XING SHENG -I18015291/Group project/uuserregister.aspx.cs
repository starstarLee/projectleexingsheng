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
    public partial class uuserregister : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["FeedbackConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Button1.Visible = false; //register button
            }
        }

        protected void Button2_Click(object sender, EventArgs e) //check availability
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["FeedbackConnection"].ConnectionString);
                conn.Open();
                SqlCommand cmdd = new SqlCommand("Select *FROM [memberss] WHERE username=@username ", conn);
                cmdd.Parameters.AddWithValue("@username", Username.Text);

                SqlDataReader dr = cmdd.ExecuteReader();

                if (dr.HasRows)
                {
                    Response.Write("<script>alert('Username had been taken please try again !')</script>");
                }
                else
                {
                    Button1.Visible = true;
                    Label1.Text = "The username or name had not been taken u may continue register";
                }
            }
            catch (Exception ex)
            {
                Response.Write("ERORR:" + ex.ToString());
            }
        }
    

    

        protected void Button1_Click(object sender, EventArgs e)//register button
        {
            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                    String insertQuery = "INSERT INTO memberss (name, username, password, email, PhoneNumber,Gender,Age) " +
                        "VALUES (@id, @username, @password, @email, @phonenumber, @Gender, @Age)";
                    SqlCommand cmd = new SqlCommand(insertQuery, conn);
                    cmd.Parameters.AddWithValue("@id", Memberid.Text);
                    cmd.Parameters.AddWithValue("@username", Username.Text);
                    cmd.Parameters.AddWithValue("@password", Password.Text);
                    cmd.Parameters.AddWithValue("@email", Email.Text);
                    cmd.Parameters.AddWithValue("@phonenumber", Phone.Text);
                    cmd.Parameters.AddWithValue("@Gender", DropDownList1.SelectedValue);
                    cmd.Parameters.AddWithValue("@Age", txtage.Text);
                    cmd.ExecuteNonQuery();

                    Response.Write("<script>alert('You Have Successfully Registered!')</script>");
                    conn.Close();


                }
                else
                {
                    Response.Write("<script>alert('Failed to register!')</script>");
                }
            }
            catch (Exception ex)
            {
                lblRegister.Text = "Error" + ex.ToString();
                lblRegister.ForeColor = System.Drawing.Color.DarkRed;
            }
            HttpCookie customercookie = new HttpCookie("user");
            customercookie["Name"] = Memberid.Text;
            customercookie["Username"] = Username.Text;
            customercookie["Passsword"] = Password.Text;
            customercookie["Email"] = Email.Text;
            customercookie["PhoneNumber"] = Phone.Text;
            customercookie["Gender"] = DropDownList1.SelectedValue;
            customercookie["Age"] = txtage.Text;
            Response.Cookies.Add(customercookie);

        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("memberlogin.aspx");
        }

    }
}