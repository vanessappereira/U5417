<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Livros.aspx.cs" Inherits="_05_aspnet_Livros_ADO.Livros" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title>Livros</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Livros</h2>
        <div class="container mt-5">
            <%-- GridView for displaying books --%>
            <asp:GridView ID="gridLivros" runat="server" AutoGenerateSelectButton="True"
                CssClass="table-borderless table-hover" OnRowDataBound="GridLivros_RowDataBound"
                OnSelectedIndexChanged="GridLivros_SelectedIndexChanged">
            </asp:GridView>

            <%-- Form fields with labels --%>
            <div class="form-group mt-4">
                <asp:Label ID="labelTitulo" runat="server" Text="Título:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="textTitulo" runat="server" CssClass="form-control" Width="350px"></asp:TextBox>
            </div>

            <div class="form-group mt-2">
                <asp:Label ID="labelResumo" runat="server" Text="Resumo:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="textResumo" runat="server" CssClass="form-control" Width="600px"
                    TextMode="MultiLine" Rows="3"></asp:TextBox>
            </div>

            <div class="form-group mt-2">
                <asp:Label ID="labelEditora" runat="server" Text="Editora:" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="listEditora" runat="server" CssClass="form-select" Width="300px">
                </asp:DropDownList>
            </div>

            <div class="form-group mt-2">
                <asp:Label ID="labelArea" runat="server" Text="Área:" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="listArea" runat="server" CssClass="form-select" Width="300px">
                </asp:DropDownList>
            </div>

            <div class="form-group mt-2">
                <asp:Label ID="labelCapa" runat="server" Text="Capa:" CssClass="form-label"></asp:Label>
                <asp:FileUpload ID="ficheiro" runat="server" CssClass="form-control" />
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
