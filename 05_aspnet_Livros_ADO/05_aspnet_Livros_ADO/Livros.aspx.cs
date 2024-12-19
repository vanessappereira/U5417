using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace _05_aspnet_Livros_ADO
{
    public partial class Livros : System.Web.UI.Page
    {
        private SqlConnection connection = new SqlConnection
             (@"Data Source=.\SqlExpress; " +
                 @"Initial Catalog =Livros;" +
                   "Integrated Security=True;");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack == false)
            {
                GetAreas();
                GetEditoras();
                GetLivros();
            }
        }
        void GetLivros()
        {
            // Definir query para obter os dados
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText =
                "SELECT Id, Titulo, Resumo, Editora, Area FROM Livro ORDER BY Titulo";

            SqlDataReader reader;
            connection.Open();
            reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            connection.Close();

            // Mostrar dados no controlo GridView
            gridLivros.DataSource = table;
            gridLivros.DataBind();
        }
        void GetEditoras()
        {
            // Definir query para obter os dados
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText =
                "SELECT Id, Nome FROM Editora ORDER BY Nome";
            SqlDataReader reader;
            connection.Open();
            reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            connection.Close();

            // Mostrar dados no controlo DropDownList
            listEditora.DataSource = table;
            listEditora.DataTextField = "Nome";
            listEditora.DataValueField = "Id";
            listEditora.DataBind();
        }

        void GetAreas()
        {
            // Definir query para obter os dados
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "SELECT Id, Nome FROM Area ORDER BY Nome";
            SqlDataReader reader;
            connection.Open();
            reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            connection.Close();

            // Mostrar dados no controlo DropDownList
            listArea.DataSource = table;
            listArea.DataTextField = "Nome";
            listArea.DataValueField = "Id";
            listArea.DataBind();
        }

        protected void GridLivros_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.Cells.Count > 1)
            {
                // Definir largura e alinhamento da 1ª coluna (opção selecionar)
                e.Row.Cells[0].Width = 100;
                e.Row.Cells[0].HorizontalAlign = HorizontalAlign.Center;
                // Ocultar colunas: ID, Resumo, Editora e Área
                e.Row.Cells[1].Visible = false;
                e.Row.Cells[3].Visible = false;
                e.Row.Cells[4].Visible = false;
                e.Row.Cells[5].Visible = false;

                e.Row.Cells[2].Width = 700;

                // Aplicar HTML Decode sobre colunas que contêm texto
                // (caracteres especiais - exemplo: á, é, ç...)
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
                CommandText = "INSERT Livro(Titulo, Resumo, Editora, Area, Capa) " +
                "VALUES(@titulo, @resumo, @editora, @area, @capa)"
            };

            // Ler valores definidos nos campos 
            command.Parameters.AddWithValue("@titulo", textTitulo.Text);
            command.Parameters.AddWithValue("@resumo", textResumo.Text);
            command.Parameters.AddWithValue("@editora", listEditora.SelectedValue.ToString());
            command.Parameters.AddWithValue("@area", listArea.SelectedValue.ToString());

            if (ficheiro.HasFile)
            {
                bool ok = false;
                string[] ext = { ".jpg", ".jpeg", ".png", ".gif", ".tiff" };
                string extensao = System.IO.Path.GetExtension(ficheiro.FileName).ToString();
                foreach (string item in ext)
                    if (extensao == item)
                        ok = true;
                if (ok)
                {
                    ficheiro.SaveAs(Server.MapPath("imagens/") + ficheiro.FileName);
                    command.Parameters.AddWithValue("@capa", "imagens/" + ficheiro.FileName);
                }
                else
                {
                    // O tipo de ficheiro não é válido 
                    Response.Write("<script>alert('Selecione um ficheiro válido(jpg, jpeg, png, gif ou tiff).')</script>");
                    return;
                }
            }
            else
            {
                // Não foi selecionado qualquer ficheiro 
                Response.Write("<script>alert('Selecione um ficheiro.')</script>");
                return;
            }

            // Executar query 
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

            // Atualizar controlo gridLivros 
            GetLivros();
            gridLivros.DataBind();
        }
        protected void ButtonAtualizar_Click(object sender, EventArgs e)
        {
            // Definir query para alterar registo 
            SqlCommand command = new SqlCommand
            {
                Connection = connection,
                CommandText = "UPDATE Livro SET Titulo = @titulo, Resumo = @resumo," + " Editora = @editora, Area = @area, Capa = @capa WHERE Id = @id"
            };

            // Ler valores definidos nos campos 
            command.Parameters.AddWithValue("@titulo", textTitulo.Text);
            command.Parameters.AddWithValue("@resumo", textResumo.Text);
            command.Parameters.AddWithValue("@editora", listEditora.SelectedValue.ToString());
            command.Parameters.AddWithValue("@area", listArea.SelectedValue.ToString());
            command.Parameters.AddWithValue("@id", gridLivros.SelectedRow.Cells[1].Text);

            if (ficheiro.HasFile)
            {
                bool ok = false;
                string[] ext = { ".jpg", ".jpeg", ".png", ".gif", ".tiff" };
                string extensao = System.IO.Path.GetExtension(ficheiro.FileName).ToString();
                foreach (string item in ext)
                    if (extensao == item)
                        ok = true;
                if (ok)
                {
                    ficheiro.SaveAs(Server.MapPath("imagens/") + ficheiro.FileName);
                    command.Parameters.AddWithValue("@capa", "imagens/" + ficheiro.FileName);
                }
                else
                {
                    // O tipo de ficheiro não é válido 
                    Response.Write("<script>alert('Selecione um ficheiro válido(jpg, jpeg, png, gif ou tiff).')</script>");
                    return;
                }
            }
            else
            {
                // Não foi selecionado qualquer ficheiro 
                Response.Write("<script>alert('Selecione um ficheiro.')</script>");
                return;
            }


            // Executar query 
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

            // Atualizar controlo gridLivros 
            GetLivros();
            gridLivros.DataBind();
        }

        protected void ButtonEliminar_Click(object sender, EventArgs e)
        {
            // Definir query para eliminar registo 
            SqlCommand command = new SqlCommand
            {
                Connection = connection,
                CommandText = "DELETE Livro WHERE Id = @id"
            };

            // Ler Id do registo selecionado  
            command.Parameters.AddWithValue("@id", gridLivros.SelectedRow.Cells[1].Text);

            // Executar query 
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

            // Atualizar controlo gridLivros 
            GetLivros();
            gridLivros.DataBind();
        }
        protected void GridLivros_SelectedIndexChanged(object sender, EventArgs e)
        {
            textTitulo.Text = gridLivros.SelectedRow.Cells[2].Text;
            textResumo.Text = gridLivros.SelectedRow.Cells[3].Text;
            listEditora.SelectedValue = gridLivros.SelectedRow.Cells[4].Text;
            listArea.SelectedValue = gridLivros.SelectedRow.Cells[5].Text;
        }
    }
}