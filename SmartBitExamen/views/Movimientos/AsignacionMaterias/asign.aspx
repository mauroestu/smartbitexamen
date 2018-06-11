<%@ Page Title="" Language="C#" MasterPageFile="~/views/base.master" AutoEventWireup="true" CodeFile="asign.aspx.cs" Inherits="views_Movimientos_AsignacionMaterias_asign" %>
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
                            <asp:Button ID="btnFinalizar" runat="server" CssClass="btn btn-primary" Text="Finalizar Asignación" OnClick="btnFinalizar_Click" />
                        </div>
                    </div>
                    
                </header>
                <div class="panel-body">
                    <br />
                    <div class="row">
                        <div class="col-lg-5">
                            <asp:Label ID="lblName" runat="server" Text="Profesor: "></asp:Label><asp:Label ID="Label18" runat="server" Text="*" ForeColor="Red"></asp:Label><br />
                            <asp:DropDownList ID="cmbProfesores" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="dataProfesores" DataTextField="complete_name" DataValueField="id" ></asp:DropDownList>
                            <asp:SqlDataSource ID="dataProfesores" runat="server" ConnectionString="<%$ ConnectionStrings:smarbitConnectionString %>" SelectCommand="SELECT [id], [complete_name] FROM [usuario] WHERE (([is_enabled] = @is_enabled) AND ([id_type] = @id_type))">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="true" Name="is_enabled" Type="Boolean" />
                                    <asp:Parameter DefaultValue="2" Name="id_type" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="col-lg-5">
                            <asp:Label ID="lblDescription" runat="server" Text="Curso: "></asp:Label><asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"></asp:Label><br />
                            <asp:DropDownList ID="cmbCursos" CssClass="form-control" runat="server" DataSourceID="dataCurso" DataTextField="name" DataValueField="id"></asp:DropDownList>
                            <asp:SqlDataSource ID="dataCurso" runat="server" ConnectionString="<%$ ConnectionStrings:smarbitConnectionString %>" SelectCommand="SELECT [id], [name] FROM [course] WHERE ([is_enabled] = @is_enabled)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="true" Name="is_enabled" Type="Boolean" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="col-lg-2">
                            <br />
                            <asp:Button ID="btnAsignar" runat="server" CssClass="btn btn-success" Text="Asignar Curso" OnClick="btnAsignar_Click" />
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-11">
                            <br />
                            <telerik:RadGrid ID="rdgCursos" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" Culture="es-ES" DataSourceID="dataCursoAsignado" OnDeleteCommand="rdgCursos_DeleteCommand" >
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="id_assign" DataSourceID="dataCursoAsignado">
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
                                        <telerik:GridBoundColumn DataField="id_assign" DataType="System.Int32" FilterControlAltText="Filter id_assign column" HeaderText="id_assign" ReadOnly="True" SortExpression="id_assign" UniqueName="id_assign" Display="False" ForceExtractValue="Always">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter name column" HeaderText="Nombre de Curso" SortExpression="name" UniqueName="name">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" ConfirmDialogType="RadWindow" ConfirmText="¿Desea eliminar la asignación?" ConfirmTitle="Eliminar Asignación" FilterControlAltText="Filter column column" HeaderText="Eliminar" UniqueName="column">
                                        </telerik:GridButtonColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                            <asp:SqlDataSource ID="dataCursoAsignado" runat="server" ConnectionString="<%$ ConnectionStrings:smarbitConnectionString %>" SelectCommand="SELECT tca.id_assign, c.name FROM teacher_course_assignement AS tca INNER JOIN course AS c ON tca.id_course = c.id WHERE (tca.id_teacher = @id_teacher)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cmbProfesores" DefaultValue="0" Name="id_teacher" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
             </section>
        </div>
            
    </div>
</asp:Content>

