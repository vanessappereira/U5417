using System;
using System.Web;
using System.Web.Security;

namespace projetoLocais
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void loginStatusUtilizador_LoggedOut(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            HttpContext.Current.Session.Abandon();
            Response.Redirect("~/paginaInicial.aspx");
        }
    }
}