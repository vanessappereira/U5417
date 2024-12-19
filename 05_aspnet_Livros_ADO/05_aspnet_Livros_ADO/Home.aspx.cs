using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace _05_aspnet_Livros_ADO
{
    public partial class Home : System.Web.UI.Page
    {
        int currentPage;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetLivros();
                ViewState["contador"] = 0;
            }
            currentPage = (int)ViewState["contador"];
        }
        void BindListLivros(DataTable table)
        {
            PagedDataSource paged = new PagedDataSource();
            paged.DataSource = table.DefaultView;
            paged.PageSize = 6;
            paged.AllowPaging = true;
            paged.CurrentPageIndex = currentPage;
            LinkPrimeira.Enabled = !paged.IsFirstPage;
            LinkAnterior.Enabled = !paged.IsFirstPage;
            LinkSeguinte.Enabled = !paged.IsLastPage;
            LinkUltima.Enabled = !paged.IsLastPage;
            ViewState["total"] = paged.PageCount;
            ListLivros.DataSource = paged;
            ListLivros.DataBind();
            ViewState["dataSource"] = table;
        }
        void GetLivros()
        {
            SqlConnection connection = new SqlConnection
            (@"data source=.\sqlexpress; initial catalog = Livros; integrated security=true;");
            SqlCommand command = new SqlCommand();
            command.CommandText = "SELECT L.ID, L.Titulo, L.Capa, E.Nome 'Editora', A.Nome 'Area' "
           + "FROM Livro L JOIN Editora E ON L.Editora = E.ID JOIN Area A ON L.Area = A.ID "
           + "ORDER BY L.Titulo";
            command.Connection = connection;
            SqlDataReader reader;
            DataTable table = new DataTable();
            connection.Open();
            reader = command.ExecuteReader();
            table.Load(reader);
            connection.Close();
            BindListLivros(table);
        }
        protected void LinkPrimeira_Click(object sender, EventArgs e)
        {
            currentPage = 0;
            ViewState["contador"] = currentPage;
            GetLivros();
        }
        protected void LinkAnterior_Click(object sender, EventArgs e)
        {
            // Obter valor da paginação atual
            currentPage = (int)ViewState["contador"];
            currentPage -= 1;
            ViewState["contador"] = currentPage;

            //Utilizar dados do DataTable que se encontram em ViewState
            BindListLivros((DataTable)ViewState["dataSource"]);
        }
        protected void LinkSeguinte_Click(object sender, EventArgs e)
        {
            // Obter valor da paginação atual
            currentPage = (int)ViewState["contador"];
            currentPage += 1;
            ViewState["contador"] = currentPage;

            //Utilizar dados do DataTable que se encontram em ViewState
            BindListLivros((DataTable)ViewState["dataSource"]);
        }
        protected void LinkUltima_Click(object sender, EventArgs e)
        {
            // A varável "total" tem o total de páginas do DataList
            currentPage = (int)ViewState["total"] - 1;
            ViewState["contador"] = currentPage;

            //Utilizar dados do DataTable que se encontram em ViewState
            BindListLivros((DataTable)ViewState["dataSource"]);
        }
    }
}