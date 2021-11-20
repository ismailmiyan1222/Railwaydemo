using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class aaa : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["railwaymanagementConnectionString"].ConnectionString);
            con2.Open();
            string rrr = "select * from train_code where train_number='" + TextBox1.Text + "' and station='" + TextBox2.Text + "'";
            SqlCommand cmd2 = new SqlCommand(rrr, con2);
            SqlDataReader rdr = cmd2.ExecuteReader();
            while (rdr.Read())
            {
                Label1.Text = rdr["time"].ToString();
                return;
            }
            rdr.Close();
            con2.Close();
        }
        catch (Exception ss)
        {
            Response.Write(ss);
        }
    }
}