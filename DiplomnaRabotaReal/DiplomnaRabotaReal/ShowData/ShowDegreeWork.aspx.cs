using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.IO;
using System.Data.SqlClient;

namespace DiplomnaRabotaReal.ShowData
{
    public partial class ShowDegreeWork : System.Web.UI.Page
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
                string faknumber = Request.QueryString["FakNumber"];
                if (faknumber == null)
                {
                    Response.Redirect("~/ShowData/ShowStudent.aspx");
                }
                SqlCommand cmd = new SqlCommand("showAllDegreeWorkbyFakNumberrr", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@faknumber", faknumber);
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
        protected void linkButtonClickFakNumber_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ShowData/ShowProtection.aspx?FakNumber=" + ((LinkButton)sender).Text);
        }

        protected void ManagerId_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ShowData/ShowManager.aspx?ManagerId=" + ((LinkButton)sender).Text);
        }

        protected void ReviewerId_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ShowData/ShowReviewer.aspx?ReviewerId=" + ((LinkButton)sender).Text);
        }

        protected void linkButtonClickRating_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ShowData/ShowRating.aspx?ID=" + ((LinkButton)sender).Text);
        }

        protected void linkButtonClickDegreeWorkFiles_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ShowData/ShodDegreeFiles.aspx?ID=" + ((LinkButton)sender).Text);
        }
    }
}