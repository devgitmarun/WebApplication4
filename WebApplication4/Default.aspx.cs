using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class _Default : Page
    {
        string name = "";
        string connections = "Server=DESKTOP-2P9MSI7\\SQLEXPRESS;Database=Database Design;Integrated Security = true;";
        string gender="";
        string email= "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            name = TextBox1.Text;
        
             email= TextBox2.Text;
            
            gender = radioButtonListOptions.SelectedValue;
            try
            {
                SqlConnection connection = new SqlConnection(connections);
                {
                    connection.Open();
                    string insertQuery = "INSERT INTO JobFairEntries(name,gender,email) VALUES(@name,@gender,@email)";
                    using (SqlCommand command = new SqlCommand(insertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@name", name);
                        command.Parameters.AddWithValue("@gender", gender);
                        command.Parameters.AddWithValue("@email", email);
                        command.ExecuteNonQuery();
                    }
                    connection.Close();
                }
                Response.Write("Data inserted into database successfully!");
            }
            catch (Exception ex)
            {
                Response.Write("Error:" + ex.Message);

            }
            BindGrid();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            radioButtonListOptions.SelectedIndex = -1;
            
        }
        protected void BindGrid()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connections))
                {
                    connection.Open();

                    string selectQuery = "SELECT * FROM JobFairEntries ";

                    using (SqlCommand command = new SqlCommand(selectQuery, connection))
                    {
                        SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                        DataTable dataTable = new DataTable();
                        dataAdapter.Fill(dataTable);

                        if (dataTable.Rows.Count > 0)
                        {
                            GridView1.DataSource = dataTable;
                            GridView1.DataBind();
                        }
                        else
                        {
                            // No data found
                            GridView1.DataSource = null;
                            GridView1.DataBind();
                            Response.Write("No data found in the database.");
                        }
                    }

                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
    
    }
}