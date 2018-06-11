<%@ Page Title="" Language="C#" MasterPageFile="~/views/base.master" AutoEventWireup="true" CodeFile="notas.aspx.cs" Inherits="views_Movimientos_IngresoNotas_notas" %>
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
                            <h1>Ingreso de Notas</h1>
                        </div>
                    </div>
                    
                </header>
                <div class="panel-body">
                    <br />
                    <div class="row">
                        <div class="col-md-6">
                            <asp:Label ID="lblName" runat="server" Text="Curso: "></asp:Label><asp:Label ID="Label18" runat="server" Text="*" ForeColor="Red"></asp:Label><br />
                            <asp:DropDownList ID="cmbCursos" CssClass="form-control" runat="server" DataSourceID="dataCursos" DataTextField="curso" DataValueField="id" AutoPostBack="True"></asp:DropDownList>
                            <asp:SqlDataSource ID="dataCursos" runat="server" ConnectionString="<%$ ConnectionStrings:smarbitConnectionString %>" SelectCommand="SELECT tca.id_assign AS id, c.name AS curso FROM teacher_course_assignement AS tca INNER JOIN course AS c ON tca.id_course = c.id WHERE (tca.id_teacher = @id_teacher)">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="0" Name="id_teacher" SessionField="IdUsuario" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <br />
                            <telerik:RadGrid ID="rdgNotas" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" Culture="es-ES" DataSourceID="dataInscritos" OnUpdateCommand="rdgNotas_UpdateCommand">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="dataInscritos">
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
                                        <telerik:GridEditCommandColumn ButtonType="ImageButton" HeaderText="Ingresar Nota">
                                        </telerik:GridEditCommandColumn>
                                        <telerik:GridBoundColumn DataField="id" DataType="System.Int32" FilterControlAltText="Filter id column" HeaderText="id" ReadOnly="True" SortExpression="id" UniqueName="id" Display="False" ForceExtractValue="Always">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="estudiante" FilterControlAltText="Filter estudiante column" HeaderText="Estudiante" SortExpression="estudiante" UniqueName="estudiante" ReadOnly="True">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="nota" DataType="System.Int32" FilterControlAltText="Filter nota column" HeaderText="Nota" SortExpression="nota" UniqueName="nota">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="observacion" FilterControlAltText="Filter observacion column" HeaderText="Observaciones" SortExpression="observacion" UniqueName="observacion">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="estado" FilterControlAltText="Filter estado column" HeaderText="Estado" SortExpression="estado" UniqueName="estado" ReadOnly="True">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridDropDownColumn DataField="estado" DataSourceID="dataEstado" Display="False" FilterControlAltText="Filter state column" HeaderText="Estado" ListTextField="state" ListValueField="idState" SortExpression="state" UniqueName="state" ForceExtractValue="Always">
                                        </telerik:GridDropDownColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                            <asp:SqlDataSource ID="dataInscritos" runat="server" ConnectionString="<%$ ConnectionStrings:smarbitConnectionString %>" SelectCommand="SELECT ic.id ,u.complete_name AS estudiante, ic.note AS nota, ic.observation AS observacion, rs.name AS estado FROM incription_course AS ic INNER JOIN usuario AS u ON ic.id_student = u.id INNER JOIN result_state AS rs ON ic.id_state = rs.id WHERE (ic.id_course = @id_course)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cmbCursos" DefaultValue="0" Name="id_course" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                            <asp:SqlDataSource ID="dataEstado" runat="server" ConnectionString="<%$ ConnectionStrings:smarbitConnectionString %>" SelectCommand="select id as idState, name as state from result_state;">
                               
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
             </section>
        </div>
            
    </div>
</asp:Content>

