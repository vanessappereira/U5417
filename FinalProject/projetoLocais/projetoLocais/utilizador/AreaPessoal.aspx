<%@ Page Title="Area Pessoal" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="areaPessoal.aspx.cs" Inherits="projetoLocais.utilizador.areaPessoal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>Area Pessoal</title>
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
            justify-content: flex-end;
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
        ProviderName="System.Data.SqlClient" SelectCommand="GetLocaisByUtilizador" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="utilizador" SessionField="id_utilizador" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div class="flex-container">
        <div class="welcome-message">
            <h3>Área privada - 
                <asp:LoginName ID="LoginName1" runat="server" />
            </h3>
        </div>
        <div class="button-container">
            <asp:Button ID="btnCriarLocal" runat="server" Text="Criar Local" OnClick="btnCriarLocal_Click" CssClass="styled-button" />
        </div>
    </div>
    <asp:DataList ID="gridLocais" runat="server" DataKeyField="LocalID" DataSourceID="ObterLocaisUser" RepeatColumns="3" RepeatDirection="Horizontal">
        <ItemTemplate>
            PrimeiraFoto:
                <asp:Label ID="PrimeiraFotoLabel" runat="server" Text='<%# Eval("PrimeiraFoto") %>' />
            <br />
            NomeLocal:
            <asp:Label ID="NomeLocalLabel" runat="server" Text='<%# Eval("NomeLocal") %>' />
            <br />
            Editar Local:
            <asp:Button ID="btnEditarLocal" runat="server" Text="Editar Local" OnClick="btnEditarLocal_Click" CssClass="styled-button" />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:Panel ID="semLocais" runat="server" Visible="false">
        <p>Não foram encontrados locais.</p>
    </asp:Panel>
</asp:Content>
