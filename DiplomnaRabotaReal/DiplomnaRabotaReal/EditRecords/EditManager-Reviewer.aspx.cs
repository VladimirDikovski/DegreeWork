using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DiplomnaRabotaReal.EditRecords
{
    public partial class EditManager_Reviewer : System.Web.UI.Page
    {
		private string selectedValue;
		protected void Page_Load(object sender, EventArgs e)
        {
			
			if (!IsPostBack)
			{

			}
        }
		protected void DropDownList1_DataBinding1(object sender, EventArgs e)
		{

			DropDownList theDropDownList = (DropDownList)sender;
			theDropDownList.DataBinding -= new EventHandler(DropDownList1_DataBinding1);
			theDropDownList.AppendDataBoundItems = true;

			selectedValue = "";
			try
			{
				theDropDownList.DataBind();
			}
			catch (ArgumentOutOfRangeException)
			{
				theDropDownList.Items.Clear();
				theDropDownList.Items.Insert(0, new ListItem("Please select", ""));
				theDropDownList.SelectedValue = "";
			}
		}
		protected void FixDuplicateBinding(object sender, EventArgs e)
		{
			DropDownList theDropDownList = (DropDownList)sender;
			selectedValue = theDropDownList.SelectedValue;

			var distinctItems = (from i in theDropDownList.Items.Cast<ListItem>()
								 group i by i.Value into g
								 select new ListItem { Text = g.First().Text, Value = g.First().Value }).ToArray();
			theDropDownList.Items.Clear();
			theDropDownList.Items.AddRange(distinctItems);
			theDropDownList.SelectedValue = selectedValue;
		}
	}
}
