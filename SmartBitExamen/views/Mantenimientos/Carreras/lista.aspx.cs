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
public partial class views_Mantenimientos_Carreras_lista : PaginaBase
{

    #region metodos 

    private string ReglasNegocio(career objCareer)
    {
        string strResultado = string.Empty;

        if (objCareer.name.Equals(string.Empty)) strResultado = "El campo nombre de carrera es obligatorio.";

        return strResultado;
    }

    #endregion

    #region eventos

    protected void Page_Load(object sender, EventArgs e)
    {
        base.getIdUsuario();
    }
 
    protected void rdgCarreras_UpdateCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            string strResultado = string.Empty;
            GridEditableItem ObjItem = (GridEditableItem)e.Item;
            Hashtable ObjHashTable = new Hashtable();
            career objCareer = new career();
            
            ObjItem.ExtractValues(ObjHashTable);

            objCareer.id = Convert.ToInt32(ObjHashTable["id"]);
            objCareer.name = IsNull(ObjHashTable["name"]) ? "" : ObjHashTable["name"].ToString();
            objCareer.description = IsNull(ObjHashTable["description"]) ? "" : ObjHashTable["description"].ToString();

            strResultado = ReglasNegocio(objCareer);

            if (strResultado.Equals(string.Empty))
            {
                clsCarrera carrera = new clsCarrera();
                carrera.prCarrera = objCareer;

                strResultado = carrera.EditarCarrera();

                if (strResultado.Equals(string.Empty))
                {
                    base.EnvioMensaje("Datos actualizados correctamente.", 2, this.Manejador);
                    this.rdgCarreras.Rebind();
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
            this.rdgCarreras.MasterTableView.ClearEditItems();
            base.EnvioMensaje("Error al actualizar datos: " + ex.Message.ToString(), 1, this.Manejador);
        }
    }

    protected void rdgCarreras_DeleteCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            string strResultado = string.Empty;
            GridEditableItem ObjItem = (GridEditableItem)e.Item;
            Hashtable ObjHashtable = new Hashtable();
            career objCareer = new career();

            ObjItem.ExtractValues(ObjHashtable);

            objCareer.id = Convert.ToInt32(ObjHashtable["id"]);

            clsCarrera carrera = new clsCarrera();
            carrera.prCarrera = objCareer;

            strResultado = carrera.EliminarCarrera();

            if (string.IsNullOrEmpty(strResultado))
            {
                rdgCarreras.Rebind();
                base.EnvioMensaje("Registro eliminado correctamente.", 2, Manejador);
            }
            else
            {
                rdgCarreras.Rebind();
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
        Response.Redirect("/views/Mantenimientos/Carreras/new.aspx");
    }

    #endregion
}