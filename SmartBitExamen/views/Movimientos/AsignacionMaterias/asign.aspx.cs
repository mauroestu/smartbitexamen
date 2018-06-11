using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;
using System.Collections;
using System.Text.RegularExpressions;

public partial class views_Movimientos_AsignacionMaterias_asign : PaginaBase
{

    #region metodos

    private void InicializarControles()
    {
        this.cmbProfesores.DataBind();
        this.cmbCursos.DataBind();
        this.rdgCursos.Rebind();
        this.cmbProfesores.Enabled = true;
    }

    private void AsignarCurso()
    {
        this.cmbProfesores.Enabled = false;
        string strResultado = string.Empty;
        teacher_course_assignement objAsign = new teacher_course_assignement();

        objAsign.id_course = Convert.ToInt32(this.cmbCursos.SelectedValue);
        objAsign.id_teacher = Convert.ToInt32(this.cmbProfesores.SelectedValue);

        clsAsign asignacion = new clsAsign();
        asignacion.prAsignacion = objAsign;

        strResultado = asignacion.AsignarCursoProfesor();

        if (string.IsNullOrEmpty(strResultado))
        {
            base.EnvioMensaje("Asignación realizada con éxito.", 1, this.Manejador);
            this.rdgCursos.Rebind();
        }
        else
        {
            base.EnvioMensaje(strResultado, 1, this.Manejador);
        }
    }

    #endregion

    #region eventos

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) InicializarControles();
        base.getIdUsuario();
    }
    
    protected void btnAsignar_Click(object sender, EventArgs e)
    {
        AsignarCurso();
    }

    protected void btnFinalizar_Click(object sender, EventArgs e)
    {
        InicializarControles();
    }

    protected void rdgCursos_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {
            string strResultado = string.Empty;
            GridEditableItem ObjItem = (GridEditableItem)e.Item;
            Hashtable ObjHashtable = new Hashtable();
            teacher_course_assignement objAsign = new teacher_course_assignement();

            ObjItem.ExtractValues(ObjHashtable);

            objAsign.id_assign = Convert.ToInt32(ObjHashtable["id_assign"]);

            clsAsign asignacion = new clsAsign();
            asignacion.prAsignacion = objAsign;

            strResultado = asignacion.EliminarAsignacion();

            if (string.IsNullOrEmpty(strResultado))
            {
                this.rdgCursos.Rebind();
                base.EnvioMensaje("Registro eliminado correctamente.", 2, Manejador);
            }
            else
            {
                this.rdgCursos.Rebind();
                base.EnvioMensaje(strResultado, 1, Manejador);
            }
        }
        catch (Exception ex)
        {
            base.EnvioMensaje("Error al eliminar datos.", 1, this.Manejador);
        }
    }

    #endregion

}