<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="projetoLocais.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <style>
        h2 {
            text-align: center;
            color: #333;
            padding-top:10px;
        }

        label {
            margin-bottom: 5px;
            display: block;
            color: #555;
        }

        .styled-input {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px 0;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 5px;
            background-color: #f8f8f8;
            font-size: 16px;
        }

        .styled-button {
            width: 100%;
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

    <h2>Login</h2>
    <asp:Login ID="loginUtilizador" runat="server">
        <LayoutTemplate>
            <label for="UserName">Nome de Utilizador</label>
            <asp:TextBox ID="UserName" runat="server" CssClass="styled-input" />

            <label for="Password">Palavra-passe</label>
            <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="styled-input" />

            <asp:CheckBox ID="RememberMe" runat="server" Text="Lembrar-se de mim na próxima vez" />

            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Iniciar Sessão" CssClass="styled-button" />
        </LayoutTemplate>
    </asp:Login>
</asp:Content>
