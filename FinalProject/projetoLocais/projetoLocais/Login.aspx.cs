using System;
using System.Data.SqlClient;
using System.Web.Security;

namespace projetoLocais
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                Response.Redirect("paginaInicial.aspx"); // Redireciona para a página de início ou outra página desejada
            }
        }
        protected void loginUtilizador_LoggedIn(object sender, EventArgs e)
        {
            //obter dados do utilizador - Membership 
            MembershipUser user = Membership.GetUser(loginUtilizador.UserName);

            //Login de utilizador - obter ID (chave primária - Utilizador) e colocar em Session 

            SqlConnection connection = new SqlConnection(
            @"data source=.\Sqlexpress; initial catalog = Locais; integrated security = true;");
            string id = "";
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "SELECT Id FROM Utilizador WHERE ID = @user_id";
            command.Parameters.AddWithValue("@user_id", user.ProviderUserKey.ToString());

            connection.Open();
            SqlDataReader reader;
            reader = command.ExecuteReader();
            while (reader.Read())
            {
                id = reader[0].ToString();
            }
            connection.Close();

            Session["id_utilizador"] = id;

            Response.Redirect("paginaInicial.aspx");
        }
    }
}