<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="views_Default" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
    <meta name="author" content="Marx JMoura">
    <meta name="description" content="Sign in page allow users to access the application by providing their credentials.">
    <title>SmartBit - Iniciar Sesión</title>
    <link rel="icon" href="assets/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
    <link href="assets/dist/admin4b.min.css" rel="stylesheet">
</head>

<body>
    <div class="container-fluid pt-2">
        <div class="page-sign">
                <form id="form1" class="form-sign" runat="server">
                    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
                <telerik:RadWindowManager ID="Manejador" runat="server">
                </telerik:RadWindowManager>
                        <h1 class="display-4 text-center mb-5">Iniciar Sesión</h1>
                    <div class="form-group">
                            <asp:TextBox ID="txtEmail" CssClass="form-control" Placeholder="Email" runat="server" TextMode="Email"></asp:TextBox> 
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtPassword" CssClass="form-control" Placeholder="Contraseña" runat="server" TextMode="Password"></asp:TextBox>
                        
                    </div>
                    <asp:Button ID="btnIniciar" CssClass="btn btn-lg btn-primary btn-block" runat="server" Text="Iniciar Sesión" OnClick="btnIniciar_Click" />
                    
                </form>
                
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>
    <script src="assets/dist/admin4b.min.js"></script>
    <script src="assets/js/admin4b.docs.js"></script>
</body>

</html>

