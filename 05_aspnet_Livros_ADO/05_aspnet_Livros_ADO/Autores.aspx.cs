using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace _05_aspnet_Livros_ADO
{
    public partial class Autores : System.Web.UI.Page
    {
        private SqlConnection connection = new SqlConnection
            (@"Data Source=.\SqlExpress; " +
                @"Initial Catalog = Livros;" +
                    "Integrated Security=True;");

        /* 8.  Execute o método GetAutores no evento Load do Web Form */
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack == false)
                GetAutores();
        }
        /* 6.  Crie um método que efetue o preenchimento do controlo gridAutores 
         * com a informação da tabela Autor da base de dados Livro */

        void GetAutores()
        {
            // Definir query para obter os dados 
            SqlCommand command = new SqlCommand
            {
                Connection = connection,
                CommandText =
            "SELECT Id, Nome, Biografia FROM Autor ORDER BY Nome"
            };

            SqlDataReader reader;
            connection.Open();
            reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            connection.Close();

            // Mostrar dados no controlo GridView 
            gridAutores.DataSource = table;
            gridAutores.DataBind();
        }

        protected void GridAutores_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.Cells.Count > 1)
            {
                // Ocultar cabeçalho da coluna Nome 
                if (e.Row.RowType == DataControlRowType.Header)
                    e.Row.Cells[2].Visible = false;

                e.Row.Cells[0].Width = 80;
                e.Row.Cells[0].HorizontalAlign = HorizontalAlign.Center;

                // Ocultar coluna referente ao Id (chave primária) 
                e.Row.Cells[1].Visible = false;
                e.Row.Cells[2].Width = 300;

                // Ocultar coluna referente à Biografia 
                e.Row.Cells[3].Visible = false;

                // Tratar caracteres especiais 
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    e.Row.Cells[2].Text = Server.HtmlDecode(e.Row.Cells[2].Text);
                    e.Row.Cells[3].Text = Server.HtmlDecode(e.Row.Cells[3].Text);
                }
            }
        }
        protected void ButtonInserir_Click(object sender, EventArgs e)
        {
            // Definir query para criar registo 
            SqlCommand command = new SqlCommand
            {
                Connection = connection,
                CommandText = "INSERT Autor(Nome, Biografia) VALUES(@nome, @biografia)"
            };

            // Ler valores definidos nos campos Nome e Biografia 
            command.Parameters.AddWithValue("@nome", textBoxNome.Text);
            command.Parameters.AddWithValue("@biografia", textBoxBiografia.Text);

            // Executar query 
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

            // Atualizar controlo gridAutores 
            GetAutores();
        }
        protected void ButtonAtualizar_Click(object sender, EventArgs e)
        {
            //definir query para criar registo 
            SqlCommand command = new SqlCommand
            {
                Connection = connection,
                CommandText = "UPDATE Autor SET Nome = @nome, Biografia = @biografia "
            + "WHERE Id = @id"
            };

            // Ler valores definidos nos campos Nome e Biografia 
            command.Parameters.AddWithValue("@nome", textBoxNome.Text);
            command.Parameters.AddWithValue("@biografia", textBoxBiografia.Text);

            // Obter Id referente ao autor selecionado 
            command.Parameters.AddWithValue("@id", gridAutores.SelectedRow.Cells[1].Text);

            // Executar query 
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

            // Atualizar controlo gridAutores 
            GetAutores();
        }

        protected void ButtonEliminar_Click(object sender, EventArgs e)
        {
            // Definir query para criar registo 
            SqlCommand command = new SqlCommand
            {
                Connection = connection,
                CommandText = "DELETE Autor where Id = @id"
            };

            // Obter Id referente ao autor selecionado 
            command.Parameters.AddWithValue("@id", gridAutores.SelectedRow.Cells[1].Text);

            // Executar query 
            try
            {
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
            catch (Exception)
            {
                string mensagem = "O autor " +
                gridAutores.SelectedRow.Cells[2].Text + " não pode ser eliminado.";
                Response.Write("<script>alert('" + mensagem + "')</script>");
            }

            // Atualizar controlo gridAutores 
            GetAutores();
        }
        protected void GridAutores_SelectedIndexChanged(object sender, EventArgs e)
        {
            textBoxNome.Text = gridAutores.SelectedRow.Cells[2].Text;
            textBoxBiografia.Text = gridAutores.SelectedRow.Cells[3].Text;
        }
    }
}