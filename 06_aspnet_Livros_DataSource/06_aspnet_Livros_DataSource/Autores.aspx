<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Autores.aspx.cs" Inherits="_06_aspnet_Livros_DataSource.Autores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Autores</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="sqlAutores" runat="server" ConnectionString="Data Source=.\sqlexpress;Initial Catalog=Livros;Integrated Security=True;Encrypt=False;" DeleteCommand="DELETE FROM [Autor] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Autor] ([Nome], [Biografia]) VALUES (@Nome, @Biografia)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [ID], [Nome], [Biografia] FROM [Autor] ORDER BY [Nome]" UpdateCommand="UPDATE [Autor] SET [Nome] = @Nome, [Biografia] = @Biografia WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Nome" Type="String" />
                    <asp:Parameter Name="Biografia" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Nome" Type="String" />
                    <asp:Parameter Name="Biografia" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="sqlAutores" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
