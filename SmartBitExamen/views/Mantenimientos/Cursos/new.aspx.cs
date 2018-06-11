using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class views_Mantenimientos_Cursos_new : PaginaBase
{
    #region Metodos

    protected void InicializarControles()
    {
        this.txtName.Text = string.Empty;
        this.cmbCarrera.DataBind();
        this.txtName.Focus();
    }

    protected string ReglasNegocio()
    {
        string strResultado = string.Empty;

        if (string.IsNullOrEmpty(this.txtName.Text)) strResultado = "El campo nombre del curso es obligatorio.";
        if (this.cmbCarrera.SelectedValue == null) strResultado = "El campo carrera es obligatorio.";

        return strResultado;

    }

    protected void Grabar()
    {
        string strResultado = string.Empty;

        strResultado = ReglasNegocio();

        if (string.IsNullOrEmpty(strResultado))
        {
            course objCurso = new course();

            objCurso.name = this.txtName.Text;
            objCurso.id_career = Convert.ToInt32(this.cmbCarrera.SelectedValue);
            objCurso.is_enabled = true;

            clsCurso curso = new clsCurso();
            curso.prCurso = objCurso;

            strResultado = curso.AgregarCurso();

            if (string.IsNullOrEmpty(strResultado))
            {
                base.EnvioMensaje("Registro agregado correctamente.", 2, this.Manejador);
            }
            else
            {
                base.EnvioMensaje(strResultado, 1, this.Manejador);
            }
        }
        else
        {
            base.EnvioMensaje(strResultado, 1, this.Manejador);
        }
    }

    #endregion

    #region Eventos

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) InicializarControles();
        base.getIdUsuario();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Grabar();
        Response.Redirect("/views/Mantenimientos/Cursos/lista.aspx");
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Grabar();
        InicializarControles();
    }

    #endregion
}