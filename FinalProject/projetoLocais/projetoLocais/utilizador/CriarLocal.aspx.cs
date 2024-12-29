using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

namespace projetoLocais.utilizador
{
    public partial class criarLocal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDistritos(); // Carregar distritos ao iniciar a página
            }
        }
        private void LoadDistritos()
        {
            string connectionString = @"data source=. \ sqlexpress; initial catalog=Locais; integrated security=true;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("SELECT Id, Nome FROM Distrito", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                listDistrito.DataSource = reader;
                listDistrito.DataTextField = "Nome";
                listDistrito.DataValueField = "Id";
                listDistrito.DataBind();
                listDistrito.Items.Insert(0, new ListItem("Selecione um Distrito", "0")); // Item inicial
            }
        }

        protected void listDistrito_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listDistrito.SelectedValue != "0")
            {
                LoadConcelhos(int.Parse(listDistrito.SelectedValue)); // Carregar concelhos com base no distrito selecionado
            }
            else
            {
                listConcelho.Items.Clear(); // Limpar concelhos se nenhum distrito for selecionado
                listConcelho.Items.Insert(0, new ListItem("Selecione um Concelho", "0"));
            }
        }

        private void LoadConcelhos(int distritoId)
        {
            string connectionString = @"data source=. \ sqlexpress; initial catalog=Locais; integrated security=true;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("SELECT Id, Nome FROM Concelho WHERE Distrito = @DistritoId", connection);
                command.Parameters.AddWithValue("@DistritoId", distritoId);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                listConcelho.DataSource = reader;
                listConcelho.DataTextField = "Nome";
                listConcelho.DataValueField = "Id";
                listConcelho.DataBind();
                listConcelho.Items.Insert(0, new ListItem("Selecione um Concelho", "0")); // Item inicial
            }
        }

        protected void buttonGuardar_Click(object sender, EventArgs e)
        {
            string connectionString = @"data source=. \ sqlexpress; initial catalog=Locais; integrated security=true;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("LocalCriar", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@nome", textNome.Text);
                command.Parameters.AddWithValue("@descricao", textDescricao.Text);
                if (textMorada.Text == "")
                    command.Parameters.AddWithValue("@morada", DBNull.Value);
                else
                    command.Parameters.AddWithValue("@morada", textMorada.Text);
                command.Parameters.AddWithValue("@localidade", textLocalidade.Text);
                command.Parameters.AddWithValue("@concelho", listConcelho.SelectedValue);
                command.Parameters.AddWithValue("@utilizador", Session["id_utilizador"]);

                command.Parameters.AddWithValue("@latitude", DBNull.Value);
                command.Parameters.AddWithValue("@longitude", DBNull.Value);

                connection.Open();
                ViewState["idLocal"] = command.ExecuteScalar(); // Armazenar o ID do novo local
                buttonGuardarFoto.Enabled = true;

                connection.Close();
            }

            Response.Redirect("paginaInicial.aspx"); // Redirecionar para a página inicial
        }
        protected void buttonGuardarFoto_Click(object sender, EventArgs e)
        {
            if (ficheiro.HasFile)
            {
                string fileName = Path.GetFileName(ficheiro.FileName);
                string filePath = Server.MapPath("~/imagens/") + fileName;
                ficheiro.SaveAs(filePath);

                // Salvar informações na base de dados
                string connectionString = @"data source=. \ sqlexpress; initial catalog=Locais; integrated security=true;";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("LocalFotoCriar", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@legenda", textLegenda.Text);
                    command.Parameters.AddWithValue("@ficheiro", "imagens/" + fileName);
                    command.Parameters.AddWithValue("@local", ViewState["idLocal"]); // ID do local

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }

                // Limpar campos após guardar
                textLegenda.Text = string.Empty;
                ficheiro.Attributes.Clear(); // Limpar o FileUpload
            }
        }

        protected void buttonEditarLegenda_Click(object sender, EventArgs e)
        {
            // Lógica para editar a legenda da foto selecionada
            // Exemplo: Atualizar a legenda na base de dados
        }

        protected void buttonEliminarFoto_Click(object sender, EventArgs e)
        {
            // Lógica para eliminar a foto selecionada
            // Exemplo: Remover a foto da base de dados e do sistema de arquivos
        }

        protected void buttonCancelarFoto_Click(object sender, EventArgs e)
        {
            // Limpar campos de entrada
            textLegenda.Text = string.Empty;
            ficheiro.Attributes.Clear(); // Limpar o FileUpload
        }
    }
}