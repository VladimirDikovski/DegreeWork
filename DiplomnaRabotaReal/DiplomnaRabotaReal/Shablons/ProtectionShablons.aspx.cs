using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Syncfusion.DocIO;
using Syncfusion.DocIO.DLS;
using System.Drawing;
using System.Dynamic;
using Microsoft.SqlServer.Server;
using System.Text;
using System.Globalization;
using Xceed.Words.NET;
using System.Diagnostics;
using Xceed.Document.NET;
using System.Security.Principal;
using Microsoft.Ajax.Utilities;

namespace DiplomnaRabotaReal.Shablons
{
    public partial class ProtectionShablons : System.Web.UI.Page
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

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            int id =Convert.ToInt32(((LinkButton)sender).Text);                
            GetShablon2(id);
        }

        private void GetShablon2(int id)
        {
            ReadAdditionInformation();
            string rectorName = additionInformation[0];
            string departmentHead = additionInformation[1];
            string facultyHead = additionInformation[2];
            string filePath = additionInformation[3];
            string fileName = additionInformation[4];
            string department = additionInformation[5];
            var commisions = new List<string>();
            var students = new List<string>();
            string filename =$"{filePath}\\{fileName}.docx";
            var doc = DocX.Create(filename);
            Formatting titleFormat = new Formatting();
            int size = 16;
            bool bold = true;
            string title = "ТЕХНИЧЕСКИ УНИВЕРСИТЕТ – ГАБРОВО"+Environment.NewLine;
            FormatingText(doc, titleFormat, size, bold,title);
            Paragraph paragraphTitle = doc.InsertParagraph(title, false, titleFormat);
            paragraphTitle.Alignment = Alignment.center;

            title = "ЗАПОВЕД"+ Environment.NewLine;         
            size = 12;
            bold = false;
            FormatingText(doc, titleFormat, size, bold, title);
             paragraphTitle = doc.InsertParagraph(title, false, titleFormat);
            paragraphTitle.Alignment = Alignment.center;

            title = "№…………"  + Environment.NewLine + Environment.NewLine+ "Габрово,……………….2020 г."+
                Environment.NewLine+Environment.NewLine;
            size = 12;
            bold = false;
            FormatingText(doc, titleFormat, size, bold, title);
            paragraphTitle = doc.InsertParagraph(title, false, titleFormat);
            paragraphTitle.Alignment = Alignment.center;

            title = "НАЗНАЧАВАМ:" + Environment.NewLine+Environment.NewLine;
            size = 12;
            bold = true;
            FormatingText(doc, titleFormat, size, bold, title);
             paragraphTitle = doc.InsertParagraph(title, false, titleFormat);
            paragraphTitle.Alignment = Alignment.center;
           
            WriteData(id,commisions,students);
            if(commisions.Count ==0 || students.Count == 0)
            {
                Response.Write("ЛИПСВАТ ДАННИ ЗА СТУДЕНТИТЕ");
            }
            else
            {
                title = "КОМИСИЯ В СЪСТАВ:" + Environment.NewLine;
                size = 12;
                bold = false;
                FormatingText(doc, titleFormat, size, bold, title);               
                string Precedatel = commisions[0];
                title = $"ПРЕДСЕДАТЕЛ :                       {"Инж."}  {Precedatel}" + Environment.NewLine;
                size = 12;
                bold = false;
                FormatingText(doc, titleFormat, size, bold, title);
                paragraphTitle = doc.InsertParagraph(title, false, titleFormat);
                paragraphTitle.Alignment = Alignment.left;
                title = $"И ЧЛЕНОВЕ :";
                FormatingText(doc, titleFormat, size, bold, title);
                paragraphTitle = doc.InsertParagraph(title, false, titleFormat);
                paragraphTitle.Alignment = Alignment.left;
                StringBuilder bild = new StringBuilder();
                for (int i = 1; i < commisions.Count; i++)
                {
                    bild.AppendLine("                                                   " +
                        $"{i} {"Инж."} {commisions[i]}" + Environment.NewLine);
                }

                title = bild.ToString();
                paragraphTitle = doc.InsertParagraph(title, false, titleFormat);
                title = $"която да проведе защити на дипломни работи на {date} " +
                    $"от {time} часа в зала {hall} на следните дипломанти от  специалност КСТ," +
                    "образователно-квалификационна степен “бакалавър ”:" + Environment.NewLine + Environment.NewLine;
                size = 12;
                bold = false;
                FormatingText(doc, titleFormat, size, bold, title);
                paragraphTitle = doc.InsertParagraph(title, false, titleFormat);

                StringBuilder builder = new StringBuilder();
                int countStudents = 0;
                for (int i = 0; i < students.Count; i += 2)
                {
                    countStudents++;
                    builder.AppendLine("                                                   " +
                       $"{countStudents}. {students[i]}     {students[i + 1]}" + Environment.NewLine);
                   
                }
                size = 12;
                bold = false;
                string studentsText = builder.ToString();
                FormatingText(doc, titleFormat, size, bold, studentsText);
                paragraphTitle = doc.InsertParagraph(studentsText, false, titleFormat);
                title = rectorName;
                size = 12;
                bold = true;
                FormatingText(doc, titleFormat, size, bold, title);
                paragraphTitle = doc.InsertParagraph(title, false, titleFormat);
                paragraphTitle.Alignment = Alignment.left;
                title = "Ректор на Технически университет-Габрово ";
                size = 12;
                bold = false;
                FormatingText(doc, titleFormat, size, bold, title);
                paragraphTitle = doc.InsertParagraph(title, false, titleFormat);
                paragraphTitle.Alignment = Alignment.left;
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

        private void WriteData(int id,List<string> commisions, List<string> students)
        {
           
            using (SqlConnection con = new SqlConnection(cs))
            {
                try
                {

              
                SqlCommand cmd = new SqlCommand("ShablonProtectionById", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", id);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {                
                    int countTime = 1;
                    int countStudent = 1;
                                                        
                    while (reader.Read())
                    {
                        if (countTime < 2)
                        {
                            commisions.Add(reader["CommisionChairman"].ToString());
                            commisions.Add(reader["CommisionMember1"].ToString());
                            commisions.Add(reader["CommisionMember2"].ToString());
                            commisions.Add(reader["CommisionMember3"].ToString());
                            commisions.Add(reader["CommisionMember4"].ToString());
                            hall = reader["Hall"].ToString();
                            date = string.Format("{0: d/MMMM/yyyy (dddd)}", reader["DataOfProtection"]).ToString();
                            time = reader["Time"].ToString();

                        }
                        students.Add(reader["NameStudent"].ToString());
                        students.Add(reader["StudentFakNumber"].ToString());
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

        private void FormatingText(DocX doc, Formatting titleFormat, int size, bool bold,string title)
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