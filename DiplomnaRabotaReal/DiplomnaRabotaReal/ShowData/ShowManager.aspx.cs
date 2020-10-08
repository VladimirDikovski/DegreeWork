using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace DiplomnaRabotaReal.ShowData
{
    public partial class ShowManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                string cs = ConfigurationManager.ConnectionStrings["TestConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string faknumber = Request.QueryString["ManagerId"];
                    if (faknumber == null)
                    {
                        Response.Redirect("~/ShowData/ShowDegreeWork.aspx");
                    }
                    SqlCommand cmd = new SqlCommand("ShowManagerBYIDDD", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ID",faknumber);
                    con.Open();
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                }
            }
        }
    }
}