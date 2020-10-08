using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Xceed.Document.NET;
using Xceed.Words.NET;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Microsoft.Ajax.Utilities;


namespace DiplomnaRabotaReal.Shablons
{
    public partial class Razpredelenie : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["TestConnectionString"].ConnectionString;
        string date = string.Empty;
        string hall = string.Empty;
        string time = string.Empty;
        int countStudentInDataBase = 0;
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

  

        private void ReadDataFromDataBases(DocX doc,int id,List<string> StudentsDetails)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("ShowStudentTable", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@defeatid", id);
                
                SqlCommand cmd2 = new SqlCommand("CountsOfStudentsInProtection", con);
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.AddWithValue("@id", id);
                countStudentInDataBase = (int)cmd2.ExecuteScalar();
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
                        StudentsDetails.Add(reader["NameStudent"].ToString());
                        StudentsDetails.Add(reader["StudentFakNumber"].ToString());
                        StudentsDetails.Add(reader["ManagerPossition"].ToString());
                        StudentsDetails.Add(reader["ManagerScienceDegree"].ToString());
                        StudentsDetails.Add(reader["ManagerName"].ToString());
                        StudentsDetails.Add(reader["ReviewerPossition"].ToString());
                        StudentsDetails.Add(reader["ReviewerScienceDegree"].ToString());
                        StudentsDetails.Add(reader["ReviewerName"].ToString());
                        StudentsDetails.Add(reader["OKC"].ToString());
                        StudentsDetails.Add(reader["Time"].ToString());
                        StudentsDetails.Add(reader["Consultant"].ToString());
                        countTime++;
                    }                
                }
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(((LinkButton)sender).Text);
            GetShablonTable(id);
        }

        private void GetShablonTable(int id)
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
            ReadDataFromDataBases(doc, id, StudentsDetails);
            if (StudentsDetails.Count == 0)
            {
                Response.Write("ЛИПСВАТ ДАННИ ЗА СТУДЕНТИТЕ");
            }
            else
            {
                string title = "СПИСЪК НА ДИПЛОМНИТЕ ЗАЩИТИ на дипломантите от спец. КСТ" + Environment.NewLine +
              "М. СЕПТЕМВРИ  2019 г." + Environment.NewLine + $"{date}г. – петък, зала {hall} – “бакалавър и магистър” "
              + Environment.NewLine + Environment.NewLine;
                int size = 14;
                bool bold = true;
                FormatingText(doc, titleFormat, size, bold, title);
                Paragraph paragraphTitle = doc.InsertParagraph(title, false, titleFormat);
                paragraphTitle.Alignment = Alignment.center;
                PrintResultFormDataBase(StudentsDetails, doc);

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

        private void PrintResultFormDataBase(List<string> studentsDetails, DocX doc)
        {
            Xceed.Document.NET.Table t = doc.AddTable(countStudentInDataBase + 1, 8);
            t.Alignment = Alignment.center;
            
            t.Rows[0].Cells[0].Paragraphs.First().Append("№");
            t.Rows[0].Cells[1].Paragraphs.First().Append("№ на ДР");
            t.Rows[0].Cells[2].Paragraphs.First().Append("Име");
            t.Rows[0].Cells[3].Paragraphs.First().Append("Фак. №");
            t.Rows[0].Cells[4].Paragraphs.First().Append("Ръководител");
            t.Rows[0].Cells[5].Paragraphs.First().Append("Рецензент");
            t.Rows[0].Cells[6].Paragraphs.First().Append("Тип на обучение");
            t.Rows[0].Cells[7].Paragraphs.First().Append("Час");
            int countRow = 1;
            int countstudent = 1;
            for (int i = 0; i < studentsDetails.Count; i+=11)
            {
                string StudentName = studentsDetails[i];
                string fakNumber = studentsDetails[i + 1];
                string ManagerPossition = studentsDetails[i + 2];
                string ManagerScienceDegree = studentsDetails[i + 3];
                string ManagerStudent = studentsDetails[i + 4];
                string ReviewerPossition = studentsDetails[i + 5];
                string ReviewerScienceDegree = studentsDetails[i + 6];
                string ReviewerStudent = studentsDetails[i + 7];
                string oks = studentsDetails[i + 8];
                string time = studentsDetails[i + 9];
                string consultant = studentsDetails[i + 10];
              
                t.Rows[countRow].Cells[0].Paragraphs.First().Append(countstudent.ToString());
                t.Rows[countRow].Cells[1].Paragraphs.First().Append("     ");
                t.Rows[countRow].Cells[2].Paragraphs.First().Append(StudentName);
                t.Rows[countRow].Cells[3].Paragraphs.First().Append(fakNumber);
                if (consultant != "Липсва")
                {
                    t.Rows[countRow].Cells[4].Paragraphs.First().Append(ManagerPossition + ManagerScienceDegree
                        + ManagerStudent + Environment.NewLine + "Консултант: " + Environment.NewLine + consultant);

                }
                else
                {
                    t.Rows[countRow].Cells[4].Paragraphs.First().Append(ManagerPossition + ManagerScienceDegree + ManagerStudent);
                }
                
                t.Rows[countRow].Cells[5].Paragraphs.First().Append(ReviewerPossition + ReviewerScienceDegree + ReviewerStudent);
                t.Rows[countRow].Cells[6].Paragraphs.First().Append(oks);
                t.Rows[countRow].Cells[7].Paragraphs.First().Append(time);
                countRow++;
                countstudent++;
            }
           
            doc.InsertTable(t);
            
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