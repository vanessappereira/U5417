<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Controlos.aspx.cs" Inherits="_03_aspnet_WebUserControl.Controlos" %>

<%@ Register Src="Endereco.ascx" TagName="Endereco" TagPrefix="uc1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content\bootstrap.min.css" rel="stylesheet" />
    <title>Controlos</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>web user control - endereço</h2>
            <br />
            <uc1:Endereco ID="Endereco1" runat="server" />
            <br />
            <uc1:Endereco ID="Endereco2" runat="server" />
            <br />
            <br />
            <asp:CheckBox Text="Endereço de envio igual a endereço de facturação"
                runat="server" ID="CheckBoxIguais" AutoPostBack="true" />
        </div>
    </form>
</body>
</html>
