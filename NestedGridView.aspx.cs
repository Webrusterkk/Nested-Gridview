using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace NestedGridView
{
    public partial class NestedGridView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGridview();
        }
        SqlConnection con = new SqlConnection("Data Source=MASTEREK-PC\\SQLEXPRESS;Initial Catalog=PRACTISE;Persist Security Info=True;User ID=sa;Password=sa123");
        public void BindGridview()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select CountryId ,CountryName from country", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            parentgrid.DataSource = ds;
            parentgrid.DataBind();

        }
        protected void parentgrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
if (e.Row.RowType == DataControlRowType.DataRow)
{
    try
    {
        con.Open();
        GridView gv = (GridView)e.Row.FindControl("gvChildGrid");
        int CountryId = Convert.ToInt32(e.Row.Cells[1].Text);
        SqlCommand cmd = new SqlCommand("select StateId,StateName from state where CountryId=" + CountryId, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        gv.DataSource = ds;
        gv.DataBind();
    }
    catch (Exception ex)
    {
        throw ex;
    }
}
}
        }
    }
