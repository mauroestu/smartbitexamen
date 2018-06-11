using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;
using System.Data;
using System.Text;
using System.Security.Cryptography;

/// <summary>
/// Super clase para todo el sistema
/// </summary>
public partial class PaginaBase : System.Web.UI.Page
{
    protected void EnvioMensaje(string Text, int Tipo, RadWindowManager pObjControl)
    {
        if (Tipo == 1) //error
        {
            pObjControl.RadAlert(Text, 330, 180, "Error", null, null);
        }
        else if (Tipo == 2) //exito
        {
            pObjControl.RadAlert(Text, 330, 180, "Realizado", null, null);
        }
        else
            pObjControl.RadAlert(Text, 330, 180, "Alerta", null, null);

    }

    protected bool IsNull(object valor)
    {
        if (valor == null) return true;
        else return false;
    }

    protected string GetSHA1(string str)
    {
        SHA1 sha1 = SHA1Managed.Create();
        ASCIIEncoding encoding = new ASCIIEncoding();
        byte[] stream = null;
        StringBuilder sb = new StringBuilder();
        stream = sha1.ComputeHash(encoding.GetBytes(str));
        for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
        return sb.ToString();
    }

    protected int getIdUsuario()
    {
        int lIntCodigoEmpresa = 0;
        if (Session["IdUsuario"] != null)
        {
            int.TryParse(Session["IdUsuario"].ToString(), out lIntCodigoEmpresa);
        }
        else
        {
            Response.Redirect("/views/Default.aspx");
        }
        return lIntCodigoEmpresa;
    }
}