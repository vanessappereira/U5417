<%@ Page Title="Página Inicial" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="paginainicial.aspx.cs"
    Inherits="projetoLocais.paginainicial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <title>Página Inicial</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <h2>Página inicial</h2>
    <asp:DataList ID="DataList1" runat="server"></asp:DataList>
</asp:Content>
