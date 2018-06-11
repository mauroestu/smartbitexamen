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

public partial class views_Movimientos_Inscripcion_inscripcion : PaginaBase
{

    #region metodos

    private void InicializarControles()
    {

        this.cmbCursos.DataBind();
        this.rdgIns.Rebind();
    }

    private void InscribirCurso()
    {
        string strResultado = string.Empty;
        incription_course objIns = new incription_course();

        objIns.id_course = Convert.ToInt16(this.cmbCursos.SelectedValue);
        objIns.id_student = base.getIdUsuario();
        objIns.id_state = 1;
        objIns.observation = null;
        objIns.note = 0;

        clsInscripcion inscripcion = new clsInscripcion();
        inscripcion.prInscripcion = objIns;

        strResultado = inscripcion.AsignarCursoEstudiante();

        if (string.IsNullOrEmpty(strResultado))
        {
            base.EnvioMensaje("Inscripcion realizada con éxito.", 2, this.Manejador);
            this.rdgIns.Rebind();
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
        InscribirCurso();
    }

    protected void rdgIns_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {
            string strResultado = string.Empty;
            GridEditableItem ObjItem = (GridEditableItem)e.Item;
            Hashtable ObjHashtable = new Hashtable();
            incription_course objIns = new incription_course();

            ObjItem.ExtractValues(ObjHashtable);

            objIns.id = Convert.ToInt32(ObjHashtable["id"]);

            clsInscripcion asignacion = new clsInscripcion();
            asignacion.prInscripcion = objIns;

            strResultado = asignacion.EliminarAsignacion();

            if (string.IsNullOrEmpty(strResultado))
            {
                this.rdgIns.Rebind();
                base.EnvioMensaje("Inscripción eliminada correctamente.", 2, Manejador);
            }
            else
            {
                this.rdgIns.Rebind();
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