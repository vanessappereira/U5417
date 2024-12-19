<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Areas.aspx.cs" Inherits="_05_aspnet_Livros_ADO.Areas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title>Areas</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Areas</h2>
        <div class="container mt-5">
            <asp:GridView ID="gridAreas" runat="server" OnRowDataBound="GridAreas_RowDataBound" AutoGenerateSelectButton="true" CssClass="table-borderless table-hover" OnSelectedIndexChanged="GridAreas_SelectedIndexChanged" />

          <div class="form-group mt-4">
              <asp:TextBox ID="textBoxNome" runat="server" CssClass="form-control" placeholder="Nome da Área" Width="350px" />
          </div>

        </div>

        <div class="mt-3">
            <asp:Button ID="buttonInsert" runat="server" Text="Inserir autor" CssClass="btn btn-outline-dark" OnClick="ButtonInserir_Click" />
            <asp:Button ID="buttonUpdate" runat="server" Text="Atualizar autor" CssClass="btn btn-outline-dark ml-5" OnClick="ButtonAtualizar_Click" />
            <asp:Button ID="buttonDelete" runat="server" Text="Eliminar autor" CssClass="btn btn-outline-dark ml-5" OnClick="ButtonEliminar_Click" />
        </div>
    </form>
</body>
</html>
