using System;

namespace _01_aspnet
{
    public partial class Temperaturas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ButtonConverter_Click(object sender, EventArgs e)
        {
            if (double.TryParse(textBoxTemperatura.Text, out double temperatura))
            {
                string de = radioButtonDe.SelectedValue;
                string para = radioButtonPara.SelectedValue;
                double resultado = 0;

                //Conversão da temperatura
                if (de == "Celsius")
                {
                    if (para == "Fahrenheit")
                    {
                        resultado = (temperatura * 9 / 5) + 32;
                    }
                    else if (para == "Kelvin")
                    {
                        resultado = temperatura + 273.15;
                    }
                }
                else if (de == "Fahrenheit")
                {
                    if (para == "Celsius")
                    {
                        temperatura = (temperatura - 32) * 5 / 9;
                    }
                    else if (para == "Kelvin")
                    {
                        resultado = (temperatura + 459.67) * 5 / 9;
                    }
                }
                else if (de == "Kelvin")
                {
                    if (para == "Celsius")
                    {
                        resultado = temperatura - 273.15;
                    }
                    else if (para == "Fahrenheit")
                    {
                        resultado = temperatura * 9 / 5 - 459.67;
                    }
                }
                textBoxResultado.Text = resultado.ToString();
            }
            else
            {
                textBoxResultado.Text = "Erro: Insira um valor numérico válido.";
            }
        }
    }
}