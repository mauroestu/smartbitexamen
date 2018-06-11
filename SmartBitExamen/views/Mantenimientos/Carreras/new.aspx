<%@ Page Title="" Language="C#" MasterPageFile="~/views/base.master" AutoEventWireup="true" CodeFile="new.aspx.cs" Inherits="views_Mantenimientos_Carreras_new" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
                <telerik:RadWindowManager ID="Manejador" runat="server">
                </telerik:RadWindowManager>
    <div class="row">
        <div class="col-lg-12">
            <section class="panel">
                <header class="panel-heading">
                    <div class="row">
                        <div class="col-lg-12">
                            <h2>Nueva Carrera</h2>
                        </div>
                    </div>
                </header>
                <div class="panel-body">
                    <br />
                    <div class="row">
                        <div class="col-lg-1">
                            <asp:Button ID="btnSave" runat="server"  CssClass="btn btn-primary" Text="Guardar" OnClick="btnSave_Click" />
                        </div>
                        <div class="col-lg-3">
                            <asp:Button ID="btnAdd" runat="server"  CssClass="btn btn-success" Text="Guardar y continuar" OnClick="btnAdd_Click" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                             <br /><asp:Label ID="lblName" runat="server" Text="Nombre de Carrera"></asp:Label><asp:Label ID="Label18" runat="server" Text="*" ForeColor="Red"></asp:Label><br />
                            <asp:textbox runat="server" CssClass="form-control" ID="txtName"></asp:textbox>
                        </div>
                        <div class="col-lg-12">
                            <asp:Label ID="lblDescription" runat="server" Text="Descripción"></asp:Label><br />
                            <asp:textbox runat="server" CssClass="form-control" ID="txtDescription" Rows="5" TextMode="MultiLine"></asp:textbox>
                        </div>

                    </div>
                </div>
            </section>
        </div>    
    </div>
</asp:Content>

