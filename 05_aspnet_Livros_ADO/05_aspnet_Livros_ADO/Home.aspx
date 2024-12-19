<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="_05_aspnet_Livros_ADO.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title>Home</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:DataList ID="ListLivros" runat="server"
            RepeatColumns="3" RepeatDirection="Horizontal"
            CssClass="mt-5">
            <ItemTemplate>
                <table style="margin-bottom: 60px; border-collapse: collapse; border-style: solid; border-color: #808080; border-width: 1px;">
                    <tr>
                        <td rowspan="4" style="height: 300px; width: 250px; text-align: center; vertical-align: middle;">
                            <a href="livro.aspx?id=<%# Eval("Id") %>">
                                <asp:Image ImageUrl='<%# Eval("Capa") %>'
                                    runat="server" ID="capa" Height="260" />
                            </a>
                        </td>
                        <td style="height: 60px;"></td>
                    </tr>
                    <tr>
                        <td style="height: 50px; width: 180px; margin-left: 10px;">
                            <a href="livro.aspx?id=<%# Eval("Id") %>"
                                class="link" style="text-decoration: none;">
                                <asp:Label ID="Titulo" runat="server"
                                    Style="font-size: 18pt; font-weight: bold;"
                                    Text='<%# Eval("Titulo") %>' CssClass="link" />
                            </a>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td>
                            <asp:Label ID="area" runat="server" Text='<%# Eval("Area") %>' />
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td>
                            <asp:Label ID="editora" runat="server" Text='<%# Eval("Editora") %>' />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <div class="mt-1 container text-center" style="margin-bottom: 100px;">
            <asp:LinkButton Text="Primeira" runat="server" ID="LinkPrimeira"
                CssClass="text-decoration-none fs-5" OnClick="LinkPrimeira_Click" />

            <asp:LinkButton Text="Anterior" runat="server" ID="LinkAnterior"
                CssClass="ms-3 text-decoration-none fs-5" OnClick="LinkAnterior_Click" />
            
            <asp:LinkButton Text="Seguinte" runat="server" ID="LinkSeguinte"
                CssClass="ms-3 text-decoration-none fs-5" OnClick="LinkSeguinte_Click" />
            
            <asp:LinkButton Text="Última" runat="server" ID="LinkUltima"
                CssClass="ms-3 text-decoration-none fs-5" OnClick="LinkUltima_Click" />
        </div>
    </form>
</body>
</html>
