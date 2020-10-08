using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Xceed.Words.NET;
using Xceed.Document.NET;
using System.Diagnostics;
using System.Text;

namespace DiplomnaRabotaReal.Shablons
{
    public partial class StudentsAndThemes : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["TestConnectionString"].ConnectionString;
        string date = string.Empty;
        string hall = string.Empty;
        string time = string.Empty;
        List<string> additionInformation = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
           
         
            if (!IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("ShowDefeats", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                }
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(((LinkButton)sender).Text);
            GetShablonStudents(id);
        }

        private void GetShablonStudents(int id)
        {
            WriteData(id);
        }

        private void WriteData(int id)
        {
            ReadAdditionInformation();
            string rectorName = additionInformation[0];
            string departmentHead = additionInformation[1];
            string facultyHead = additionInformation[2];
            string filePath = additionInformation[3];
            string fileName = additionInformation[4];
            string department = additionInformation[5];
            var StudentsDetails = new List<string>();
            string filename = $"{filePath}\\{fileName}.docx";
            var doc = DocX.Create(filename);
            Formatting titleFormat = new Formatting();
            string title = "ТУ – ГАБРОВО";
            int size = 12;
            bool bold = false;
            FormatingText(doc, titleFormat, size, bold, title);
            Paragraph paragraphTitle = doc.InsertParagraph(title, false, titleFormat);
            paragraphTitle.Alignment = Alignment.center;
            title = "катедра" + $" {department}" + Environment.NewLine + Environment.NewLine + Environment.NewLine;
            size = 14;
            bold = true;
            FormatingText(doc, titleFormat, size, bold, title);
            paragraphTitle = doc.InsertParagraph(title, false, titleFormat);
            paragraphTitle.Alignment = Alignment.center;
            title = "Р-Л КАТЕДРА: " + Environment.NewLine + " " + departmentHead + Environment.NewLine + Environment.NewLine
                + Environment.NewLine + Environment.NewLine;
            bold = false;
            size = 12;
            FormatingText(doc, titleFormat, size, bold, title);
            paragraphTitle = doc.InsertParagraph(title, false, titleFormat);
            paragraphTitle.Alignment = Alignment.right;
            title = "СПИСЪК" + Environment.NewLine;
            size = 12;
            bold = true;
            FormatingText(doc, titleFormat, size, bold, title);
            paragraphTitle = doc.InsertParagraph(title, false, titleFormat);
            paragraphTitle.Alignment = Alignment.center;
            WritedatafromDatabases(id, StudentsDetails);
            if (StudentsDetails.Count == 0)
            {
                Response.Write("ЛИПСВАТ ДАННИ ЗА СТУДЕНТИТЕ!");
            }
            else
            {
                title = "на темите, дипломантите, ръководителите" + Environment.NewLine + " и рецензентите за дипломни " +
               "защити на" + Environment.NewLine + $" {date} г.от {time} часа, зала {hall}" + Environment.NewLine + Environment.NewLine + Environment.NewLine;
                size = 12;
                bold = false;
                FormatingText(doc, titleFormat, size, bold, title);
                paragraphTitle = doc.InsertParagraph(title, false, titleFormat);
                paragraphTitle.Alignment = Alignment.center;
                StringBuilder builder = new StringBuilder();
                int countStudents = 1;
                string titleEngin = "Инж";
                for (int i = 0; i < StudentsDetails.Count; i += 10)
                {
                    string StudentName = StudentsDetails[i];
                    string fakNumber = StudentsDetails[i + 1];
                    string theme = StudentsDetails[i + 2];
                    string ManagerPossition = StudentsDetails[i + 3];
                    string ManagerScienceDegree = StudentsDetails[i + 4];
                    string ManagerStudent = StudentsDetails[i + 5];
                    string ReviewerPossition = StudentsDetails[i + 6];
                    string ReviewerScienceDegree = StudentsDetails[i + 7];
                    string ReviewerStudent = StudentsDetails[i + 8];
                    string ConsultantStudent = StudentsDetails[i + 9];
                    builder.AppendLine($"{countStudents}. ДИПЛОМАНТ: {StudentName}               фак. №  {fakNumber}");
                    builder.AppendLine($"ТЕМА:  {theme}");
                    builder.AppendLine($"Р-Л:{ManagerPossition} {ManagerScienceDegree} {titleEngin} {ManagerStudent}");
                    if (ConsultantStudent != "Липсва")
                    {
                        builder.AppendLine($"К-Т:  {ConsultantStudent}");
                    }
                    builder.AppendLine($"Р-Т: {ReviewerPossition} {ReviewerScienceDegree} {titleEngin}" +
                        $" {ReviewerStudent}" + Environment.NewLine);
                }
                title = builder.ToString();
                size = 12;
                bold = false;
                FormatingText(doc, titleFormat, size, bold, title);
                paragraphTitle = doc.InsertParagraph(title, false, titleFormat);

                try
                {
                    doc.Save();
                    Process.Start("WINWORD.EXE", filename);
                }
                catch
                {
                    Response.Write("Моля,затворете старият файл!");
                }
            }        

        }

        private void ReadAdditionInformation()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SelectAdditionInformation", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        additionInformation.Add(reader["Rector_name"].ToString());
                        additionInformation.Add(reader["Department_Head"].ToString());
                        additionInformation.Add(reader["Faculty_Head"].ToString());
                        additionInformation.Add(reader["Directory_name"].ToString());
                        additionInformation.Add(reader["Name_File"].ToString());
                        additionInformation.Add(reader["Department_Name"].ToString());
                    }
                }

            }
        }

        private void WritedatafromDatabases(int id,List<string>StudentDetails)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                try
                {
                SqlCommand cmd = new SqlCommand("showStudentsThemes", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@defeatid", id);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    int countTime = 1;
   
                    while (reader.Read())
                    {
                        if (countTime < 2)
                        {
                           
                            hall = reader["Hall"].ToString();
                            date = string.Format("{0: d/MMMM/yyyy (dddd)}", reader["DataOfProtection"]).ToString();
                            time = reader["Time"].ToString();

                        }
                        StudentDetails.Add(reader["NameStudent"].ToString());
                        StudentDetails.Add(reader["StudentFakNumber"].ToString());
                        StudentDetails.Add(reader["Theme"].ToString());
                        StudentDetails.Add(reader["ManagerPossition"].ToString());
                        StudentDetails.Add(reader["ManagerScienceDegree"].ToString());
                        StudentDetails.Add(reader["ManagerName"].ToString());
                        StudentDetails.Add(reader["ReviewerPossition"].ToString());
                        StudentDetails.Add(reader["ReviewerScienceDegree"].ToString());
                        StudentDetails.Add(reader["ReviewerName"].ToString());
                        StudentDetails.Add(reader["Consultant"].ToString());
                        countTime++;
                    }
                }
                }
                catch(Exception ex)
                {
                    Response.Write(ex.Message);
                }

            }
        }

        private void FormatingText(DocX doc, Formatting titleFormat, int size, bool bold, string title)
        {
            titleFormat.FontFamily = new Xceed.Document.NET.Font("Times new roman");
            titleFormat.Size = size;
            titleFormat.Bold = bold;

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Settings.aspx");
        }
    }
}