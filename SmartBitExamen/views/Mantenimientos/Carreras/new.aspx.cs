using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class views_Mantenimientos_Carreras_new : PaginaBase
{

    #region metodos

    protected void InicializarControles()
    {
        this.txtDescription.Text = string.Empty;
        this.txtName.Text = string.Empty;
        this.txtName.Focus();
    }

    protected string ReglasNegocio()
    {
        string strResultado = string.Empty;

        if (this.txtName.Text.Equals(string.Empty)) strResultado = "El campo Nombre de Carrera es obligatorio.";

        return strResultado;
    }

    protected void Grabar()
    {
        string strResultado = string.Empty;

        strResultado = ReglasNegocio();

        if (strResultado.Equals(string.Empty))
        {
            career objCareer = new career();

            objCareer.name = this.txtName.Text;
            objCareer.description = this.txtDescription.Text;
            objCareer.is_enabled = true;

            clsCarrera carrera = new clsCarrera();

            carrera.prCarrera = objCareer;
            strResultado = carrera.AgregarCarrera();

            if (strResultado.Equals(string.Empty))
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
            base.EnvioMensaje(strResultado, 1,this.Manejador);
        }
    }

    #endregion

    #region eventos

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) InicializarControles();
        base.getIdUsuario();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Grabar();
        Response.Redirect("/views/Mantenimientos/Carreras/lista.aspx");
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Grabar();
        InicializarControles();
    }

    #endregion
}