<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Autores.aspx.cs" Inherits="_05_aspnet_Livros_ADO.Autores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title>Autores</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Autores</h2>
        <div class="container mt-5">
            <asp:GridView ID="gridAutores" runat="server" OnRowDataBound="GridAutores_RowDataBound" AutoGenerateSelectButton="true" CssClass="table-borderless table-hover" OnSelectedIndexChanged="GridAutores_SelectedIndexChanged" />

            <asp:Label ID="labelNome" runat="server" Text="Nome" />
            <asp:TextBox ID="textBoxNome" runat="server" Width="350" CssClass="form-control" />

            <asp:Label ID="labelBiografia" runat="server" Text="Biografia" />
            <asp:TextBox ID="textBoxBiografia" runat="server" Width="600" CssClass="form-control" TextMode="MultiLine" Rows="5" />
        </div>

        <div class="mt-3">
            <asp:Button ID="buttonInsert" runat="server" Text="Inserir autor" CssClass="btn btn-outline-dark" OnClick="ButtonInserir_Click" />
            <asp:Button ID="buttonUpdate" runat="server" Text="Atualizar autor" CssClass="btn btn-outline-dark ml-5" OnClick="ButtonAtualizar_Click" />
            <asp:Button ID="buttonDelete" runat="server" Text="Eliminar autor" CssClass="btn btn-outline-dark ml-5" OnClick="ButtonEliminar_Click" />
        </div>
    </form>
</body>
</html>
