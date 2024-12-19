<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="validar.aspx.cs" Inherits="_02_aspnet_validacao.validar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Controlos de Validação</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript">
        function Validar(source, args) {
            if ((args.Value.length >= 5) && (args.Value.length <= 20)) { args.IsValid = true; }
            else { args.IsValid = false; }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" style="text-align: center">
            <header>
                <h1>ASP.NET - Server Side Validation</h1>
                <p>Controlos de Validação</p>
            </header>
            <main>
                <table class="table table-bordered table-dark table-striped" style="width: 80%; margin-left: auto; margin-right: auto;">
                    <thead>
                        <tr>
                            <th style="width: 40%;">Campo</th>
                            <th colspan="2">Validação</th>
                        </tr>
                    </thead>
                    <tbody style="width: fit-content">
                        <tr>
                            <th style="width: 40%;">Número inteiro > 0</th>
                            <td style="width: 40%;">
                                <asp:TextBox ID="textValor1" runat="server" aria-label="Número inteiro maior que zero" class="form-control me-2"
                                    Style="display: inline;" Width="200px" />
                            </td>
                            <td style="width: 20%;">
                                <!-- Controlo Obrigatório -->
                                <asp:RequiredFieldValidator ErrorMessage="Obrigatório"
                                    ControlToValidate="textValor1" runat="server" Display="Dynamic"
                                    ForeColor="#CC0000" />

                                <!-- 7. Para a validação do controlo textValor1 (Número inteiro > 0) -->
                                <asp:CompareValidator ControlToValidate="textValor1"
                                    ErrorMessage="Valor inteiro maior que zero." runat="server" Display="Dynamic"
                                    ForeColor="#CC0000" Type="Integer" Operator="GreaterThan" ValueToCompare="0" />
                            </td>
                        </tr>
                        <tr>
                            <th>Número real inferior a 25.5</th>
                            <td>
                                <asp:TextBox ID="textValor2" runat="server" aria-label="Número real inferior a 25.5"
                                    class="form-control me-2" Style="display: inline;" Width="200px" />
                            </td>
                            <td>
                                <!-- Controlo Obrigatório -->
                                <asp:RequiredFieldValidator ErrorMessage="Obrigatório" ControlToValidate="textValor2"
                                    runat="server" Display="Dynamic" ForeColor="#CC0000" />

                                <asp:RangeValidator
                                    ControlToValidate="textValor2" ErrorMessage="Valor deve ser inferior a 25,5."
                                    runat="server" Display="Dynamic" ForeColor="#CC0000" Type="Double"
                                    MinimumValue="0" MaximumValue="25,5" />
                            </td>
                        </tr>
                        <tr>
                            <th>Data anterior a 31/12/2021</th>
                            <td>
                                <asp:TextBox ID="textValor3" runat="server" aria-label="Data anterior a 31/12/2021" class="form-control me-2"
                                    Style="display: inline;" Width="200px" />
                            </td>
                            <td>
                                <!-- Controlo Obrigatório -->
                                <asp:RequiredFieldValidator ErrorMessage="Obrigatório"
                                    ControlToValidate="textValor3" runat="server" Display="Dynamic"
                                    ForeColor="#CC0000" />
                            </td>
                        </tr>
                        <tr>
                            <th>Número inteiro entre 50 e 100</th>
                            <td>
                                <asp:TextBox ID="textValor4" runat="server" aria-label="Número inteiro entre 50 e 100" class="form-control me-2"
                                    Style="display: inline;" Width="200px" />
                            </td>
                            <td>
                                <!-- Controlo Obrigatório -->
                                <asp:RequiredFieldValidator ErrorMessage="Obrigatório"
                                    ControlToValidate="textValor4" runat="server" Display="Dynamic"
                                    ForeColor="#CC0000" />

                                <!-- 8. Para a validação do controlo textValor4 (Número inteiro entre 50 e 100) adicione ao formulário um controlo do tipo RangeValidator -->
                                <asp:RangeValidator ControlToValidate="textValor4" runat="server" Display="Dynamic" ForeColor="#CC0000" Type="Double"
                                    MinimumValue="50" MaximumValue="100" ErrorMessage="Número inteiro entre 50 e 100." />
                            </td>
                        </tr>
                        <tr>
                            <th>Data entre 1/1/2021 e 31/12/2021 </th>
                            <td>
                                <asp:TextBox ID="textValor5" runat="server" aria-label="Data entre 1/1/2021 e 31/12/2021" class="form-control me-2"
                                    Style="display: inline;" Width="200px" />
                            </td>
                            <td>
                                <!-- Controlo Obrigatório -->
                                <asp:RequiredFieldValidator ErrorMessage="Obrigatório"
                                    ControlToValidate="textValor5" runat="server" Display="Dynamic"
                                    ForeColor="#CC0000" />
                            </td>
                        </tr>
                        <tr>
                            <th>Número inteiro</th>
                            <td>
                                <asp:TextBox ID="textValor6" runat="server" aria-label="Número inteiro" class="form-control me-2"
                                    Style="display: inline;" Width="200px" />
                            </td>
                            <td>
                                <!-- Controlo Obrigatório -->
                                <asp:RequiredFieldValidator ErrorMessage="Obrigatório"
                                    ControlToValidate="textValor6" runat="server" Display="Dynamic"
                                    ForeColor="#CC0000" />

                                <!-- 9. Para a validação do controlo textValor6 (Número inteiro) adicione ao formulário um controlo do tipo CompareValidator -->
                                <asp:CompareValidator runat="server" ControlToValidate="textValor6"
                                    ErrorMessage="Defina um número inteiro." Display="Dynamic" ForeColor="#CC0000"
                                    Type="Integer" Operator="DataTypeCheck" />
                            </td>
                        </tr>
                        <tr>
                            <th>Número real </th>
                            <td>
                                <asp:TextBox ID="textValor7" runat="server" aria-label="Número real" class="form-control me-2"
                                    Style="display: inline;" Width="200px" />
                            </td>
                            <td>
                                <!-- Controlo Obrigatório -->
                                <asp:RequiredFieldValidator ErrorMessage="Obrigatório"
                                    ControlToValidate="textValor7" runat="server" Display="Dynamic"
                                    ForeColor="#CC0000" />
                            </td>
                        </tr>
                        <tr>
                            <th>Data </th>
                            <td>
                                <asp:TextBox ID="textValor8" runat="server" aria-label="Data" class="form-control me-2"
                                    Style="display: inline;" Width="200px" />
                            </td>
                            <td>
                                <!-- Controlo Obrigatório -->
                                <asp:RequiredFieldValidator ErrorMessage="Obrigatório"
                                    ControlToValidate="textValor8" runat="server" Display="Dynamic"
                                    ForeColor="#CC0000" />
                            </td>
                        </tr>
                        <tr>
                            <th>Código postal </th>
                            <td>
                                <asp:TextBox ID="textValor9" runat="server" aria-label="Código Postal" class="form-control me-2"
                                    Style="display: inline;" Width="200px" />
                            </td>
                            <td>
                                <!-- Controlo Obrigatório -->
                                <asp:RequiredFieldValidator ErrorMessage="Obrigatório"
                                    ControlToValidate="textValor9" runat="server" Display="Dynamic"
                                    ForeColor="#CC0000" />
                            </td>
                        </tr>
                        <tr>
                            <th>Telefone </th>
                            <td>
                                <asp:TextBox ID="textValor10" runat="server" aria-label="Telefone" class="form-control me-2"
                                    Style="display: inline;" Width="200px" />
                            </td>
                            <td>
                                <!-- Controlo Obrigatório -->
                                <asp:RequiredFieldValidator ErrorMessage="Obrigatório"
                                    ControlToValidate="textValor10" runat="server" Display="Dynamic"
                                    ForeColor="#CC0000" />

                                <!-- 10. Para a validação do controlo textValor10 (Telefone) adicione ao formulário um controlo do tipo RegularExpressionValidator -->
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="textValor10"
                                    ErrorMessage="Número inválido." Display="Dynamic" ForeColor="#CC0000"
                                    ValidationExpression="[2][0-9]{8}" />
                            </td>
                        </tr>
                        <tr>
                            <th>Email </th>
                            <td>
                                <asp:TextBox ID="textValor11" runat="server" aria-label="Email" class="form-control me-2"
                                    Style="display: inline;" Width="200px" />
                            </td>
                            <td>
                                <!-- Controlo Obrigatório -->
                                <asp:RequiredFieldValidator ErrorMessage="Obrigatório"
                                    ControlToValidate="textValor11" runat="server" Display="Dynamic"
                                    ForeColor="#CC0000" />
                            </td>
                        </tr>
                        <tr>
                            <th>Nome (entre 5 e 20 caracteres)</th>
                            <td>
                                <asp:TextBox ID="textValor12" runat="server" aria-label="Nome (entre 5 e 20 carateres)" class="form-control me-2"
                                    Style="display: inline;" Width="200px" />
                            </td>
                            <td>
                                <!-- Controlo Obrigatório -->
                                <asp:RequiredFieldValidator ErrorMessage="Obrigatório"
                                    ControlToValidate="textValor12" runat="server" Display="Dynamic"
                                    ForeColor="#CC0000" />

                                <!-- 11. Para a validação do controlo textValor12 (Nome entre 5 e 20 caracteres), comece por definir a seguinte função JavaScript
                                         Adicione ao formulário um controlo do tipo CustomValidator -->
                                <asp:CustomValidator runat="server" ControlToValidate="textValor12"
                                    ErrorMessage="O nome deve ter entre 5 e 20 caracteres." Display="Dynamic"
                                    ForeColor="#CC0000" ClientValidationFunction="Validar" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </main>
            <div class="container" style="top: 50%">
                <asp:Button ID="buttonValidar" runat="server" Text="Validar" CssClass="btn btn-primary" />
            </div>
        </div>
    </form>
</body>
</html>
