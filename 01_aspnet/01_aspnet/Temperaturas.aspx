<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Temperaturas.aspx.cs" Inherits="_01_aspnet.Temperaturas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Conversão de Temperaturas</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Conversão de Temperaturas</h1>
            <table class="table table-bordered">
                <tr>
                    <th>Temperatura: </th>
                    <td>
                        <asp:TextBox ID="textBoxTemperatura" runat="server" /></td>
                </tr>
                <tr>
                    <th>De</th>
                    <th>Para</th>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButtonList ID="radioButtonDe" runat="server">
                            <asp:ListItem Value="Celsius"> Celsius </asp:ListItem>
                            <asp:ListItem Value="Fahrenheit"> Fahrenheit </asp:ListItem>
                            <asp:ListItem Value="Kelvin"> Kelvin </asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="radioButtonPara" runat="server">
                            <asp:ListItem Value="Celsius"> Celsius </asp:ListItem>
                            <asp:ListItem Value="Fahrenheit"> Fahrenheit </asp:ListItem>
                            <asp:ListItem Value="Kelvin"> Kelvin </asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <th>Resultado</th>
                    <td>
                        <asp:TextBox ID="textBoxResultado" runat="server" ReadOnly="true" />
                    </td>
                </tr>
            </table>
            <asp:Button ID="buttonConverter" runat="server" Text="Converter" OnClick="ButtonConverter_Click" CssClass="btn btn-primary" />
        </div>
    </form>
</body>
</html>
