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
public class clsCurso
{
    #region atributos

    private course objCurso= new course();

    #endregion

    #region propiedades

    public course prCurso
    {
        get
        {
            return this.objCurso;
        }
        set
        {
            this.objCurso = value;
        }
    }

    #endregion

    #region metodos

    public string AgregarCurso()
    {
        string strResultado = string.Empty;

        try
        {
            using (universityEntities DbContext = new universityEntities())
            {
                var CursoExistente = DbContext.course.FirstOrDefault(x => (x.name == objCurso.name && (x.is_enabled == true || x.is_enabled == false)));

                if ((CursoExistente != null) && (CursoExistente.is_enabled == true))
                {
                    strResultado = String.Format("El curso: \"{0}\" ya está registrado en el sistema.", objCurso.name);
                }
                else if ((CursoExistente != null) && (CursoExistente.is_enabled == false))
                {
                    dynamic objUpdate = DbContext.course.First(x => (x.name == this.objCurso.name));

                    objUpdate.name = this.objCurso.name;
                    objUpdate.id_career = this.objCurso.id_career;
                    objUpdate.is_enabled = true;

                    DbContext.SaveChanges();
                }
                else
                {
                    course newCourse = new course();
                    newCourse = this.objCurso;

                    DbContext.course.Add(newCourse);
                    DbContext.SaveChanges();
                }
            }
        }
        catch (Exception e)
        {
            strResultado = "Error al guardar el curso ingresado: " + e.Message.ToString();
        }

        return strResultado;
    }

    public string EditarCurso()
    {
        string strResultado = string.Empty;

        try
        {
            using (universityEntities DbContext = new universityEntities())
            {

                dynamic datos = DbContext.course.FirstOrDefault(x => (x.id == this.objCurso.id));

                datos.name = objCurso.name;
                datos.id_career = objCurso.id_career;

                DbContext.SaveChanges();
            }
        }
        catch (Exception ex)
        {
            strResultado = "Error al Actualizar el Registro.";
        }

        return strResultado;
    }

    public string EliminarCurso()
    {
        string strResultado = string.Empty;

        try
        {
            if (string.IsNullOrEmpty(strResultado))
            {
                using (universityEntities DbContext = new universityEntities())
                {
                    dynamic datos = DbContext.course.First(x => (x.id == this.objCurso.id));
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