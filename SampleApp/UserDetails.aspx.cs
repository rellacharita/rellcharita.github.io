using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

namespace SampleApp
{
    public partial class UserDetails : System.Web.UI.Page
    {
        static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SampleConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            HiddenTab.Value = "Regtab";

           
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
           

            con.Open();
            SqlCommand cmd1 = new SqlCommand("insert into UserDetails values('" + txtName.Text + "','" + txtMobile.Text + "','" + txtEmail.Text + "', '" + txtUserName.Text + "','" + Password.Text + "')", con);
            cmd1.ExecuteNonQuery();

            HiddenTab.Value = "Regtab";
            con.Close();
            Response.Redirect("UserDetails.aspx");
        }
        [WebMethod]
        public string getUserData()
        {

            DataTable dt = new DataTable();
            con.Open();
            SqlCommand userDetails = new SqlCommand("select Name, PhoneNumber, Email, UserName, Password from UserDetails", con);
            //SqlCommand sqlCommand = new SqlCommand(userDetails, con);
            SqlDataAdapter da = new SqlDataAdapter(userDetails);
            da.Fill(dt);
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            //Response.Write(serializer.Serialize(rows));
            return serializer.Serialize(rows);
            //return "Hello";
            
        }
    }
}