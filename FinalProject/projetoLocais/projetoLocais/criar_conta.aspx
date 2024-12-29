<%@ Page Title="Criar Conta" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="criar_conta.aspx.cs" Inherits="projetoLocais.criar_conta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
        <title>Criar Conta</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <style>
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
                background-color: #45a049;
            }
    </style>
    <h2>Criar Conta</h2>
    <asp:Table runat="server">
        <asp:TableRow>
            <asp:TableCell><label for="textNome">Nome</label></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="textNome" runat="server" CssClass="styled-input large-input" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="textNome" ErrorMessage="Nome é obrigatório" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell><label for="textEmail">Email</label></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="textEmail" runat="server" CssClass="styled-input large-input" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="textEmail" ErrorMessage="Email é obrigatório" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="textEmail" ErrorMessage="Email inválido" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell><label for="textData">Data de Nascimento</label></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="textData" runat="server" Text='<%# DateTime.Now.ToString("dd/MM/yyyy") %>' TextMode="Date" CssClass="styled-input" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="textData" ErrorMessage="Data de nascimento é obrigatória" />
                <asp:CompareValidator ID="validarDataNascimento" runat="server" ControlToValidate="textData" ErrorMessage="Defina data igual ou anterior a {DateTime.Now.AddYears(-18).ToShortDateString()}" Operator="LessThan" Type="Date" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorData" runat="server" ControlToValidate="textData" ErrorMessage="Formato de data inválido" ValidationExpression="\d{4}-\d{2}-\d{2}" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell><label for="textUsername">Nome de Utilizador</label></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="textUsername" runat="server" CssClass="styled-input" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="textUsername" ErrorMessage="Nome de utilizador é obrigatório" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell><label for="textPassword">Palavra-passe</label></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="textPassword" runat="server" TextMode="Password" CssClass="styled-input" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="textPassword" ErrorMessage="Palavra-passe é obrigatória" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell><label for="textConfirmPassword">Confirmar Palavra-passe</label></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="textConfirmPassword" runat="server" TextMode="Password" CssClass="styled-input" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="textConfirmPassword" ErrorMessage="Confirmar palavra-passe é obrigatório" />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="textConfirmPassword" ControlToCompare="textPassword" ErrorMessage="As palavras-passe não coincidem" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="buttonCriarConta" runat="server" Text="Criar Conta" OnClick="buttonCriarConta_Click" CssClass="styled-button" />
            </asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
