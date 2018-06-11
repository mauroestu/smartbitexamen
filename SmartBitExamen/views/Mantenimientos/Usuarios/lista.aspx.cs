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

public partial class views_Mantenimientos_Usuarios_lista : PaginaBase
{

    #region metodos

    private string ReglasNegocio(usuario objUsuario)
    {
        string strResultado = string.Empty;

        if (string.IsNullOrEmpty(objUsuario.complete_name)) strResultado = "El campo Nombre Completo es obligatorio.";
        if (objUsuario.dpi == 0) strResultado = "El campo DPI es obligatorio.";
        if (string.IsNullOrEmpty(objUsuario.email)) strResultado = "El campo Email es obligatorio.";
        if (string.IsNullOrEmpty(objUsuario.address)) strResultado = "El campo Dirección es obligatorio.";

        return strResultado;
    }

    #endregion

    #region eventos

    protected void Page_Load(object sender, EventArgs e)
    {
        base.getIdUsuario();
    }

    protected void RadGrid1_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {
            string strResultado = string.Empty;
            GridEditableItem ObjItem = (GridEditableItem)e.Item;
            Hashtable ObjHashTable = new Hashtable();
            usuario objUsuario = new usuario();

            ObjItem.ExtractValues(ObjHashTable);

            objUsuario.id = Convert.ToInt32(ObjHashTable["id"]);
            objUsuario.complete_name = IsNull(ObjHashTable["complete_name"]) ? "" : ObjHashTable["complete_name"].ToString();
            objUsuario.dpi = IsNull(ObjHashTable["dpi"]) ? 0 : Convert.ToInt64(ObjHashTable["dpi"]);
            objUsuario.email = IsNull(ObjHashTable["email"]) ? "" : ObjHashTable["email"].ToString();
            objUsuario.address = IsNull(ObjHashTable["address"]) ? "" : ObjHashTable["address"].ToString();
            objUsuario.phone = IsNull(ObjHashTable["phone"]) ? 0 : Convert.ToInt32(ObjHashTable["phone"]);
            objUsuario.cell_phone = IsNull(ObjHashTable["cell_phone"]) ? 0 : Convert.ToInt32(ObjHashTable["cell_phone"]);

            if (objUsuario.phone == 0) objUsuario.phone = null;
            if (objUsuario.cell_phone == 0) objUsuario.cell_phone = null;

            strResultado = ReglasNegocio(objUsuario);

            if (strResultado.Equals(string.Empty))
            {
                clsUsuarios usuario = new clsUsuarios();
                usuario.prUsuario = objUsuario;

                strResultado = usuario.EditarUsuario();

                if (strResultado.Equals(string.Empty))
                {
                    base.EnvioMensaje("Datos actualizados correctamente.", 2, this.Manejador);
                    this.rdgUsuarios.Rebind();
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
            this.rdgUsuarios.MasterTableView.ClearEditItems();
            base.EnvioMensaje("Error al actualizar datos: " + ex.Message.ToString(), 1, this.Manejador);
        }
    }

    protected void rdgUsuarios_DeleteCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            string strResultado = string.Empty;
            GridEditableItem ObjItem = (GridEditableItem)e.Item;
            Hashtable ObjHashtable = new Hashtable();
            usuario objUsuario = new usuario();

            ObjItem.ExtractValues(ObjHashtable);

            objUsuario.id = Convert.ToInt32(ObjHashtable["id"]);

            clsUsuarios usuario = new clsUsuarios();
            usuario.prUsuario = objUsuario;

            strResultado = usuario.EliminarUsuario();

            if (string.IsNullOrEmpty(strResultado))
            {
                this.rdgUsuarios.Rebind();
                base.EnvioMensaje("Registro eliminado correctamente.", 2, Manejador);
            }
            else
            {
                rdgUsuarios.Rebind();
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
        Response.Redirect("/views/Mantenimientos/Usuarios/new.aspx");
    }

    #endregion
}