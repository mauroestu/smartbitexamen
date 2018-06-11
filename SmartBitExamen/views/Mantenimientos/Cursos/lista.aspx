<%@ Page Title="" Language="C#" MasterPageFile="~/views/base.master" AutoEventWireup="true" CodeFile="lista.aspx.cs" Inherits="views_Mantenimientos_Cursos_lista" %>
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
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Nuevo Curso" OnClick="Button1_Click" />
                        </div>
                    </div>
                    
                </header>
                <div class="panel-body">
                    <br />
                    <telerik:RadGrid ID="rdgCursos" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" Culture="es-ES" DataSourceID="dataCursos" OnUpdateCommand="rdgCursos_UpdateCommand" OnDeleteCommand="rdgCursos_DeleteCommand">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="idCurso" DataSourceID="dataCursos">
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
                                <telerik:GridBoundColumn DataField="idCurso" DataType="System.Int32" FilterControlAltText="Filter idCurso column" HeaderText="idCurso" ReadOnly="True" SortExpression="idCurso" UniqueName="idCurso" Display="False" ForceExtractValue="Always">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="nombre" FilterControlAltText="Filter nombre column" HeaderText="Nombre de Curso" SortExpression="nombre" UniqueName="nombre">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter name column" HeaderText="Carrera" SortExpression="name" UniqueName="name" ReadOnly="True">
                                </telerik:GridBoundColumn>
                               
                                <telerik:GridDropDownColumn DataField="name" DataSourceID="dataCarreras" FilterControlAltText="Filter career column" HeaderText="Carrera" ListTextField="name" ListValueField="id" SortExpression="name" UniqueName="career" Display="False" ForceExtractValue="Always">
                                </telerik:GridDropDownColumn>

                                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" ConfirmDialogType="RadWindow" ConfirmText="¿Desea eliminar el registro?" ConfirmTitle="Eliminar Curso" FilterControlAltText="Filter column column" HeaderText="Eliminar" UniqueName="column">
                                </telerik:GridButtonColumn>

                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <asp:SqlDataSource ID="dataCursos" runat="server" ConnectionString="<%$ ConnectionStrings:smarbitConnectionString2 %>" SelectCommand="SELECT c.id AS idCurso, c.name AS nombre, cr.name FROM course AS c INNER JOIN career AS cr ON c.id_career = cr.id WHERE (c.is_enabled = 1)">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dataCarreras" runat="server" ConnectionString="<%$ ConnectionStrings:smarbitConnectionString %>" SelectCommand="SELECT [id], [name] FROM [career] WHERE ([is_enabled] = @is_enabled)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="true" Name="is_enabled" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                 </div>
            </section>
                </div>
            
        </div>

</asp:Content>

