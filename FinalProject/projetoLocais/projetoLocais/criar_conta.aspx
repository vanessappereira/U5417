<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="criar_conta.aspx.cs" Inherits="projetoLocais.criar_conta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <h2>Criar Conta</h2>
    <div>
        <label for="textNome">Nome</label>
        <asp:TextBox ID="textNome" runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="textNome" ErrorMessage="Nome é obrigatório" />
    </div>
    <div>
        <label for="textEmail">Email</label>
        <asp:TextBox ID="textEmail" runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="textEmail" ErrorMessage="Email é obrigatório" />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="textEmail" ErrorMessage="Email inválido" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" />
    </div>
    <div>
        <label for="textData">Data de Nascimento</label>
        <asp:TextBox ID="textData" runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="textData" ErrorMessage="Data de nascimento é obrigatória" />
        <asp:CompareValidator ID="validarDataNascimento" runat="server" ControlToValidate="textData" ErrorMessage="Defina data igual ou anterior a {DateTime.Now.AddYears(-18).ToShortDateString()}" Operator="LessThan" Type="Date" />
    </div>
    <div>
        <label for="textUsername">Nome de Utilizador</label>
        <asp:TextBox ID="textUsername" runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="textUsername" ErrorMessage="Nome de utilizador é obrigatório" />
    </div>
    <div>
        <label for="textPassword">Palavra-passe</label>
        <asp:TextBox ID="textPassword" runat="server" TextMode="Password" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="textPassword" ErrorMessage="Palavra-passe é obrigatória" />
    </div>
    <div>
        <asp:Button ID="buttonCriarConta" runat="server" Text="Criar Conta" OnClick="buttonCriarConta_Click" />
    </div>
</asp:Content>
