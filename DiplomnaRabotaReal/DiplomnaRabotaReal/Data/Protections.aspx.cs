using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Antlr.Runtime.Misc;
using Microsoft.Ajax.Utilities;
using System.Web.ModelBinding;

namespace DiplomnaRabotaReal.Data
{
    public partial class Protections : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["TestConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                         
              
                Clear();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        private void Clear()
        {         
            txtHall.Text = string.Empty;
            txtTime.Text = string.Empty;
            txtDateOfProtection.Text = string.Empty;
            ddlMember1.ClearSelection();
            ddlMember2.ClearSelection();
            ddlMember3.ClearSelection();
            ddlmember4.ClearSelection();
            ddlChairMan.ClearSelection();
        }
        protected void Page_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();
            Server.ClearError();
            Response.Redirect("~./ErorPage.aspx");
        }

        protected void btnSet_Click1(object sender, EventArgs e)
        {
           
            using (SqlConnection con = new SqlConnection(cs))
            {
            
                var listOfMembers = new List<string>();
                try
                {
                    SqlCommand cmd = new SqlCommand("InsertIntoProtection", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@DateOfProtection", txtDateOfProtection.Text);                         
                    cmd.Parameters.AddWithValue("@CommisionChairman", ddlChairMan.SelectedValue);
                    listOfMembers.Add(ddlChairMan.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@CommisionMember1", ddlMember1.SelectedValue);
                    if (!listOfMembers.Contains(ddlMember1.SelectedValue.ToString()))
                    {
                        listOfMembers.Add(ddlMember1.SelectedValue.ToString());
                    }
                    cmd.Parameters.AddWithValue("@CommisionMember2", ddlMember2.SelectedValue);
                    if (!listOfMembers.Contains(ddlMember2.SelectedValue.ToString()))
                    {
                        listOfMembers.Add(ddlMember2.SelectedValue.ToString());
                    }
                    cmd.Parameters.AddWithValue("@CommisionMember3", ddlMember3.SelectedValue);
                    if (!listOfMembers.Contains(ddlMember3.SelectedValue.ToString()))
                    {
                        listOfMembers.Add(ddlMember3.SelectedValue.ToString());
                    }
                    cmd.Parameters.AddWithValue("@CommisionMember4", ddlmember4.SelectedValue);
                    if (!listOfMembers.Contains(ddlmember4.SelectedValue.ToString()))
                    {
                        listOfMembers.Add(ddlmember4.SelectedValue.ToString());
                    }
                    if (listOfMembers.Count == 5)
                    {
                        cmd.Parameters.AddWithValue("@Hall", txtHall.Text);
                        cmd.Parameters.AddWithValue("@Time", txtTime.Text);
                        SqlParameter outputParameter = new SqlParameter();
                        outputParameter.ParameterName = "@DefeadId";
                        outputParameter.SqlDbType = System.Data.SqlDbType.Int;
                        outputParameter.Direction = System.Data.ParameterDirection.Output;
                        cmd.Parameters.Add(outputParameter);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        string id = outputParameter.Value.ToString();
                        HFid.Value = id;
                        lblMassanger.ForeColor = System.Drawing.Color.Green;
                        lblMassanger.Text = "Вкарахте данните успешно";
                        Clear();
                    }
                    else
                    {
                        lblMassanger.ForeColor = System.Drawing.Color.Red;                   
                        lblMassanger.Text = "В комисията не може да има еднакви членове!";
                    }
                 
                }
                catch (Exception ex)
                {
                    lblMassanger.ForeColor = System.Drawing.Color.Red;
                    lblMassanger.Text = $"Error {ex.Message}";
                }
                finally
                {
                    con.Close();
                }

            }

        }
 
 
        protected void btnAddStudents_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Data/InsertStudents.aspx?ID=" + HFid.Value);
        }

   
       
    }
}