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
    public partial class ShowStudent : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["TestConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            Panel1.Visible = false;
           
        }
             
        protected void FakNumber_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ShowData/ShowDegreeWork.aspx?FakNumber=" + ((LinkButton)sender).Text);
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            Panel2.Visible = false;
            Panel1.Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            Panel1.Visible = false;
        }
      
    }
}