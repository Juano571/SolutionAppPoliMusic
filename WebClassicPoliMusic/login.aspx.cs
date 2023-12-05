using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebClassicPoliMusic
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=localhost;Initial Catalog=BDD_PoliMusic;User ID=usr_polimusic;Password=usr_polimusic;";
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT * FROM TBL_USER WHERE USERNAME=@Username AND PASSWORD=@Password";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Login exitoso
                            Session["username"] = username;

                            // Redirige a songs.aspx
                            Response.Redirect("songs.aspx");
                        }
                        else
                        {
                            // Usuario o contraseña inválidos
                            lblMessage.Text = "Usuario o contraseña inválidos.";
                        }
                    }
                }
            }
        }
    }
}