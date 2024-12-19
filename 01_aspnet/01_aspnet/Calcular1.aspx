<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calcular1.aspx.cs" Inherits="_01_aspnet.Calcular1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Operações Aritméticas</title>
    <link href="Content\bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>ASP.NET - Server side code</h1>
            <p>Operações Aritméticas</p>
            <table class="table table-bordered">
                <tr>
                    <th class="">Valor 1</th>
                    <td class="controlo">
                        <asp:TextBox ID="textBoxValor1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <th class="">Valor 2</th>
                    <td class="controlo">
                        <asp:TextBox ID="textBoxValor2" runat="server" />
                    </td>
                </tr>
                <tr>
                    <th class="">Resultado</th>
                    <td class="controlo">
                        <asp:TextBox ID="textBoxResultado" runat="server" />
                    </td>
                </tr>
            </table>
            <div class="text-centered">
                <asp:Button ID="buttonSomar" runat="server" Text="+" OnClick="ButtonSomar_Click" CssClass="btn btn-primary" />
                <asp:Button ID="buttonSubtrair" runat="server" Text="-" OnClick="ButtonSubtrair_Click" CssClass="btn btn-primary" />
                <asp:Button ID="buttonMultiplicar" runat="server" Text="*" OnClick="ButtonMultiplicar_Click" CssClass="btn btn-primary" />
                <asp:Button ID="buttonDividir" runat="server" Text="/" OnClick="ButtonDividir_Click" CssClass="btn btn-primary" />
            </div>
        </div>
    </form>
</body>
</html>
