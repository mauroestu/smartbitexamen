<%@ Page Title="" Language="C#" MasterPageFile="~/views/base.master" AutoEventWireup="true" CodeFile="lista.aspx.cs" Inherits="views_Mantenimientos_Usuarios_lista" %>
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
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Nuevo Usuario" OnClick="Button1_Click" />
                        </div>
                    </div>
                    
                </header>
                <div class="panel-body">
                    <br />
                    <telerik:RadGrid ID="rdgUsuarios" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" Culture="es-ES" DataSourceID="dataUsuarios" OnDeleteCommand="rdgUsuarios_DeleteCommand" OnUpdateCommand="RadGrid1_UpdateCommand">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <MasterTableView AutoGenerateColumns="False" DataSourceID="dataUsuarios" DataKeyNames="id">
                            <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

                                    <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings>

                                    <PagerStyle AlwaysVisible="true" PagerTextFormat="{4}<strong>{5}</strong> registro(s) en <strong>{1}</strong> página(s) " PageSizeLabelText="Cantidad de registros por página:" />
                                    <NoRecordsTemplate>NO HAY INFORMACIÓN PARA MOSTRAR.</NoRecordsTemplate>
                                    <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                            <Columns>
                                <telerik:GridEditCommandColumn ButtonType="ImageButton" HeaderText="Editar">
                                </telerik:GridEditCommandColumn>
                                <telerik:GridBoundColumn DataField="id" FilterControlAltText="Filter id column" HeaderText="id" SortExpression="id" UniqueName="id" DataType="System.Int32" Display="False" ForceExtractValue="Always" ReadOnly="True">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="complete_name" FilterControlAltText="Filter complete_name column" HeaderText="Nombre Completo" SortExpression="complete_name" UniqueName="complete_name">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="dpi" FilterControlAltText="Filter dpi column" HeaderText="DPI" SortExpression="dpi" UniqueName="dpi" DataType="System.Int64">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="email" FilterControlAltText="Filter email column" HeaderText="Email" SortExpression="email" UniqueName="email">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="address" FilterControlAltText="Filter address column" HeaderText="Dirección" SortExpression="address" UniqueName="address">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="phone" DataType="System.Int64" FilterControlAltText="Filter phone column" HeaderText="Teléfono" SortExpression="phone" UniqueName="phone">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="cell_phone" DataType="System.Int64" FilterControlAltText="Filter cell_phone column" HeaderText="Celular" SortExpression="cell_phone" UniqueName="cell_phone">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="birth_date" FilterControlAltText="Filter birth_date column" HeaderText="Fecha Nac." SortExpression="birth_date" UniqueName="birth_date" DataType="System.DateTime" ReadOnly="True">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="type" FilterControlAltText="Filter type column" HeaderText="Tipo Usuario" SortExpression="type" UniqueName="type" ReadOnly="True">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="career" FilterControlAltText="Filter career column" HeaderText="Carrera" ReadOnly="True" SortExpression="career" UniqueName="career">
                                </telerik:GridBoundColumn>
                                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" ConfirmDialogType="RadWindow" ConfirmText="¿Desea deshabilitar el registro seleccionado?" ConfirmTitle="Deshablitar usuario" FilterControlAltText="Filter column column" HeaderText="Deshabilitar" UniqueName="column">
                                </telerik:GridButtonColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <asp:SqlDataSource ID="dataUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:smarbitConnectionString %>" SelectCommand="SELECT u.id, u.complete_name, u.dpi, u.email, u.address, u.phone, u.cell_phone, u.birth_date, ut.name AS type, c.name AS career FROM usuario AS u INNER JOIN user_type AS ut ON u.id_type = ut.id LEFT OUTER JOIN career AS c ON u.id_career = c.id WHERE (u.is_enabled = 1)"></asp:SqlDataSource>
                 </div>
            </section>
                </div>
            
        </div>
</asp:Content>

