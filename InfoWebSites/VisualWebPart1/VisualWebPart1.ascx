<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VisualWebPart1.ascx.cs" Inherits="InfoWebSites.VisualWebPart1.VisualWebPart1" %>

<asp:ScriptManager runat="server"></asp:ScriptManager>

<asp:UpdatePanel ID="updTitulos" runat="server">
<contentTemplate>
    <p>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </p>
    Este sitio tiene estos subsitios:
    <asp:ListBox runat="server" ID="lstSitios" AutoPostBack="True" OnSelectedIndexChanged="lstSitios_SelectedIndexChanged"/>
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
<asp:Label ID="lblCargado" Text="Aqui van las cosas" runat="server"></asp:Label>

</contentTemplate>

</asp:UpdatePanel>