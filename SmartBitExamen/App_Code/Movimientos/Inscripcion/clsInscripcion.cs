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
public class clsInscripcion
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

    public string AsignarCursoEstudiante()
    {
        string strResultado = string.Empty;

        try
        {
            using (universityEntities DbContext = new universityEntities())
            {
                var AsignacionExistente = DbContext.incription_course.FirstOrDefault(x => (x.id_course == this.objIns.id_course &&
                (x.id_student == this.objIns.id_student)));

                if (AsignacionExistente != null)
                {
                    strResultado = String.Format("El alumno actual ya tiene asignado el curso seleccionado.");
                }
                else
                {
                    incription_course newInscription = new incription_course();
                    newInscription.id_course = this.objIns.id_course;
                    newInscription.id_state = this.objIns.id_state;
                    newInscription.id_student = this.objIns.id_student;
                    newInscription.note = this.objIns.note;
                    newInscription.observation = this.objIns.observation;

                    DbContext.incription_course.Add(newInscription);
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

    public string EliminarAsignacion()
    {
        string strResultado = string.Empty;

        try
        {
            using (universityEntities DbContext = new universityEntities())
            {
                var AsignacionExistente = DbContext.incription_course.FirstOrDefault(x => (x.id == this.objIns.id));

                if (AsignacionExistente.id_state == 1)
                {
                    DbContext.incription_course.Remove(AsignacionExistente);
                    DbContext.SaveChanges();
                }
                else
                {
                    strResultado = "El estado de la inscripción no es abierta, no se puede modificar la inscripción a este curso.";
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