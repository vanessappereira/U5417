using System;

namespace _03_aspnet_WebUserControl
{
    public partial class Controlos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Endereco1.Titulo = "Endereço de envio";
            Endereco2.Titulo = "Endereço de faturação";
        }
        protected void CheckBoxIguais_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxIguais.Checked == true)
            {
                Endereco2.Nome = Endereco1.Nome;
                Endereco2.Morada = Endereco1.Morada;
                Endereco2.Localidade = Endereco1.Localidade;
                Endereco2.CodigoPostal = Endereco1.CodigoPostal;
                Endereco2.Telemovel = Endereco1.Telemovel;
                Endereco2.Email = Endereco1.Email;
            }
            else
            {
                Endereco2.Nome = "";
                Endereco2.Morada = "";
                Endereco2.Localidade = "";
                Endereco2.CodigoPostal = "";
                Endereco2.Telemovel = "";
                Endereco2.Email = "";
            }
        }
    }
}