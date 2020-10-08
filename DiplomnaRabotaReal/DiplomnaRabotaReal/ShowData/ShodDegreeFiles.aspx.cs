using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace DiplomnaRabotaReal.ShowData
{
    public partial class ShodDegreeFiles : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["TestConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillData();
            }
        }

        private void FillData()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(cs))
            {
                string id = Request.QueryString["ID"];
                if (id == null)
                {
                    Response.Redirect("~/ShowData/ShowDegreeWork.aspx");
                }
                SqlCommand cmd = new SqlCommand("showDegreeWorkFilesByIdddd", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(id));
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                dt.Load(reader);
            }
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        protected void OpenAssignmentDocument(object sender, EventArgs e)
        {
            LinkButton ink = (LinkButton)sender;
            GridViewRow gr = (GridViewRow)ink.NamingContainer;
            int id = int.Parse(GridView1.DataKeys[gr.RowIndex].Value.ToString());
            DownloadFileAssigment(id);
        }
        private void DownloadFileAssigment(int id)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("getDocument", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", id);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                dt.Load(reader);

            }
            string name = dt.Rows[0]["AssignmentName"].ToString();
            byte[] assigmentDocument = (byte[])dt.Rows[0]["Assignment"];
            Response.ClearContent();
            if (name.Contains(".pdf"))
            {
                Response.ContentType = "application/pdf";
            }
            else if(name.Contains(".docx"))
            {
                Response.ContentType = "application/msword";
            }
            else if (name.Contains(".doc"))
            {
                Response.ContentType = "application/msword";
            }

            Response.AddHeader("content-Disposition", string.Format("attachment;AssignmentName={0}", name));
            Response.AddHeader("content-Lenght", assigmentDocument.Length.ToString());
            Response.BinaryWrite(assigmentDocument);
            Response.End();
            Response.Flush();
            Response.Close();

        }
        protected void OpenDegreeWorkDocument(object sender, EventArgs e)
        {
            LinkButton ink = (LinkButton)sender;
            GridViewRow gr = (GridViewRow)ink.NamingContainer;
            int id = int.Parse(GridView1.DataKeys[gr.RowIndex].Value.ToString());
            DownloadDegreeWork(id);
        }
        private void DownloadDegreeWork(int id)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("getDocument", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", id);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                dt.Load(reader);

            }
            string name = dt.Rows[0]["DegreeWorkName"].ToString();
            byte[] DegreeWorkDocument = (byte[])dt.Rows[0]["DegreeWork"];
            Response.ClearContent();
            if (name.Contains(".pdf"))
            {
                Response.ContentType = "application/pdf";
            }
            else if (name.Contains(".docx"))
            {
                Response.ContentType = "application/msword";
            }
            else if (name.Contains(".doc"))
            {
                Response.ContentType = "application/msword";
            }

            Response.AddHeader("Content-Disposition", string.Format("attachment;DegreeWorkName={0}",name));
            Response.AddHeader("Content-Lenght", DegreeWorkDocument.Length.ToString());
            Response.BinaryWrite(DegreeWorkDocument);
            Response.Flush();
            Response.Close();
        }
    }
}