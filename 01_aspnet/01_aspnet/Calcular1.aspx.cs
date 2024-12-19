using System;

namespace _01_aspnet
{
    public partial class Calcular1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ButtonSomar_Click(object sender, EventArgs e)
        {
            if (int.TryParse(textBoxValor1.Text, out int valor1) && int.TryParse(textBoxValor2.Text, out int valor2))
            {
                int resultado = valor1 + valor2;
                textBoxResultado.Text = resultado.ToString();
            }
            else
            {
                textBoxResultado.Text = "Erro: Insira valores inteiros válidos.";
            }
        }
        protected void ButtonSubtrair_Click(object sender, EventArgs e)
        {
            if (int.TryParse(textBoxValor1.Text, out int valor1) && int.TryParse(textBoxValor2.Text, out int valor2))
            {
                int resultado = valor1 - valor2;
                textBoxResultado.Text = resultado.ToString();
            }
            else
            {
                textBoxResultado.Text = "Erro: Insira valores inteiros válidos.";
            }
        }
        protected void ButtonMultiplicar_Click(object sender, EventArgs e)
        {
            if (int.TryParse(textBoxValor1.Text, out int valor1) && int.TryParse(textBoxValor2.Text, out int valor2))
            {
                int resultado = valor1 * valor2;
                textBoxResultado.Text = resultado.ToString();
            }
            else
            {
                textBoxResultado.Text = "Erro: Insira valores inteiros válidos.";
            }
        }
        protected void ButtonDividir_Click(object sender, EventArgs e)
        {
            if (int.TryParse(textBoxValor1.Text, out int valor1) && int.TryParse(textBoxValor2.Text, out int valor2))
            {
                double resultado = (double)valor1 / valor2;
                textBoxResultado.Text = resultado.ToString();
            }
            else
            {
                textBoxResultado.Text = "Erro: Insira valores inteiros válidos.";
            }
        }
    }
}