<%@ Page Title="" Language="C#" MasterPageFile="~/views/base.master" AutoEventWireup="true" CodeFile="new.aspx.cs" Inherits="views_Mantenimientos_Cursos_new" %>
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
                            <h2>Nuevo Curso</h2>
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
                             <br /><asp:Label ID="lblName" runat="server" Text="Nombre de Curso"></asp:Label><asp:Label ID="Label18" runat="server" Text="*" ForeColor="Red"></asp:Label><br />
                            <asp:textbox runat="server" CssClass="form-control" ID="txtName"></asp:textbox>
                        </div>
                        <div class="col-lg-12">
                            <asp:Label ID="lblDescription" runat="server" Text="Carrera"></asp:Label><asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"></asp:Label><br />
                            <asp:DropDownList ID="cmbCarrera" CssClass="form-control" runat="server" DataSourceID="dataCarreras" DataTextField="name" DataValueField="id"></asp:DropDownList>
                            <asp:SqlDataSource ID="dataCarreras" runat="server" ConnectionString="<%$ ConnectionStrings:smarbitConnectionString %>" SelectCommand="SELECT [id], [name] FROM [career] WHERE ([is_enabled] = @is_enabled)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="true" Name="is_enabled" Type="Boolean" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                    </div>
                </div>
            </section>
        </div>    
    </div>
</asp:Content>

