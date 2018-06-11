<%@ Page Title="" Language="C#" MasterPageFile="~/views/base.master" AutoEventWireup="true" CodeFile="ReporteNotas.aspx.cs" Inherits="views_Consultas_ReporteNotas" %>
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
                            <h1>Consulta de notas de cursos.</h1>
                        </div>
                        <div class="col-lg-12">
                            <asp:Button ID="btnGenerar" runat="server" CssClass="btn btn-success" Text="Generar Constancia de Cursos" OnClick="btnGenerar_Click" />
                        </div>
                    </div>
                    
                </header>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <br />
                            <telerik:RadGrid ID="rdgNotas" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" Culture="es-ES" DataSourceID="dataNotas">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="dataNotas">
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
                                        <telerik:GridBoundColumn DataField="curso" FilterControlAltText="Filter curso column" HeaderText="Nombre de Curso" SortExpression="curso" UniqueName="curso">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="nota" DataType="System.Int32" FilterControlAltText="Filter nota column" HeaderText="Nota Final" SortExpression="nota" UniqueName="nota">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="observacion" FilterControlAltText="Filter observacion column" HeaderText="Observaciones" SortExpression="observacion" UniqueName="observacion">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="estado" FilterControlAltText="Filter estado column" HeaderText="Estado De la Nota" SortExpression="estado" UniqueName="estado">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="descripcion" FilterControlAltText="Filter descripcion column" HeaderText="Descripción de Estado" SortExpression="descripcion" UniqueName="descripcion">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                            <asp:SqlDataSource ID="dataNotas" runat="server" ConnectionString="<%$ ConnectionStrings:smarbitConnectionString %>" SelectCommand="SELECT c.name AS curso, ic.note AS nota, ic.observation AS observacion, rs.name AS estado, rs.description AS descripcion FROM incription_course AS ic INNER JOIN teacher_course_assignement AS tca ON ic.id_course = tca.id_assign INNER JOIN course AS c ON tca.id_course = c.id INNER JOIN result_state AS rs ON ic.id_state = rs.id WHERE (ic.id_student = @id_student)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_student" SessionField="IdUsuario" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
             </section>
        </div>
            
    </div>
</asp:Content>

