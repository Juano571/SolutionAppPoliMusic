using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

namespace WebClassicPoliMusic
{
    public partial class songs : System.Web.UI.Page
    {
        protected HtmlGenericControl audioPlayer;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verifica si hay un usuario logueado
            if (Session["username"] != null)
            {
                // Muestra el nombre de usuario
                lblUsername.Text = "Welcome, " + Session["username"].ToString();
                // Carga las canciones
                LoadSongs();
            }
            else
            {
                // Si no hay un usuario logueado, redirige a la página de login
                Response.Redirect("Login.aspx");
            }
        }
        private void LoadSongs()
        {
            //String de conexión para la base de datos
            string connectionString = "Data Source=localhost;Initial Catalog=BDD_PoliMusic;User ID=usr_polimusic;Password=usr_polimusic;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT SONG_NAME, SONG_PATH FROM TBL_SONG";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        GridViewSongs.DataSource = reader;
                        GridViewSongs.DataBind();
                    }
                }
            }
        }

        protected void GridViewSongs_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Obtén el índice de la columna SONG_PATH
            int columnIndex = GetColumnIndexByName(GridViewSongs, "Song Path");
            Response.Write($"<script>console.log('{columnIndex}');</script>");

            // Obtén el valor de la celda seleccionada en la columna SONG_PATH
            string songPath = GridViewSongs.SelectedRow.Cells[columnIndex].Text;

            // Establece la fuente del reproductor de audio
            audioPlayer.Attributes["src"] = songPath;

            // Muestra el panel del reproductor de audio
            audioPanel.Visible = true;
        }

        // Método para obtener el índice de la columna por su nombre
        private int GetColumnIndexByName(GridView grid, string columnName)
        {
            foreach (DataControlField field in grid.Columns)
            {
                Response.Write($"<script>console.log('{field}');</script>");
                Response.Write($"<script>console.log('{field.HeaderText.Equals(columnName)}');</script>");
                if (field.HeaderText.Equals(columnName))
                {
                    return grid.Columns.IndexOf(field);
                }
            }
            return -1;
        }
    }
}