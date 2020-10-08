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
    public partial class DegreeWorkFiles : System.Web.UI.Page
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

        private bool FileExtension(string fileExtension)
        {
            if (fileExtension.ToLower() != ".doc" && fileExtension.ToLower() != ".docx" && fileExtension.ToLower() != ".pdf")
            {
                lblMassanger.ForeColor = System.Drawing.Color.Red;
                lblMassanger.Text = "Полето приема само .doc , .docx и .pdf формати";
                return false;
            }
            else
            {
                return true;
            }

        }

        protected void InputData(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                if (FileUploadFailAssigment.HasFile && FileUploadFailDegreeWork.HasFile)
                {
                    FileInfo filenameAssigment = new FileInfo(FileUploadFailAssigment.FileName);
                    FileInfo filenameDegreeWork = new FileInfo(FileUploadFailDegreeWork.FileName);
                    SqlCommand cmd = new SqlCommand("InsertFiles", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    byte[] fileContentAssigment = FileUploadFailAssigment.FileBytes;
                    byte[] fileContentDegreeWork = FileUploadFailDegreeWork.FileBytes;

                    string fileExtensionAssigment = Path.GetExtension(FileUploadFailAssigment.FileName);
                    bool canYouUploadFile1 = FileExtension(fileExtensionAssigment);

                    if (canYouUploadFile1)
                    {
                        double fileSize = FileUploadFailAssigment.PostedFile.ContentLength;
                        if (fileSize > 5191680)
                        {
                            Response.Write("Файлът е много голям");
                        }
                        else
                        {
                            string assignmentName = filenameAssigment.Name;
                            cmd.Parameters.AddWithValue("@Assignment", fileContentAssigment);
                            cmd.Parameters.AddWithValue("@AssigmentName", assignmentName);
                        }
                      
                    }
                    string fileExtensionDegreeWork = Path.GetExtension(FileUploadFailDegreeWork.FileName);
                    bool canYouUploadFile2 = FileExtension(fileExtensionDegreeWork);
                    if (canYouUploadFile1)
                    {
                        int fileSize = FileUploadFailAssigment.PostedFile.ContentLength;
                        if (fileSize > 5191680)
                        {
                            Response.Write("Файла е много голям");
                        }
                        else
                        {
                            string degreeworkName = filenameDegreeWork.Name;
                            cmd.Parameters.AddWithValue("@DegreeWork", fileContentDegreeWork);
                            cmd.Parameters.AddWithValue("@DegreeWorkName", degreeworkName);
                        }
                       
                    }
                    if (canYouUploadFile1 && canYouUploadFile2)
                    {
                        cmd.Parameters.AddWithValue("@DegreeWorkId", Convert.ToInt32(ddlFakNumber.SelectedValue));
                        lblMassanger.ForeColor = System.Drawing.Color.Green;
                        lblMassanger.Text = "Успешно въведохте данните.";
                        cmd.ExecuteNonQuery();
                        Clear();
                    }
                }
                else
                {
                    lblMassanger.ForeColor = System.Drawing.Color.Red;
                    lblMassanger.Text = "Полето не може да бъде празно";
                }
            }

       
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
            
        private void Clear()
        {
            ddlFakNumber.ClearSelection();
        }
    }
}