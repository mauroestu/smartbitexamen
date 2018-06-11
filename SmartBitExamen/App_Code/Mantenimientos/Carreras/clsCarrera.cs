using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/// <summary>
/// Lógica de negocio de todas las carreras.
/// </summary>
public class clsCarrera
{

    #region atributos

    private career objCareer = new career();

    #endregion

    #region propiedades

    public career prCarrera
    {
        get
        {
            return this.objCareer;
        }
        set
        {
            this.objCareer = value;
        }
    }

    #endregion

    #region metodos

    public string AgregarCarrera()
    {
        string strResultado = string.Empty;

        try
        {
            using (universityEntities DbContext = new universityEntities())
            {
                var CarreraExistente = DbContext.career.FirstOrDefault(x => (x.name == objCareer.name && (x.is_enabled == true || x.is_enabled == false)));

                if ((CarreraExistente != null) && (CarreraExistente.is_enabled == true))
                {
                    strResultado = String.Format("La Carrera: \"{0}\" ya está registrado en el sistema.", objCareer.name);
                }
                else if ((CarreraExistente != null) && (CarreraExistente.is_enabled == false))
                {
                    dynamic objUpdate = DbContext.career.First(x => (x.name == this.objCareer.name));

                    objUpdate.name = this.objCareer.name;
                    objUpdate.description = this.objCareer.description;
                    objUpdate.is_enabled = true;

                    DbContext.SaveChanges();
                }
                else
                {
                    career newCareer = new career();
                    newCareer = this.objCareer;

                    DbContext.career.Add(newCareer);
                    DbContext.SaveChanges();
                }
            }
        }
        catch (Exception e)
        {
            strResultado = "Error al guardar la carrera ingresada: " + e.Message.ToString();
        }

        return strResultado;
    }

    public string EditarCarrera()
    {
        string strResultado = string.Empty;

        try
        {
            using (universityEntities DbContext = new universityEntities())
            {

                dynamic datos = DbContext.career.First(x => (x.id == this.objCareer.id));

                datos.name = objCareer.name;
                datos.description = objCareer.description;

                DbContext.SaveChanges();
            }
        }
        catch (Exception ex)
        {
            strResultado = "Error al Actualizar el Registro.";
        }

        return strResultado;
    }

    public string EliminarCarrera()
    {
        string strResultado = string.Empty;

        try
        {
            if (string.IsNullOrEmpty(strResultado))
            {
                using (universityEntities DbContext = new universityEntities())
                {
                    dynamic datos = DbContext.career.First(x => (x.id == this.objCareer.id));
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

    #endregion
}