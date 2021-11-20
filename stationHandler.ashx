<%@ WebHandler Language="C#" Class="stationHandler" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Serialization;

public class stationHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string term = context.Request["term"] ?? "";

        List<string> liststationname = new List<string>();


        string cs = ConfigurationManager.ConnectionStrings["railwaymanagementConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("aspgetstation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@term",
                Value = term
            });
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                liststationname.Add(rdr["station_name"].ToString());
            }
        }
        JavaScriptSerializer js = new JavaScriptSerializer();
        context.Response.Write(js.Serialize(liststationname)); 
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}