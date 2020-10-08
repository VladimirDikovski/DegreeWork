using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;


namespace DiplomnaRabotaReal.Login_and__Register
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Clear();
            }
        }
        protected void Page_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();
            Server.ClearError();
            Response.Redirect("~./ErrorPage.html");
        }

        protected void btnSet_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string connectionString = ConfigurationManager.
                ConnectionStrings["RegisterUserConnectionString"].ConnectionString;

                try
                {

                    using (SqlConnection con = new SqlConnection(connectionString))
                    {

                        SqlCommand cmd = new SqlCommand("registerPages", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        string encryptedPassword = FormsAuthentication.
                            HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1");
                        cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
                        cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
                        cmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", encryptedPassword);
                        cmd.Parameters.AddWithValue("@GenderId", ddlGender.SelectedValue);
                        con.Open();
                        int returnResult = (int)cmd.ExecuteScalar();
                        if (returnResult == -1)
                        {
                            lblMassege.Text = "User Name is allready use,pls choose another  user name";
                        }
                        else
                        {

                            Response.Redirect("~/LoginAndRegister/Login.aspx");
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMassege.Text = "We have a problem " + ex.Message;
                }
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        private void Clear()
        {
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtUserName.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;
            ddlGender.ClearSelection();
        }
    }
}