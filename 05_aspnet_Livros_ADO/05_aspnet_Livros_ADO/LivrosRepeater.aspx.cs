using System;
using System.Data;
using System.Data.SqlClient;

namespace _05_aspnet_Livros_ADO
{
    public partial class LivrosRepeater : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection
             (@"Data Source=.\SqlExpress; " +
                 @"Initial Catalog =Livros;" +
                   "Integrated Security=True;");

            SqlCommand command = new SqlCommand
            {
                CommandText = "SELECT L.Titulo, L.Capa, A.Nome 'Area' FROM "
                + "Livro L JOIN Area A ON L.Area = A.ID ORDER BY L.Titulo ASC",
                Connection = connection
            };
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            DataTable table = new DataTable();
            table.Load(reader);
            reader.Close();
            connection.Close();

            RepeaterLivros.DataSource = table;
            RepeaterLivros.DataBind();

        }
    }
}