using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace DiplomnaRabotaReal.Data
{
    public partial class InsertStudents : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["TestConnectionString"].ConnectionString;


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
            Response.Redirect("~/ErorPage.aspx");
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string ProtectionId = Request.QueryString["ID"];
            if (ProtectionId == string.Empty || ProtectionId == null)
            {

                Response.Redirect("~/Data/Protections.aspx");
            }

            using (SqlConnection con = new SqlConnection(cs))
            {

                SqlCommand cmd = new SqlCommand("InsertIntoDefeatsGraduates", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                cmd.Parameters.AddWithValue("@StudentFakNumber", txtStudentFakNumber.Text);
                cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(ProtectionId));          
                cmd.ExecuteNonQuery();
                lblMessenger.ForeColor = System.Drawing.Color.Green;
                lblMessenger.Text = "Успешно вкарахте данните";
                txtStudentFakNumber.Text = null;
           

            }

        }
    }
}

