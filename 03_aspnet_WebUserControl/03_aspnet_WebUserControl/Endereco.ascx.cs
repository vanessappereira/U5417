using System;

namespace _03_aspnet_WebUserControl
{
    public partial class Endereco : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string Titulo
        {
            get { return labelTitulo.Text; }
            set { labelTitulo.Text = value; }
        }
        public string Nome
        {
            get { return textBoxNome.Text; }
            set { textBoxNome.Text = value; }
        }
        public string Morada
        {
            get { return textBoxMorada.Text; }
            set { textBoxMorada.Text = value; }
        }
        public string CodigoPostal
        {
            get { return textBoxCodigoPostal.Text; }
            set { textBoxCodigoPostal.Text = value; }
        }
        public string Localidade
        {
            get { return textBoxLocalidade.Text; }
            set { textBoxLocalidade.Text = value; }
        }
        public string Telemovel
        {
            get { return textBoxTelemovel.Text; }
            set { textBoxTelemovel.Text = value; }
        }
        public string Email
        {
            get { return textBoxEmail.Text; }
            set => textBoxEmail.Text = value;
        }
    }
}