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
using System.Diagnostics;
using Xceed.Document.NET;

namespace DiplomnaRabotaReal.Shablons
{
    public partial class Ratings : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["TestConnectionString"].ConnectionString;
        string date = string.Empty;      
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

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(((LinkButton)sender).Text);
            GetShablon(id);
        }

        private void GetShablon(int id)
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
            WriteDataFromDatabase(id, doc, StudentsDetails);
            if (StudentsDetails.Count == 0)
            {
                Response.Write("ЛИПСВАТ ДАННИ ЗА СТУДЕНТИТЕ");
            }
            else
            {
                string title = "Оценки на ДИК" + Environment.NewLine + $"{date}г. “бакалаври” " +Environment.NewLine;
                int size = 12;
                bool bold = false;
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
            Xceed.Document.NET.Table t = doc.AddTable(countStudentInDataBase + 1, 4);
            t.Alignment = Alignment.center;
            t.Rows[0].Cells[0].Paragraphs.First().Append("№");
            t.Rows[0].Cells[1].Paragraphs.First().Append("Дипломант");
            t.Rows[0].Cells[2].Paragraphs.First().Append("Ф.№");
            t.Rows[0].Cells[3].Paragraphs.First().Append("Разр./защита");

            int countRow = 1;
            int countstudent = 1;

            for (int i = 0; i < studentsDetails.Count; i+=3)
            {
                string fakNumber = studentsDetails[i];
                string StudentName = studentsDetails[i+1];              
                string oks = studentsDetails[i + 2];

                t.Rows[countRow].Cells[0].Paragraphs.First().Append(countstudent.ToString());
                t.Rows[countRow].Cells[1].Paragraphs.First().Append(StudentName);
                t.Rows[countRow].Cells[2].Paragraphs.First().Append(fakNumber);
                t.Rows[countRow].Cells[3].Paragraphs.First().Append("     ");

                countRow++;
                countstudent++;
            }
            doc.InsertTable(t);
        }

        private void WriteDataFromDatabase(int id, DocX doc, List<string> studentsDetails)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("ShablonRating", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", id);

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
                         
                            date = string.Format("{0: d/MMMM/yyyy (dddd)}", reader["DataOfProtection"]).ToString();
                            time = reader["Time"].ToString();
                        }
                        studentsDetails.Add(reader["StudentFakNumber"].ToString());
                        studentsDetails.Add(reader["NameStudent"].ToString());
                        studentsDetails.Add(reader["OKC"].ToString());               
                        countTime++;
                    }
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