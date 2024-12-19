<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AreaPessoal.aspx.cs" Inherits="projetoLocais.utilizador.AreaPessoal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Área Pessoal</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DataList runat="server" ID="listLocais" RepeatColumns="3" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <table class="table table-borderless">
                        <tr style="height: 220px; vertical-align: middle;">
                            <td style="width: 300px; text-align: center;">
                                <img src='../<%# Eval("Foto") %>' alt='<%# Eval("Nome") %>'
                                    style="width: 250px;" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label Text='<%# Eval("Nome") %>' runat="server" CssClass="fs-3" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="lnkDetalhes" runat="server"
                                    CommandArgument='<%# Eval("ID") %>'
                                    OnCommand="lnkDetalhes_Command"
                                    CssClass="btn mt-4" BackColor="#D7D3BF">
                                    Editar local 
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>

        </div>
    </form>
</body>
</html>
