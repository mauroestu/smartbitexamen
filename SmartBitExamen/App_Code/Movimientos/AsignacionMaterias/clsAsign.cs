using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/// <summary>
/// Lógica de negocio para las asignaciones de profesores y cursos.
/// </summary>
public class clsAsign
{
    #region atributos

    private teacher_course_assignement objAsignacion = new teacher_course_assignement();

    #endregion

    #region propiedades

    public teacher_course_assignement prAsignacion
    {
        get
        {
            return objAsignacion;
        }
        set
        {
            this.objAsignacion = value;
        }
    }

    #endregion

    #region metodos

    public string AsignarCursoProfesor()
    {
        string strResultado = string.Empty;

        try
        {
            using (universityEntities DbContext = new universityEntities())
            {
                var AsignacionExistente = DbContext.teacher_course_assignement.FirstOrDefault(x => (x.id_course == this.objAsignacion.id_course && 
                (x.id_teacher == this.objAsignacion.id_teacher )));

                if (AsignacionExistente != null)
                {
                    strResultado = String.Format("El profesor actual ya tiene asignado el curso seleccionado.");
                }
                else
                {
                    teacher_course_assignement newAsignation = new teacher_course_assignement();
                    newAsignation = this.objAsignacion;

                    DbContext.teacher_course_assignement.Add(newAsignation = this.objAsignacion);
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

    public string EliminarAsignacion()
    {
        string strResultado = string.Empty;

        try
        {
            using (universityEntities DbContext = new universityEntities())
            {
                var AsignacionExistente = DbContext.teacher_course_assignement.FirstOrDefault(x => (x.id_assign == this.objAsignacion.id_assign));

                DbContext.teacher_course_assignement.Remove(AsignacionExistente);
                DbContext.SaveChanges();
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