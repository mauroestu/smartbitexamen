using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class views_Default : PaginaBase
{

    #region metodos

    private void InicializarControles()
    {
        this.txtEmail.Text = string.Empty;
        this.txtPassword.Text = string.Empty;
    }

    private void ReiniciarSesiones()
    {
        Session["Usuario"] = null;
        Session["IdRol"] = null;
        Session["IdUsuario"] = null;
        Session["IdCarrera"] = null;
    }

    private string ReglasNegocio()
    {
        string strResultado = string.Empty;

        if (string.IsNullOrEmpty(this.txtEmail.Text)) strResultado = "El campo Email es obligatorio.";
        if (string.IsNullOrEmpty(this.txtPassword.Text)) strResultado = "El campo Contraseña es obligatorio.";

        return strResultado;
    }

    #endregion

    #region eventos

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) InicializarControles();
        ReiniciarSesiones();
    }

    protected void btnIniciar_Click(object sender, EventArgs e)
    {
        string strResultado = string.Empty;

        strResultado = ReglasNegocio();

        if (string.IsNullOrEmpty(strResultado))
        {
            usuario objUser = new usuario();

            objUser.email = this.txtEmail.Text;
            objUser.password = base.GetSHA1(this.txtPassword.Text);

            clsUsuarios usuario = new clsUsuarios();
            usuario.prUsuario = objUser;
            objUser = usuario.IniciarSesion();

            if (objUser != null)
            {
                Session["Usuario"] = objUser.complete_name;
                Session["IdRol"] = objUser.id_type;
                Session["IdUsuario"] = objUser.id;

                switch (objUser.id_type)
                {
                    case 1:
                        Response.Redirect("/views/Mantenimientos/Usuarios/lista.aspx");
                        break;
                    case 2:
                        Response.Redirect("/views/Movimientos/IngresoNotas/notas.aspx");
                        break;
                    case 3:
                        Session["IdCarrera"] = objUser.id_career;
                        Response.Redirect("/views/Movimientos/Inscripcion/inscripcion.aspx");
                        break;
                }       
            }
            else
            {
                base.EnvioMensaje("Credenciales Inválidas",1,this.Manejador);
            }
        }
        else
        {
            base.EnvioMensaje(strResultado, 1, this.Manejador);
        }
    }

    #endregion
}