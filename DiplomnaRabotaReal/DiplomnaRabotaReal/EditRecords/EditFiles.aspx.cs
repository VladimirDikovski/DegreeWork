using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;  
using System.Data;  
using System.Web.Configuration;
using System.IO;
using System.Configuration;
using Microsoft.Office.Interop.Word;

namespace DiplomnaRabotaReal.EditRecords
{
    public partial class EditFiles : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["TestConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind();
            }
           
        }

        private void Bind()
        {
            using(SqlConnection con =new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SHOWDegreeWork",con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Bind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = e.RowIndex;
            GridViewRow row = (GridViewRow)GridView1.Rows[index];
            Label lbId = (Label)row.FindControl("lblId");
            FileUpload assgiment = (FileUpload)row.FindControl("FileUploadAssigment");
            FileUpload DegreeWork = (FileUpload)row.FindControl("FileUploadDegreeWork");
            
            
          
            if (assgiment.HasFile && DegreeWork.HasFile)
            {
                string fileExtensionAssigment = Path.GetExtension(assgiment.FileName);
                bool canYouUploadFile1 = FileExtension(fileExtensionAssigment);
                string fileExtensionDegreeWork = Path.GetExtension(DegreeWork.FileName);
                bool canYouUploadFile2 = FileExtension(fileExtensionDegreeWork);
                if(canYouUploadFile1 && canYouUploadFile2)
                {
                    byte[] fileContentAssigment = assgiment.FileBytes;
                    byte[] fileContentDegreeWork = DegreeWork.FileBytes;
                    FileInfo filenameAssigment = new FileInfo(assgiment.FileName);
                    FileInfo filenameDegreeWork = new FileInfo(DegreeWork.FileName);
                    string assignmentNames = filenameAssigment.ToString();
                    string DegreeWorkNames = filenameDegreeWork.ToString();
                    TextBox DegreeWorkID = (TextBox)row.FindControl("TextBox3");
                    int degreeworkId = Convert.ToInt32(DegreeWorkID.Text);

                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        SqlCommand cmd2 = new SqlCommand("UpdateFiles", con);
                        cmd2.CommandType = CommandType.StoredProcedure;
                        cmd2.Parameters.AddWithValue("@Assignment", fileContentAssigment);
                        cmd2.Parameters.AddWithValue("@AssignmentName", assignmentNames);
                        cmd2.Parameters.AddWithValue("@DegreeWork", fileContentDegreeWork);
                        cmd2.Parameters.AddWithValue("@DegreeWorkName", DegreeWorkNames);
                        cmd2.Parameters.AddWithValue("@DegreeWorkId", degreeworkId);
                        cmd2.Parameters.AddWithValue("@ID", Convert.ToInt32(lbId.Text));
                        con.Open();
                        cmd2.ExecuteNonQuery();
                        lblMassenger.ForeColor = System.Drawing.Color.Green;
                        lblMassenger.Text = "Успешно Обновихте данните";
                    }
                }             
            }
            else
            {
                lblMassenger.ForeColor = System.Drawing.Color.Red;
                lblMassenger.Text = "Полето не може да бъде празно";
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            Bind();
        }
        private bool FileExtension(string fileExtension)
        {
            if (fileExtension.ToLower() != ".doc" && fileExtension.ToLower() != ".docx" && fileExtension.ToLower() != ".pdf")
            {
                lblMassenger.ForeColor = System.Drawing.Color.Red;
                lblMassenger.Text = "Полето приема само .doc , .docx и .pdf формати";
                return false;
            }
            else
            {
                return true;
            }

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Bind();
        }
    }
}