using System;
using System.Data.SqlClient;
using System.Web.Security;

namespace projetoLocais
{
    public partial class CriarConta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void buttonCriarConta_Click(object sender, EventArgs e)
        {
            // Criar conta - Membership 
            Membership.CreateUser(textUsername.Text, textPassword.Text, textEmail.Text);

            // Obter o UserID 
            MembershipUser user = Membership.GetUser(textUsername.Text);
            object user_id = user.ProviderUserKey;

            // Criar Utilizador (Locais.Utilizador) 

            SqlConnection connection = new SqlConnection(
            @"data source=.\Sqlexpress; initial catalog = Locais; integrated security = true;");

            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "INSERT Utilizador(Id, Nome, Email, DataNascimento) " +
                "VALUES(@nome, @email, @data, @user_id)";

            command.Parameters.AddWithValue("@nome", textNome.Text);
            command.Parameters.AddWithValue("@email", textEmail.Text);
            command.Parameters.AddWithValue("@data", DateTime.Parse(textData.Text));
            command.Parameters.AddWithValue("@user_id", user_id.ToString());

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

            Response.Redirect("login.aspx");

        }
    }
}