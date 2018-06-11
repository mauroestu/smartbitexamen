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

public partial class views_Movimientos_IngresoNotas_notas : PaginaBase
{
    #region metodos

    private void InicializarControles()
    {
        this.cmbCursos.DataBind();
        this.rdgNotas.Rebind();
    }

    private string ReglasNegocio(incription_course objIns)
    {
        string strResultado = string.Empty;

        if (objIns.note == -1) strResultado = "Es necesario ingresar la nota del curso.";
        else if (objIns.note > 100 || objIns.note < 0) strResultado = "El rango de la nota está entre 0 y 100.";

        return strResultado;
    }

    #endregion

    #region eventos

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) InicializarControles();
        base.getIdUsuario();
    }

    protected void rdgNotas_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {
            string strResultado = string.Empty;
            GridEditableItem ObjItem = (GridEditableItem)e.Item;
            Hashtable ObjHashTable = new Hashtable();
            incription_course objIns = new incription_course();

            ObjItem.ExtractValues(ObjHashTable);

            objIns.id = Convert.ToInt32(ObjHashTable["id"]);
            objIns.note = IsNull(ObjHashTable["nota"]) ? -1 : Convert.ToInt32(ObjHashTable["nota"]);
            objIns.observation = IsNull(ObjHashTable["observacion"]) ? "" : ObjHashTable["observacion"].ToString();
            objIns.id_state = IsNull(ObjHashTable["estado"]) ? 1 : Convert.ToInt32(ObjHashTable["estado"].ToString());

            strResultado = ReglasNegocio(objIns);

            if (strResultado.Equals(string.Empty))
            {
                clsNotas notas = new clsNotas();
                notas.prInscripcion = objIns;

                strResultado = notas.ActualizarNota();

                if (strResultado.Equals(string.Empty))
                {
                    base.EnvioMensaje("Nota actualizada correctamente.", 2, this.Manejador);
                    this.rdgNotas.Rebind();
                }
                else
                {
                    base.EnvioMensaje(strResultado, 2, this.Manejador);
                }
            }
            else
            {
                base.EnvioMensaje(strResultado, 1, this.Manejador);
            }
        }
        catch (Exception ex)
        {
            this.rdgNotas.MasterTableView.ClearEditItems();
            base.EnvioMensaje("Error al actualizar datos: " + ex.Message.ToString(), 1, this.Manejador);
        }
    }

    #endregion

}