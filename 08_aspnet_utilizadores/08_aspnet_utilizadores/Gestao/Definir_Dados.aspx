<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Definir_Dados.aspx.cs" Inherits="Gestao_Definir_Dados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table border="1">
                <tr>
                    <td>Nome</td>
                    <td>
                        <asp:TextBox ID="textNome" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Idade</td>
                    <td>
                        <asp:TextBox ID="textIdade" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Data de Inscrição</td>
                    <td>
                        <asp:TextBox ID="textDataInscricao" runat="server" TextMode="MultiLine" Width="300px" Height="100px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="buttonGuardarDados" runat="server" Text="Guardar dados" Click="ButtonGuardarDados_Click" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:HyperLink ID="voltarDados" runat="server">Voltar a Dados.aspx</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
