using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace _05_aspnet_Livros_ADO
{
    public partial class Editoras : System.Web.UI.Page
    {
        private SqlConnection connection = new SqlConnection
        (@"Data Source=.\SqlExpress; " +
            @"Initial Catalog = Livros;" +
                "Integrated Security=True;");

        /* 8.  Execute o método GetAutores no evento Load do Web Form */
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack == false)
                GetEditoras();
        }
        /* 6.  Crie um método que efetue o preenchimento do controlo gridAutores 
         * com a informação da tabela Autor da base de dados Livro */

        void GetEditoras()
        {
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "SELECT Id, Nome, Morada FROM Editora ORDER BY Nome";

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            connection.Close();

            gridEditoras.DataSource = table;
            gridEditoras.DataBind();
        }

        protected void GridEditoras_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.Cells.Count > 1)
            {
                e.Row.Cells[0].Width = 80;
                e.Row.Cells[0].HorizontalAlign = HorizontalAlign.Center;
                e.Row.Cells[1].Visible = false;
                e.Row.Cells[2].Width = 300;

                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    e.Row.Cells[2].Text = Server.HtmlDecode(e.Row.Cells[2].Text);
                }
            }
        }

        protected void ButtonInserir_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "INSERT Editora(Nome, Morada) VALUES(@nome, @morada)";

            command.Parameters.AddWithValue("@nome", textBoxNome.Text);
            command.Parameters.AddWithValue("@morada", textBoxMorada.Text);

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

            GetEditoras();
        }

        protected void ButtonAtualizar_Click(object sender, EventArgs e)
        {
            if (gridEditoras.SelectedRow != null)
            {
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText = "UPDATE Editora SET Nome = @nome, Morada = @morada WHERE Id = @id";

                command.Parameters.AddWithValue("@nome", textBoxNome.Text);
                command.Parameters.AddWithValue("@morada", textBoxMorada.Text);
                command.Parameters.AddWithValue("@id", gridEditoras.SelectedRow.Cells[1].Text);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();

                GetEditoras();
            }
        }

        protected void ButtonEliminar_Click(object sender, EventArgs e)
        {
            if (gridEditoras.SelectedRow != null)
            {
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText = "DELETE Editora WHERE Id = @id";

                command.Parameters.AddWithValue("@id", gridEditoras.SelectedRow.Cells[1].Text);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    GetEditoras();
                }
                catch (Exception)
                {
                    string mensagem = "A editora " + gridEditoras.SelectedRow.Cells[2].Text + " não pode ser eliminada.";
                    Response.Write("<script>alert('" + mensagem + "')</script>");
                }
            }
        }
        protected void GridEditoras_SelectedIndexChanged(object sender, EventArgs e)
        {
            textBoxNome.Text = gridEditoras.SelectedRow.Cells[2].Text;
            textBoxMorada.Text = gridEditoras.SelectedRow.Cells[3].Text;
        }
    }
}
