<%@ Page Title="Criar Local" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="criarLocal.aspx.cs" Inherits="projetoLocais.utilizador.criarLocal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>Criar Local</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <style>
        div, h2 {
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .styled-input {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            background-color: #f8f8f8;
            font-size: 16px;
        }

        .large-input {
            width: 400px;
        }

        .styled-button {
            background-color: #A59D84;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

            .styled-button:hover {
                background-color: #a77d00;
            }
    </style>
    <div>
        <h2>Criar Local</h2>
        <asp:Label ID="labelNome" runat="server" Text="Nome:" />
        <asp:TextBox ID="textNome" runat="server" CssClass="styled-input" />
        <br />
        <asp:Label ID="labelDescricao" runat="server" Text="Descrição:" />
        <asp:TextBox ID="textDescricao" runat="server" TextMode="MultiLine" Rows="4" CssClass="styled-input" />
        <br />
        <asp:Label ID="labelMorada" runat="server" Text="Morada:" />
        <asp:TextBox ID="textMorada" runat="server" CssClass="styled-input" />
        <br />
        <asp:Label ID="labelLocalidade" runat="server" Text="Localidade:" />
        <asp:TextBox ID="textLocalidade" runat="server" CssClass="styled-input" />
        <br />
        <asp:Label ID="labelDistrito" runat="server" Text="Distrito:" />
        <asp:DropDownList ID="listDistrito" runat="server" CssClass="styled-input" OnSelectedIndexChanged="listDistrito_SelectedIndexChanged" AutoPostBack="true" />
        <br />
        <asp:Label ID="labelConcelho" runat="server" Text="Concelho:" />
        <asp:DropDownList ID="listConcelho" runat="server" CssClass="styled-input" />
        <br />
        <asp:Button ID="buttonGuardar" runat="server" Text="Guardar" CssClass="styled-button" OnClick="buttonGuardar_Click" />
    </div>
    <div>
        <h2>Adicionar Fotos ao Local</h2>
        <asp:Label ID="labelFicheiro" runat="server" Text="Ficheiro:" />
        <asp:FileUpload ID="ficheiro" runat="server" CssClass="styled-input" />
        <br />
        <asp:Label ID="labelLegenda" runat="server" Text="Legenda:" />
        <asp:TextBox ID="textLegenda" runat="server" CssClass="styled-input" />
        <br />
        <asp:Button ID="buttonGuardarFoto" runat="server" Text="Guardar Foto" CssClass="styled-button" OnClick="buttonGuardarFoto_Click" />
        <asp:Button ID="buttonEditarLegenda" runat="server" Text="Editar Legenda" CssClass="styled-button" OnClick="buttonEditarLegenda_Click" />
        <asp:Button ID="buttonEliminarFoto" runat="server" Text="Eliminar Foto" CssClass="styled-button" OnClick="buttonEliminarFoto_Click" />
        <asp:Button ID="buttonCancelarFoto" runat="server" Text="Cancelar Foto" CssClass="styled-button" OnClick="buttonCancelarFoto_Click" />
    </div>
</asp:Content>
