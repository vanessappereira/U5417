using System;
using System.Data;
using System.Data.SqlClient;

namespace _05_aspnet_Livros_ADO
{
    public partial class Livro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetDadosLivro();
        }
        void GetDadosLivro()
        {
            SqlConnection connection = new SqlConnection
            (@"data source=.\sqlexpress; initial catalog = Livros; " + "integrated security=true;");

            // Obter dados do livro
            SqlCommand command = new SqlCommand
            {
                CommandText = "SELECT L.ID, L.Titulo, L.Resumo, L.Capa, E.Nome 'Editora',"
                + " A.Nome 'Area' " + "FROM Livro L JOIN Editora E ON L.Editora = E.ID JOIN Area A ON L.Area = A.ID "
                + "WHERE L.Id = @id ORDER BY L.Titulo"
            };

            command.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
            command.Connection = connection;

            SqlDataReader reader;
            DataTable table = new DataTable();
            connection.Open();

            reader = command.ExecuteReader();
            if (reader.Read())
            {
                Titulo.Text = reader["Titulo"].ToString();
                Resumo.Text = reader["Resumo"].ToString();
                Capa.ImageUrl = reader["Capa"].ToString();
                Editora.Text = reader["Editora"].ToString();
                Area.Text = reader["Area"].ToString();
            }
            reader.Close();

            // Obter lista de autores
            SqlCommand commandAutores = new SqlCommand
            {
                Connection = connection,
                CommandText = "SELECT DISTINCT A.Nome FROM Autor A "
                + "JOIN LivroAutor LA ON A.Id = LA.Autor " + "WHERE LA.Livro = @id"
            };

            commandAutores.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
            SqlDataReader readerAutores = commandAutores.ExecuteReader();
            DataTable tableAutores = new DataTable();

            tableAutores.Load(readerAutores);
            connection.Close();

            GridAutores.DataSource = tableAutores;
            GridAutores.DataBind();
        }
    }
}