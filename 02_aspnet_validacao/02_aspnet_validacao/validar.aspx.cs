using System;
using System.Web.UI.WebControls;

namespace _02_aspnet_validacao
{
    public partial class validar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CustomValidatorNome_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if ((args.Value.Length >= 5) && (args.Value.Length <= 20)) { args.IsValid = true; }
            else { args.IsValid = false; }
        }
    }
}