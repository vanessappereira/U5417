<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LivrosRepeater.aspx.cs" Inherits="_05_aspnet_Livros_ADO.LivrosRepeater" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title>Livros - Repeater</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Repeater ID="RepeaterLivros" runat="server">
            <HeaderTemplate>
                <table class="table table-bordered table-striped mt-4"
                    style="width: 1000px;">
                    <tr>
                        <th style="width: 600px;">Livro</th>
                        <th style="width: 150px;">Área</th>
                        <th></th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr style="height: 180px; vertical-align: middle;">
                    <td><%# Eval("Titulo") %></td>
                    <td><%# Eval("Area") %></td>
                    <td>
                        <img src="<%# Eval("Capa") %>" alt="<%# Eval("Titulo") %>"
                            height="150" />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </form>
</body>
</html>
