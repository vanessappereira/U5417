<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="areaPessoal.aspx.cs" Inherits="projetoLocais.utilizador.areaPessoal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <style>
        .flex-container {
            padding-top: 10px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .welcome-message {
            flex: 1;
        }

        .button-container {
            flex: 1;
            display: flex;
            gap: 10px;
        }

        .styled-button {
            width: 50%;
            padding: 10px;
            background-color: #A59D84;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

            .styled-button:hover {
                background-color: #45a049;
            }
    </style>
    <asp:SqlDataSource ID="ObterLocaisUser" runat="server" ConnectionString="Data Source=.\sqlexpress;Initial Catalog=Locais;Integrated Security=True;Encrypt=False"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Nome], [Morada], [Localidade], [Concelho], [Id], [Utilizador] FROM [Local]">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="id_utilizador" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div class="flex-container">
        <div class="welcome-message">
            <h3>Bem vindo,
                <asp:Literal ID="nomeUtilizadorLiteral" runat="server"></asp:Literal>
            </h3>
        </div>
        <div class="button-container">
            <asp:Button ID="btnCriarLocal" runat="server" Text="Criar Local" OnClick="btnCriarLocal_Click" CssClass="styled-button" />
            <asp:Button ID="btnEditarLocal" runat="server" Text="Editar Local" OnClick="btnEditarLocal_Click" CssClass="styled-button" />
        </div>
    </div>
    <asp:DataList ID="gridLocais" runat="server" DataKeyField="Id" DataSourceID="ObterLocaisUser">
        <ItemTemplate>
            Nome:
                <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' />
            <br />
            Morada:
                <asp:Label ID="MoradaLabel" runat="server" Text='<%# Eval("Morada") %>' />
            <br />
            Localidade:
                <asp:Label ID="LocalidadeLabel" runat="server" Text='<%# Eval("Localidade") %>' />
            <br />
            Concelho:
                <asp:Label ID="ConcelhoLabel" runat="server" Text='<%# Eval("Concelho") %>' />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:Panel ID="semLocais" runat="server" Visible="false">
        <p>Não foram encontrados locais.</p>
    </asp:Panel>
</asp:Content>
