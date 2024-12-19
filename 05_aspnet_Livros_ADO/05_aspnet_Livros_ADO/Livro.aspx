<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Livro.aspx.cs" Inherits="_05_aspnet_Livros_ADO.Livro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title>Livro</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <table class="table mt-4" style="width: 1000px;">
                <thead>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Titulo" runat="server" CssClass="h2" Style="color: blue;" />
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width: 400px;">
                            <asp:Image ID="Capa" runat="server" CssClass="img-fluid" Height="260" />
                        </td>
                        <td style="width: 600px;">
                            <asp:Label ID="Resumo" runat="server" CssClass="lead" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Editora" runat="server" />
                        </td>
                        <td>
                            <asp:Label ID="Area" runat="server" />
                        </td>
                    </tr>
                </tbody>
            </table>


            <div class="row">
                <div class="col">
                    <h3>Autores</h3>
                    <asp:GridView ID="GridAutores" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
