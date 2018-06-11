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

public partial class views_Mantenimientos_Cursos_lista : PaginaBase
{

    #region metodos

    private string ReglasNegocio(course objCurso)
    {
        string strResultado = string.Empty;

        if (objCurso.name.Equals(string.Empty)) strResultado = "El campo nombre de curso es obligatorio.";
        if (objCurso.id_career == 0) strResultado = "El campo carrera es obligatorio.";

        return strResultado;
    }

    #endregion

    #region eventos

    protected void Page_Load(object sender, EventArgs e)
    {
        base.getIdUsuario();
    }

    protected void rdgCursos_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {
            string strResultado = string.Empty;
            GridEditableItem ObjItem = (GridEditableItem)e.Item;
            Hashtable ObjHashTable = new Hashtable();
            course objCurso = new course();

            ObjItem.ExtractValues(ObjHashTable);

            objCurso.id = Convert.ToInt32(ObjHashTable["idCurso"]);
            objCurso.name = IsNull(ObjHashTable["nombre"]) ? "" : ObjHashTable["nombre"].ToString();
            objCurso.id_career = IsNull(ObjHashTable["name"]) ? 0 : Convert.ToInt32(ObjHashTable["name"]);

            strResultado = ReglasNegocio(objCurso);

            if (strResultado.Equals(string.Empty))
            {
                clsCurso curso = new clsCurso();
                curso.prCurso = objCurso;

                strResultado = curso.EditarCurso();

                if (strResultado.Equals(string.Empty))
                {
                    base.EnvioMensaje("Datos actualizados correctamente.", 2, this.Manejador);
                    this.rdgCursos.Rebind();
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
            this.rdgCursos.MasterTableView.ClearEditItems();
            base.EnvioMensaje("Error al actualizar datos: " + ex.Message.ToString(), 1, this.Manejador);
        }
    }

    protected void rdgCursos_DeleteCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            string strResultado = string.Empty;
            GridEditableItem ObjItem = (GridEditableItem)e.Item;
            Hashtable ObjHashtable = new Hashtable();
            course objCurso = new course();

            ObjItem.ExtractValues(ObjHashtable);

            objCurso.id = Convert.ToInt32(ObjHashtable["idCurso"]);

            clsCurso curso = new clsCurso();
            curso.prCurso = objCurso;

            strResultado = curso.EliminarCurso();

            if (string.IsNullOrEmpty(strResultado))
            {
                rdgCursos.Rebind();
                base.EnvioMensaje("Registro eliminado correctamente.", 2, Manejador);
            }
            else
            {
                rdgCursos.Rebind();
                base.EnvioMensaje(strResultado, 1, Manejador);
            }
        }
        catch (Exception ex)
        {
            base.EnvioMensaje("Error al eliminar datos.", 1, this.Manejador);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("/views/Mantenimientos/Cursos/new.aspx");
    }

    #endregion

}