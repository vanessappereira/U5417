<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dados.aspx.cs" Inherits="Gestao_Dados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <th></th>
                    <th>
                        <asp:LoginName ID="LoginName1" runat="server" />
                    </th>
                </tr>
                <tr>
                    <td>
                        <asp:LoginStatus ID="LoginStatus1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Dados</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="buttonDefinirDados" runat="server" Text="Definir dados" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
