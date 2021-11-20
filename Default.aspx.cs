using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    int count = 1, a, b;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["railwaymanagementConnectionString"].ConnectionString);
            con.Open();
            string insert = "insert into booking(passanger,date,train,class)values(@passanger,@date,@train,@class)";
            SqlCommand cmd = new SqlCommand(insert, con);
            cmd.Parameters.AddWithValue("@passanger", TextBox1.Text);
            cmd.Parameters.AddWithValue("@date", TextBox2.Text);
            cmd.Parameters.AddWithValue("@train", TextBox3.Text);
            cmd.Parameters.AddWithValue("@class", TextBox4.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Label1.Text = "inserted";
        }
        catch (Exception es)
        {
            Response.Write(es);
        }
     
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["railwaymanagementConnectionString"].ConnectionString);
            con.Open();

            string ab = "12202";
            string date="02/03/2018";
            string loop="2AC";
            string select = "select * from booking where train='"+ab+"' and date='"+date+"' and class='"+loop+"'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader rdr = cmd.ExecuteReader();
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            while (rdr.Read())
            {
                a = count;
                b = 200 - a;
                Label2.Text = "" + b;
                count = count + 1;

            }
            con.Close();

        }
        catch (Exception ee)
        {
            Response.Write(ee);
        }
    }
}