<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="livros_por_area.aspx.cs" Inherits="_06_aspnet_Livros_DataSource.livros_por_area" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Livros por Área</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>
                Área 
                <asp:DropDownList ID="listArea" runat="server" Height="16px" Width="240px" DataSourceID="sqlAreas" DataTextField="Nome" DataValueField="ID"></asp:DropDownList>
                <asp:SqlDataSource ID="sqlAreas" runat="server" ConnectionString="Data Source=.\sqlexpress;Initial Catalog=Livros;Integrated Security=True;Encrypt=False;Trust Server Certificate=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [ID], [Nome] FROM [Area] ORDER BY [Nome]"></asp:SqlDataSource>
            </p>

            <asp:GridView ID="GridArea" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
