using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

namespace DiplomnaRabotaReal.Data
{
    public partial class DegreeWorks : System.Web.UI.Page
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
            Response.Redirect("~/ErorPage.aspx");
        }
        private void Clear()
        {
            txtThema.Text = string.Empty;          
            txtDateOfDeliveryTime.Text = string.Empty;
            txtDateOfSetting.Text = string.Empty;         
            txtDateOfDeliveryTime.Text = string.Empty;
            txtFakNomer.Text = string.Empty;
            ddlReviewer.ClearSelection();
            ddlManager.ClearSelection();
            ddlConsultant.ClearSelection();
       
        }
       

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        protected void btnSet_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["TestConnectionString"].ConnectionString;

            using(SqlConnection con =new SqlConnection(cs))
            {
                try
                {
                 
                    SqlCommand cmd = new SqlCommand("InsertIntoDegreeWokrss", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Theme", txtThema.Text);
                    cmd.Parameters.AddWithValue("@GraduatedId", Convert.ToInt32(txtFakNomer.Text));
                    cmd.Parameters.AddWithValue("@ManagerId", Convert.ToInt32(ddlManager.SelectedValue));
                    cmd.Parameters.AddWithValue("@ReviewerId", Convert.ToInt32(ddlReviewer.SelectedValue));
                    cmd.Parameters.AddWithValue("@Consultant", ddlConsultant.SelectedValue);
                    cmd.Parameters.AddWithValue("@DateOfSetting", txtDateOfSetting.Text);
                    cmd.Parameters.AddWithValue("@DeliveryTime", txtDateOfDeliveryTime.Text);              
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMassanger.ForeColor = System.Drawing.Color.Green;
                   lblMassanger.Text = "Успешно въведохте данните.";
                   
                }
                catch(Exception ex)
                {
                    lblMassanger.ForeColor = System.Drawing.Color.Red;
                    lblMassanger.Text = $"Error + {ex.Message} ";
                }
                finally
                {
                    con.Close();
                }
            }
        }
      
    }
}