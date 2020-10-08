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
    public partial class Student : System.Web.UI.Page
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



        protected void btnInsert_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string cn = ConfigurationManager.ConnectionStrings["TestConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(cn))
                {
                    try
                    {

                        SqlCommand cmd = new SqlCommand("InsertGraduates", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@FakNumber", Convert.ToInt32(txtFakNomer.Text));
                        Application["fakNomer"] = Convert.ToInt32(txtFakNomer.Text);
                        cmd.Parameters.AddWithValue("@NameStudent", txtNameBg.Text);
                        cmd.Parameters.AddWithValue("@NameOfEnglish", txtNameEng.Text);
                        cmd.Parameters.AddWithValue("@Specialty", ddlSpciality.SelectedValue); ;
                        cmd.Parameters.AddWithValue("@OKC", ddlOks.SelectedValue);
                        cmd.Parameters.AddWithValue("@TypeOfLearning", ddlTypeOfLearning.SelectedValue);
                        cmd.Parameters.AddWithValue("@DataOfSemesterFinish", txtDataSemester.Text);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        Clear();
                        lblMessanger.ForeColor = System.Drawing.Color.Green;
                        lblMessanger.Text = "Успешно въведохте данните.";

                    }
                    catch (Exception ex)
                    {
                        lblMessanger.ForeColor = System.Drawing.Color.Red;
                        lblMessanger.Text = $"Error! {ex.Message}";
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        protected void Clear()
        {
            txtDataSemester.Text = string.Empty;
            txtFakNomer.Text = string.Empty;
            txtNameBg.Text = string.Empty;
            txtNameEng.Text = string.Empty;
            ddlSpciality.SelectedValue = "-1";
            ddlOks.SelectedValue = "-1";
            ddlTypeOfLearning.SelectedValue = "-1";
        }
    }
}