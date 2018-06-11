<%@ Page Title="" Language="C#" MasterPageFile="~/views/base.master" AutoEventWireup="true" CodeFile="new.aspx.cs" Inherits="views_Mantenimientos_Usuarios_new" %>
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
                            <h2>Nuevo Usuario</h2>
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
                             <br /><asp:Label ID="lblName" runat="server" Text="Nombre Completo: "></asp:Label><asp:Label ID="Label18" runat="server" Text="*" ForeColor="Red"></asp:Label><br />
                            <asp:textbox runat="server" CssClass="form-control" ID="txtName"></asp:textbox>
                        </div>
                        <div class="col-lg-12">
                            <asp:Label ID="lblEmail" runat="server" Text="Email: "></asp:Label><asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"></asp:Label><br />
                            <asp:textbox runat="server" CssClass="form-control" ID="txtEmail" TextMode="Email"></asp:textbox>
                        </div>
                        <div class="col-lg-12">
                            <asp:Label ID="lblPassword" runat="server" Text="Contraseña: "></asp:Label><asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label><br />
                            <asp:textbox runat="server" CssClass="form-control" ID="txtPassword" TextMode="Password"></asp:textbox>
                        </div>
                        <div class="col-lg-12">
                            <asp:Label ID="lblDpi" runat="server" Text="Dpi: "></asp:Label><asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red"></asp:Label><br />
                            <asp:textbox runat="server" CssClass="form-control" ID="txtDpi"></asp:textbox>
                        </div>
                        <div class="col-lg-12">
                            <asp:Label ID="lblDireccion" runat="server" Text="Dirección: "></asp:Label><asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red"></asp:Label><br />
                            <asp:textbox runat="server" CssClass="form-control" ID="txtDireccion"></asp:textbox>
                        </div>
                        <div class="col-lg-12">
                            <asp:Label ID="lblDescription" runat="server" Text="Rol: "></asp:Label><asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red"></asp:Label><br />
                            <asp:DropDownList ID="cmbRol" CssClass="form-control" runat="server" DataSourceID="dataRoles" DataTextField="name" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="cmbRol_SelectedIndexChanged" ></asp:DropDownList>
                            
                            <asp:SqlDataSource ID="dataRoles" runat="server" ConnectionString="<%$ ConnectionStrings:smarbitConnectionString %>" SelectCommand="SELECT [id], [name] FROM [user_type]"></asp:SqlDataSource>
                            
                        </div>
                        <div class="col-lg-12">
                            <asp:Label ID="Label9" runat="server" Text="Carrera: "></asp:Label><asp:Label ID="Label10" runat="server" Text="*" ForeColor="Red"></asp:Label><br />
                            <asp:DropDownList ID="cmbCarrera" CssClass="form-control" runat="server" DataSourceID="dataCarreras" DataTextField="name" DataValueField="id" ></asp:DropDownList>
                            
                            <asp:SqlDataSource ID="dataCarreras" runat="server" ConnectionString="<%$ ConnectionStrings:smarbitConnectionString %>" SelectCommand="SELECT [id], [name] FROM [career] WHERE ([is_enabled] = @is_enabled)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="true" Name="is_enabled" Type="Boolean" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            
                        </div>
                        <div class="col-lg-4">
                            <asp:Label ID="lblFecha" runat="server" Text="Fecha de Nacimiento: "></asp:Label><asp:Label ID="Label6" runat="server" Text="*" ForeColor="Red"></asp:Label><br />
                            <telerik:RadDatePicker ID="rdpFechaNac"  CssClass="form-control" runat="server" Width="100%"></telerik:RadDatePicker>
                        </div>
                        <div class="col-lg-4">
                            <asp:Label ID="Label2" runat="server" Text="Teléfono: "></asp:Label><br />
                            <asp:TextBox ID="txtTelefono" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                        
                        <div class="col-lg-4">
                            <asp:Label ID="Label8" runat="server" Text="Celular: "></asp:Label><br />
                            <asp:TextBox ID="txtCelular" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </section>
        </div>    
    </div>
</asp:Content>

