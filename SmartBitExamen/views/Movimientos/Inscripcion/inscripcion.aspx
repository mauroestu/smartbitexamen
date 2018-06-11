<%@ Page Title="" Language="C#" MasterPageFile="~/views/base.master" AutoEventWireup="true" CodeFile="inscripcion.aspx.cs" Inherits="views_Movimientos_Inscripcion_inscripcion" %>
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
                            <h2>Inscripción de cursos.</h2>
                        </div>
                    </div>
                    
                </header>
                <div class="panel-body">
                    <br />
                    <div class="row">
                        <div class="col-lg-8">
                            <asp:Label ID="lblDescription" runat="server" Text="Cursos: "></asp:Label><asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"></asp:Label><br />
                            <asp:DropDownList ID="cmbCursos" CssClass="form-control" runat="server" DataSourceID="dataCursos" DataTextField="curso" DataValueField="id_assign"></asp:DropDownList>
                            
                            <asp:SqlDataSource ID="dataCursos" runat="server" ConnectionString="<%$ ConnectionStrings:smarbitConnectionString %>" SelectCommand="SELECT tca.id_assign, c.name + ' - ' + u.complete_name AS curso FROM teacher_course_assignement AS tca INNER JOIN course AS c ON tca.id_course = c.id INNER JOIN usuario AS u ON tca.id_teacher = u.id WHERE (c.id_career = @id_career)">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="0" Name="id_career" SessionField="IdCarrera" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            
                        </div>
                        <div class="col-lg-2">
                            <br />
                            <asp:Button ID="btnAsignar" runat="server" CssClass="btn btn-success" Text="Asignar Curso" OnClick="btnAsignar_Click"  />
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-11">
                            <br />
                            <telerik:RadGrid ID="rdgIns" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" Culture="es-ES" DataSourceID="dataInscripcion" OnDeleteCommand="rdgIns_DeleteCommand">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                                <MasterTableView AutoGenerateColumns="False" DataSourceID="dataInscripcion" DataKeyNames="id">
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
                                        <telerik:GridBoundColumn DataField="id" FilterControlAltText="Filter id column" HeaderText="id" SortExpression="id" UniqueName="id" DataType="System.Int32" Display="False" ForceExtractValue="Always" ReadOnly="True">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="curso" FilterControlAltText="Filter curso column" HeaderText="Nombre de Curso" SortExpression="curso" UniqueName="curso">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="note" FilterControlAltText="Filter note column" HeaderText="Nota" SortExpression="note" UniqueName="note" DataType="System.Int32">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="observation" FilterControlAltText="Filter observation column" HeaderText="Observaciones" SortExpression="observation" UniqueName="observation">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="state" FilterControlAltText="Filter state column" HeaderText="Estado" SortExpression="state" UniqueName="state">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" ConfirmDialogType="RadWindow" ConfirmText="¿Desea eliminar la asignación?" ConfirmTitle="Eliminar asignación" FilterControlAltText="Filter column column" HeaderText="Eliminar" UniqueName="column">
                                        </telerik:GridButtonColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                            
                            <asp:SqlDataSource ID="dataInscripcion" runat="server" ConnectionString="<%$ ConnectionStrings:smarbitConnectionString %>" SelectCommand="SELECT ic.id, c.name AS curso, ic.note, ic.observation, rs.name AS state FROM incription_course AS ic INNER JOIN teacher_course_assignement AS tca ON ic.id_course = tca.id_assign
INNER JOIN course AS c ON tca.id_course = c.id INNER JOIN result_state AS rs ON ic.id_state = rs.id WHERE (ic.id_student = @id_student)">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="0" Name="id_student" SessionField="IdUsuario" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            
                        </div>
                    </div>
                </div>
             </section>
        </div>
            
    </div>
</asp:Content>

