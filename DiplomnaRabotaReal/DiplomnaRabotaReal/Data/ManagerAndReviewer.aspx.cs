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
    public partial class ManagerAndReviewer : System.Web.UI.Page
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
            Response.Redirect("~/ErorPage.aspx");
        }


        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        protected void Clear()
        {
            txtName.Text = string.Empty;
            DropDownListDepartment.SelectedValue = "-1";
            DropDownListPossition.SelectedValue = "-1";
            DropDownListScienceDegree.SelectedValue = "-1";
        }

        protected void btnSet_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["TestConnectionString"].ConnectionString;

            using(SqlConnection con =new SqlConnection(cs))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("InsertIntoManager", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Position", DropDownListPossition.SelectedValue);
                    cmd.Parameters.AddWithValue("@ScienceDegree", DropDownListScienceDegree.SelectedValue);
                    cmd.Parameters.AddWithValue("@Names", txtName.Text);
                    cmd.Parameters.AddWithValue("@Department", DropDownListDepartment.SelectedValue);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    Clear();
                    lblMassaanger.ForeColor = System.Drawing.Color.Green;
                    lblMassaanger.Text = "Данните са въведени успешно.";
                }
                catch(Exception ex)
                {
                    lblMassaanger.ForeColor = System.Drawing.Color.Red;
                    lblMassaanger.Text = $"Error {ex.Message}";
                }
                finally
                {
                    con.Close();
                }
              

            }
        }
    }
}