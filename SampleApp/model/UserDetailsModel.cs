using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SampleApp.model
{
    public class UserDetailsModel
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SampleConnectionString"].ConnectionString);
        public string getUserData()
        {


            con.Open();
            SqlCommand userDetails = new SqlCommand("select Name, PhoneNumber, Email, UserName, Password from UserDetails", con);
            //SqlCommand sqlCommand = new SqlCommand(userDetails, con);
            Object userData = userDetails.BeginExecuteNonQuery();


            //HiddenTab.Value = "Regtab";
            con.Close();            
            return "Hi";
            //return
            //userData;
            // Response.Redirect("UserDetails.aspx");
        }
    }
}