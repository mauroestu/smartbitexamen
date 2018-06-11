using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/// <summary>
/// Lógica de negocio del ingreso de notas.
/// </summary>
public class clsNotas
{
    #region atributos

    private incription_course objIns = new incription_course();

    #endregion

    #region propiedades

    public incription_course prInscripcion
    {
        get
        {
            return this.objIns;
        }
        set
        {
            this.objIns = value;
        }
    }

    #endregion

    #region metodos

    public string ActualizarNota()
    {
        string strResultado = string.Empty;

        try
        {
            using (universityEntities DbContext = new universityEntities())
            {

                dynamic datos = DbContext.incription_course.FirstOrDefault(x => (x.id == this.objIns.id));

                datos.note = objIns.note;
                datos.observation = objIns.observation;
                datos.id_state = objIns.id_state;

                DbContext.SaveChanges();
            }
        }
        catch (Exception ex)
        {
            strResultado = "Error al Actualizar el Registro.";
        }


        return strResultado;
    }

    #endregion

}