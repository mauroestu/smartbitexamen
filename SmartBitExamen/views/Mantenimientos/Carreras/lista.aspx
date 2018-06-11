<%@ Page Title="" Language="C#" MasterPageFile="~/views/base.master" AutoEventWireup="true" CodeFile="lista.aspx.cs" Inherits="views_Mantenimientos_Carreras_lista" %>

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
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Nueva Carrera" OnClick="Button1_Click" />
                        </div>
                    </div>
                    
                </header>
                <div class="panel-body">
                    <br />
                    <telerik:RadGrid ID="rdgCarreras" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" Culture="es-ES" DataSourceID="dataCareers" OnUpdateCommand="rdgCarreras_UpdateCommand" OnDeleteCommand="rdgCarreras_DeleteCommand">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="dataCareers">
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
                                <telerik:GridEditCommandColumn ButtonType="ImageButton" CancelText="Cancelar" EditText="Editar" HeaderText="Editar" InsertText="Insertar" UpdateText="Actualizar">
                                </telerik:GridEditCommandColumn>
                                <telerik:GridBoundColumn DataField="id" DataType="System.Int32" Display="False" FilterControlAltText="Filter id column" HeaderText="id" ReadOnly="True" SortExpression="id" UniqueName="id" ForceExtractValue="Always">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter name column" HeaderText="Nombre de Carrera" SortExpression="name" UniqueName="name">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="description" FilterControlAltText="Filter description column" HeaderText="Descripción" SortExpression="description" UniqueName="description">
                                </telerik:GridBoundColumn>
                                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" ConfirmDialogType="RadWindow" ConfirmText="¿Desea eliminar la carrera seleccionada?" ConfirmTitle="Eliminar Carrera" FilterControlAltText="Filter column column" HeaderText="Eliminar" UniqueName="column">
                                </telerik:GridButtonColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>

                    <asp:SqlDataSource ID="dataCareers" runat="server" ConnectionString="Data Source=dbexamen.database.windows.net;Initial Catalog=smarbit;Persist Security Info=True;User ID=administrador;Password=A007651d3$" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [id], [name], [description] FROM [career] WHERE ([is_enabled] = @is_enabled)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="true" Name="is_enabled" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
             </section>
        </div>
            
    </div>
    
</asp:Content>

