using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class views_Consultas_ReporteNotas : PaginaBase
{
    #region metodos

    private void InicializarControles()
    {
        this.rdgNotas.Rebind();
    }

    #endregion

    #region eventos

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) InicializarControles();
        base.getIdUsuario();
    }

    protected void btnGenerar_Click(object sender, EventArgs e)
    {
        this.rdgNotas.MasterTableView.ExportToPdf();
    }

    #endregion
}