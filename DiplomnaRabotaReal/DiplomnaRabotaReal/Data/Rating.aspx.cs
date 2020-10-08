using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebGrease.Css.Visitor;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace DiplomnaRabotaReal.Data
{
    public partial class Rating : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        protected void Page_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();
            Server.ClearError();
            Response.Redirect("~/ErorPage.aspx");
        }
        private void Clear()
        {
            txtRatingProtection.Text = string.Empty;
            txtRatingWork.Text = string.Empty;
            
        }

        protected void btnSet_Click(object sender, EventArgs e)
        {
            string cn = ConfigurationManager.ConnectionStrings["TestConnectionString"].ConnectionString;
            using(SqlConnection con =new SqlConnection(cn))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("InsertIntoRatingg", con);
                    cmd.CommandType = CommandType.StoredProcedure;                 
                    cmd.Parameters.AddWithValue("@DegreeWorkId", Convert.ToInt32(ddlFakNumber.SelectedValue));
                    cmd.Parameters.AddWithValue("@RatingOfDevelopment", txtRatingWork.Text);
                    cmd.Parameters.AddWithValue("@RatingOfProtection", txtRatingProtection.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMassanger.ForeColor = System.Drawing.Color.Green;
                    lblMassanger.Text = "Вкарахте успешно данните";
                    Clear();
                }
                catch(Exception ex)
                {
                    lblMassanger.ForeColor = System.Drawing.Color.Red;
                    lblMassanger.Text = $"Error + {ex.Message}";
                }
                finally
                {
                    con.Close();
                }
               
            }
        }
    }
}