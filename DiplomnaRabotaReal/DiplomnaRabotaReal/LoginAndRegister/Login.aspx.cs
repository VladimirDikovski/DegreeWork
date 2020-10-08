using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

namespace DiplomnaRabotaReal.Login_and__Register
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        protected void Page_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();
            Server.ClearError();
            Response.Redirect("~/ErrorPage.html");
        }
        private bool AuthenticationUser(string username, string password)
        {

            string cs = ConfigurationManager.
                ConnectionStrings["RegisterUserConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string encryptedPassword = FormsAuthentication.
                HashPasswordForStoringInConfigFile(password, "SHA1");
                SqlCommand cmd = new SqlCommand("userLoginnn", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", encryptedPassword);
                con.Open();

                int returnResult = (int)cmd.ExecuteScalar();
                return returnResult == 1;
            }

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (AuthenticationUser(txtUserName.Text, txtPassword.Text))
            {
                FormsAuthentication.Authenticate(txtUserName.Text, txtPassword.Text);
                Response.Redirect("~/Data/NavigationBar.aspx");

            }
            else
            {
                lblMassege.ForeColor= System.Drawing.Color.Red;
                lblMassege.Text = "Невалидно потребителско име или парола";
            }
        }
    }
}