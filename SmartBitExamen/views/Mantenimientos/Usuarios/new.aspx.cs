using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class views_Mantenimientos_Usuarios_new : PaginaBase
{
    #region metodos

    private void InicializarControles()
    {
        this.txtName.Text = string.Empty;
        this.txtEmail.Text = string.Empty;
        this.txtPassword.Text = string.Empty;
        this.txtDpi.Text = string.Empty;
        this.txtDireccion.Text = string.Empty;
        this.rdpFechaNac.SelectedDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, DateTime.Today.Day);
        this.cmbCarrera.DataBind();
        this.cmbRol.DataBind();
        this.txtTelefono.Text = string.Empty;
        this.txtCelular.Text = string.Empty;
        this.cmbCarrera.Enabled = false;
        this.txtName.Focus();
    }

    private string ReglasNegocio()
    {
        string strResultado = string.Empty;

        if (string.IsNullOrEmpty(this.txtName.Text)) strResultado = "El campo Nombre Completo es obligatorio";
        if (string.IsNullOrEmpty(this.txtEmail.Text)) strResultado = "El campo Email es obligatorio";
        if (string.IsNullOrEmpty(this.txtPassword.Text)) strResultado = "El campo Contraseña Completo es obligatorio";
        if (string.IsNullOrEmpty(this.txtDpi.Text)) strResultado = "El campo DPI es obligatorio";
        if (string.IsNullOrEmpty(this.txtDireccion.Text)) strResultado = "El campo Dirección es obligatorio";
        if (IsNull(this.rdpFechaNac.SelectedDate)) strResultado = "El campo Fecha de Nacimiento es obligatorio";

        return strResultado;
    }

    private void Grabar()
    {
        string strResultado = string.Empty;

        strResultado = ReglasNegocio();

        if (string.IsNullOrEmpty(strResultado))
        {
            usuario objUsuario = new usuario();

            objUsuario.complete_name = this.txtName.Text;
            objUsuario.email = this.txtEmail.Text;
            objUsuario.password = base.GetSHA1(this.txtPassword.Text);
            objUsuario.dpi = Convert.ToInt64(this.txtDpi.Text);
            objUsuario.address = this.txtDireccion.Text;
            objUsuario.birth_date = this.rdpFechaNac.SelectedDate.Value;
            objUsuario.id_type = Convert.ToInt32(this.cmbRol.SelectedValue);
            if(objUsuario.id_type == 3) objUsuario.id_career = Convert.ToInt32(this.cmbCarrera.SelectedValue);
            if(!string.IsNullOrEmpty(this.txtTelefono.Text)) objUsuario.phone = Convert.ToInt32(this.txtTelefono.Text);
            if(!string.IsNullOrEmpty(this.txtCelular.Text)) objUsuario.cell_phone = Convert.ToInt32(this.txtCelular.Text);
            objUsuario.is_enabled = true;

            clsUsuarios usuario = new clsUsuarios();
            usuario.prUsuario = objUsuario;

            strResultado = usuario.AgregarUsuario();

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

    #region eventos

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) InicializarControles();
        base.getIdUsuario();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Grabar();
        Response.Redirect("/views/Mantenimientos/Usuarios/lista.aspx");
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Grabar();
        InicializarControles();
    }

    protected void cmbRol_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Convert.ToInt32(cmbRol.SelectedValue) == 3) cmbCarrera.Enabled = true;
        else cmbCarrera.Enabled = false;
    }

    #endregion
}