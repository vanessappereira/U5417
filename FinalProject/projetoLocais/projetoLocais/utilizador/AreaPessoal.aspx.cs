using System;
using System.Data;
using System.Data.SqlClient;

namespace projetoLocais.utilizador
{
    public partial class areaPessoal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ObterLocais();
            }
        }

        void ObterLocais()
        {
            // verificar se o Id do utilizador se encontra em Session 
            if (Session["id_utilizador"] != null)
            {
                SqlConnection connection = new SqlConnection(
                @"data source=.\Sqlexpress; initial catalog = Locais; integrated security = true;");

                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetLocaisByUtilizador";

                // associar Id do utilizador ao comando, de forma a 
                // obter apenas os locais criados pelo utilizador 
                command.Parameters.AddWithValue("@utilizador", Session["id_utilizador"].ToString());

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                DataTable table = new DataTable();
                table.Load(reader);
                reader.Close();
                connection.Close();

                if (table != null && table.Rows.Count > 0)
                {
                    gridLocais.DataSource = table;
                    gridLocais.DataBind();
                    semLocais.Visible = false;
                }
                else
                {
                    semLocais.Visible = true;
                }
            }
            else
            {
                // Adicionar uma mensagem de log aqui se Session["id_utilizador"] for nulo
                Response.Write("Session id_utilizador é nulo.");
            }
        }

        protected void btnCriarLocal_Click(object sender, EventArgs e)
        {
            // Redirecionar para a página de criação de local
            Response.Redirect("~/utilizador/criarLocal.aspx");
        }

        protected void btnEditarLocal_Click(object sender, EventArgs e)
        {
            // Redirecionar para a página de edição de local
            Response.Redirect("~/utilizador/editarLocal.aspx");
        }
    }
}
