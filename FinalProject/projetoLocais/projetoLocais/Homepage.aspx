<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="projetoLocais.Homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Homepage</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Test</h1>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="Locais" Width="200px">
                <ItemTemplate>
                    Nome:
                    <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' />
                    <br />
                    Descricao:
                    <asp:Label ID="DescricaoLabel" runat="server" Text='<%# Eval("Descricao") %>' />
                    <br />
                    Localidade:
                    <asp:Label ID="LocalidadeLabel" runat="server" Text='<%# Eval("Localidade") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="Locais" runat="server" ConnectionString="Data Source=.\sqlexpress;Initial Catalog=Locais;Integrated Security=True;Encrypt=False" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Nome], [Descricao], [Localidade] FROM [Local]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
