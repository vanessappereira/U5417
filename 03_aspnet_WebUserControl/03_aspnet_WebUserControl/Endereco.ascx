<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Endereco.ascx.cs" Inherits="_03_aspnet_WebUserControl.Endereco" %>

<div class="form-group">
    <asp:Label ID="labelTitulo" runat="server" CssClass="control-label" />

    <div class="form-group">
        <asp:Label runat="server" Text="Nome:" />
        <asp:TextBox ID="textBoxNome" runat="server" CssClass="form-control" />

        <!-- Preenchimento Obrigatório -->
        <asp:RequiredFieldValidator runat="server" ControlToValidate="textBoxNome"
            ErrorMessage="Nome é obrigatório" Display="Dynamic" />
    </div>

    <div class="form-group">
        <asp:Label runat="server" Text="Morada:"></asp:Label>
        <asp:TextBox ID="textBoxMorada" runat="server" CssClass="form-control" />

        <!-- Preenchimento Obrigatório -->
        <asp:RequiredFieldValidator runat="server" ControlToValidate="textBoxMorada"
            ErrorMessage="Morada é obrigatória" Display="Dynamic" />
    </div>

    <div class="form-group">
        <asp:Label runat="server" Text="Código Postal:"></asp:Label>
        <asp:TextBox ID="textBoxCodigoPostal" runat="server" CssClass="form-control" />

        <!-- Preenchimento Obrigatório -->
        <asp:RequiredFieldValidator runat="server" ControlToValidate="textBoxCodigoPostal"
            ErrorMessage="Código Postal é obrigatório" Display="Dynamic" />

        <!-- Validar Formato 1111 - 111 -->
        <asp:RegularExpressionValidator runat="server" ControlToValidate="textBoxCodigoPostal"
            ErrorMessage="Formato inválido (1111-111)" ValidationExpression="\d{4}-\d{3}" Display="Dynamic" />
    </div>

    <div class="form-group">
        <asp:Label runat="server" Text="Localidade:"></asp:Label>
        <asp:TextBox ID="textBoxLocalidade" runat="server" CssClass="form-control" />

        <!-- Preenchimento Obrigatório -->
        <asp:RequiredFieldValidator runat="server" ControlToValidate="textBoxLocalidade"
            ErrorMessage="Localidade é obrigatória" Display="Dynamic" />
    </div>

    <div class="form-group">
        <asp:Label runat="server" Text="Telemóvel:" />
        <asp:TextBox ID="textBoxTelemovel" runat="server" CssClass="form-control" />
    </div>

    <div class="form-group">
        <asp:Label runat="server" Text="Email:" />
        <asp:TextBox ID="textBoxEmail" runat="server" CssClass="form-control" />

        <!-- Preenchimento Obrigatório -->
        <asp:RequiredFieldValidator runat="server" ControlToValidate="textBoxEmail"
            ErrorMessage="Email é obrigatório" Display="Dynamic" />

        <!-- Validar Formato -->
        <asp:RegularExpressionValidator runat="server" ControlToValidate="textBoxEmail"
            ErrorMessage="Email inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" />
    </div>
</div>
