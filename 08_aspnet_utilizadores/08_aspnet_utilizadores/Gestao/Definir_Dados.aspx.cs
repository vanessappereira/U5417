using System;

public partial class Gestao_Definir_Dados : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        textDados.Text = "Nome - " + Profile.Nome + "\r\n" +
         "Idade - " + Profile.Idade.ToString() + "\r\n" +
         "Data de inscrição - " + Profile.DataInscricao.ToShortDateString();
    }
    protected void ButtonGuardarDados_Click(object sender, EventArgs e)
    {
        Profile.Nome = textNome.Text;
        Profile.Idade = int.Parse(textIdade.Text);
        Profile.DataInscricao = DateTime.Parse(textDataInscricao.Text);
    }
}