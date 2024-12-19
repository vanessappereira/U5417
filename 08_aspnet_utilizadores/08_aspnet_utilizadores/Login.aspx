<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Login ID="Login1" runat="server"
                CreateUserText="Criar conta"
                CreateUserUrl="~/Criar_Conta.aspx"
                DestinationPageUrl="~/Gestao/Dados.aspx" />
        </div>
    </form>
</body>
</html>
