using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/// <summary>
/// Lógica de negocio de todos los usuarios.
/// </summary>
public class clsUsuarios
{
    #region atributos

    private usuario objUsuario = new usuario();

    #endregion

    #region propiedades

    public usuario prUsuario
    {
        get
        {
            return this.objUsuario;
        }
        set
        {
            this.objUsuario = value;
        }
    }

    #endregion

    #region metodos

    public string AgregarUsuario()
    {
        string strResultado = string.Empty;

        try
        {
            using (universityEntities DbContext = new universityEntities())
            {
                var UsuarioExistente = DbContext.usuario.FirstOrDefault(x => (x.email == objUsuario.email && (x.is_enabled == true || x.is_enabled == false)));

                if ((UsuarioExistente != null) && (UsuarioExistente.is_enabled == true))
                {
                    strResultado = String.Format("El usuario: \"{0}\" ya está registrado en el sistema.", objUsuario.complete_name);
                }
                else if ((UsuarioExistente != null) && (UsuarioExistente.is_enabled == false))
                {
                    dynamic objUpdate = DbContext.usuario.First(x => (x.email == this.objUsuario.email));

                    objUpdate.complete_name = this.objUsuario.complete_name;
                    objUpdate.dpi = this.objUsuario.dpi;
                    objUpdate.email = this.objUsuario.email;
                    objUpdate.password = this.objUsuario.password;
                    objUpdate.address = this.objUsuario.address;
                    objUpdate.birth_date = this.objUsuario.birth_date;
                    objUpdate.phone = this.objUsuario.phone;
                    objUpdate.cell_phone = this.objUsuario.cell_phone;
                    objUpdate.id_career = this.objUsuario.id_career;
                    objUpdate.id_type = this.objUsuario.id_type;
                    objUpdate.is_enabled = true;

                    DbContext.SaveChanges();
                }
                else
                {
                    usuario newUser = new usuario();
                    newUser = this.objUsuario;

                    DbContext.usuario.Add(newUser);
                    DbContext.SaveChanges();
                }
            }
        }
        catch (Exception e)
        {
            strResultado = "Error al guardar el usuario ingresado: " + e.Message.ToString();
        }

        return strResultado;
    }

    public string EditarUsuario()
    {
        string strResultado = string.Empty;

        try
        {
            using (universityEntities DbContext = new universityEntities())
            {

                dynamic datos = DbContext.usuario.FirstOrDefault(x => (x.id == this.objUsuario.id));

                datos.complete_name = this.objUsuario.complete_name;
                datos.dpi = this.objUsuario.dpi;
                datos.email = this.objUsuario.email;
                datos.address = this.objUsuario.address;
                datos.phone = this.objUsuario.phone;
                datos.cell_phone = this.objUsuario.cell_phone;

                DbContext.SaveChanges();
            }
        }
        catch (Exception ex)
        {
            strResultado = "Error al Actualizar el Registro.";
        }

        return strResultado;
    }

    public string EliminarUsuario()
    {
        string strResultado = string.Empty;

        try
        {
            if (string.IsNullOrEmpty(strResultado))
            {
                using (universityEntities DbContext = new universityEntities())
                {
                    dynamic datos = DbContext.usuario.First(x => (x.id == this.objUsuario.id));
                    datos.is_enabled = false;
                    DbContext.SaveChanges();
                }
            }
        }
        catch (Exception ex)
        {
            strResultado = "Error al eliminar el registro.";
        }

        return strResultado;
    }

    public usuario IniciarSesion()
    {
        usuario user = null;
        try
        {
            using (universityEntities DbContext = new universityEntities())
            {
                var VerificarUsuario = DbContext.usuario.FirstOrDefault(x => (x.email == objUsuario.email && x.password == objUsuario.password));
                user = VerificarUsuario;
            }
        }
        catch (Exception e)
        {
            user = null;
        }

        return user;
    }

    #endregion

}