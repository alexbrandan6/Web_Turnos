<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web_Turnos.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/sweetalert/sweetalert.css">
    <link rel="stylesheet" href="css/web/login.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/web/funciones.js"></script>
    <script src="js/sweetalert/sweetalert.min.js"></script>

    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="containerLogin" class="container d-flex flex-column justify-content-center align-items-center">
            <div class="row rowLogin rowTop rowTitle">
                <div class="col-12">
                    <img src="img/icon.png" alt="Web Turnos" style="max-height: 65px;" />
                </div>
            </div>

            <div class="row rowLogin pt-2 pb-2">
                <div class="col-12">
                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="input-group-text inputLogin" placeholder="Usuario"></asp:TextBox>
                </div>
            </div>

            <div class="row rowLogin pb-2">
                <div class="col-12">
                    <asp:TextBox ID="txtContra" runat="server" CssClass="input-group-text inputLogin" placeholder="Contraseña" TextMode="Password"></asp:TextBox>
                </div>
            </div>

            <div class="row rowLogin pb-2">
                <div class="col-12">
                    <a href="AltaUsuarios.aspx">Crear cuenta</a>
                </div>
            </div>

            <div class="row rowLogin rowBottom pb-2">
                <div class="col-12">
                    <asp:Button ID="btnLog" runat="server" CssClass="btn btn-primary" Text="Ingresar" OnClientClick="return Validate()" OnClick="btnLog_Click"/>
                    <asp:Button ID="btnCancelar" Text="Cancelar" runat="server" CssClass="btn btn-danger" OnClick="btnCancelar_Click" />
                </div>
                <div class="col-12">
                    
                </div>
            </div>
        </div>
    </form>
</body>
</html>

<script>
    function Validate() {
        var valida = true;
        var errores = [];

        var txtUsuario = $("[id$=txtUsuario]").val();
        var txtContra = $("[id$=txtContra]").val();

        if (txtUsuario == "") {
            errores.push('Debe ingresar el Usuario.');
            valida = false;
        }
        if (txtContra == "") {
            errores.push('Debe ingresar la Contraseña.');
            valida = false;
        }

        if (!valida) {
            var err = "";

            errores.forEach(function (elem) {
                err += elem + "\n";
            });

            showWarning(err);
        }

        return valida;
    }
</script>
