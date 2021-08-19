<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuariosAlta.aspx.cs" Inherits="Web_Turnos.UsuariosAlta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap/datepicker.css">
    <link rel="stylesheet" href="css/sweetalert/sweetalert.css">
    <link rel="stylesheet" href="css/web/style.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/web/funciones.js?v1.2"></script>
    <script src="js/bootstrap/bootstrap-datepicker.js"></script>
    <script src="js/sweetalert/sweetalert.min.js"></script>

    <title>Crear Usuario</title>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container">
            <div class="text-white">
                <header class="pt-4">
                    <h1 class="display-6">Datos personales</h1>
                </header>
                <div class="container">
                    <div class="row">
                        <div class="row p-2">
                            <div class="col-lg-6 col-12">
                                <label class="input-group-text-placeholder" for="txtUser">Apellido</label>
                                <asp:TextBox ID="txtApellido" runat="server" CssClass="input-group-text w-100"></asp:TextBox>
                            </div>
                            <div class="col-lg-6 col-12">
                                <label class="input-group-text-placeholder" for="txtNombre">Nombre</label>
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="input-group-text w-100"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row p-2">
                            <div class="col-lg-6 col-12">
                                <label class="input-group-text-placeholder" for="txtMail">Mail</label>
                                <asp:TextBox ID="txtMail" runat="server" CssClass="input-group-text w-100"></asp:TextBox>
                            </div>
                            <div class="col-lg-6 col-12">
                                <label class="input-group-text-placeholder" for="txtTelefono">Teléfono</label>
                                <asp:TextBox ID="txtTelefono" runat="server" CssClass="input-group-text w-100 allownumericwithoutdecimal"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row p-2">
                            <div class="col-lg-6 col-12">
                                <label class="input-group-text-placeholder" for="ddlGenero">Género</label>
                                <asp:DropDownList ID="ddlGenero" runat="server" CssClass="form-select w-100" DataTextField="Descripcion" DataValueField="idGenero"></asp:DropDownList>
                            </div>
                            <div class="col-lg-6 col-12">
                                <label class="input-group-text-placeholder" for="txtTelefono">Fecha de nacimiento</label>
                                <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="input-group-text w-100 input-datepicker" autocomplete="off"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="text-white">
                <header class="pt-5">
                    <h1 class="display-6">Datos del usuario</h1>
                </header>
                <div class="container">
                    <div class="row">
                        <div class="row p-2">
                            <div class="col-lg-6 col-12">
                                <label class="input-group-text-placeholder" for="txtNombreUsuario">Nombre de usuario</label>
                                <asp:TextBox ID="txtNombreUsuario" runat="server" CssClass="input-group-text w-100"></asp:TextBox>
                            </div>
                            <div class="col-lg-6 col-12">
                                <label class="input-group-text-placeholder" for="txtContrasenia">Contraseña</label>
                                <asp:TextBox ID="txtContrasenia" runat="server" CssClass="input-group-text w-100"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container d-flex flex-column justify-content-center align-items-center">
            <div class="row p-2 rowBottom">
                <div class="col-12 justify-content-center">
                    <asp:Button ID="btnAceptar" Text="Aceptar" runat="server" CssClass="btn btn-primary" OnClientClick="return Validate()" OnClick="btnAceptar_Click" />
                    <asp:Button ID="btnCancelar" Text="Cancelar" runat="server" CssClass="btn btn-danger" OnClick="btnCancelar_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>

<script>
    $(document).ready(function () {
        datepicker('txtFechaNacimiento');
    });

    function Validate() {
        var valida = true;
        var errores = [];

        var txtApellido = $("[id$=txtApellido]").val();
        var txtNombre = $("[id$=txtNombre]").val();
        var txtMail = $("[id$=txtMail]").val();
        var txtTelefono = $("[id$=txtTelefono]").val();
        var ddlGenero = $("[id$=ddlGenero]").val();
        var txtFechaNacimiento = $("[id$=txtFechaNacimiento]").val();
        var txtNombreUsuario = $("[id$=txtNombreUsuario]").val();
        var txtContrasenia = $("[id$=txtContrasenia]").val();

        if (txtApellido == "") {
            errores.push('Debe ingresar el apellido.');
            $("[id$=txtApellido]").css("border-color", "red");
            valida = false;
        } else $("[id$=txtApellido]").css("border-color", "");

        if (txtNombre == "") {
            errores.push('Debe ingresar el nombre.');
            $("[id$=txtNombre]").css("border-color", "red");
            valida = false;
        } else $("[id$=txtNombre]").css("border-color", "");

        if (txtMail == "") {
            errores.push('Debe ingresar el mail.');
            $("[id$=txtMail]").css("border-color", "red");
            valida = false;
        } else {
            if (!isValidEmailAddress(txtMail)) {
                $("[id$=txtMail]").val('');
                $("[id$=txtMail]").css("border-color", "red");
                errores.push('Formato de mail incorrecto.');
                valida = false;
            } else $("[id$=txtMail]").css("border-color", "");
        }

        if (txtTelefono == "") {
            errores.push('Debe ingresar el teléfono.');
            $("[id$=txtTelefono]").css("border-color", "red");
            valida = false;
        } else $("[id$=txtTelefono]").css("border-color", "");

        if (ddlGenero == "-1") {
            errores.push('Debe seleccionar el género.');
            $("[id$=ddlGenero]").css("border-color", "red");
            valida = false;
        } else $("[id$=ddlGenero]").css("border-color", "");

        if (txtFechaNacimiento == "") {
            errores.push('Debe ingresar la fecha de nacimiento.');
            $("[id$=txtFechaNacimiento]").css("border-color", "red");
            valida = false;
        } else $("[id$=txtFechaNacimiento]").css("border-color", "");

        if (txtNombreUsuario == "") {
            errores.push('Debe ingresar el nombre de usuario.');
            $("[id$=txtNombreUsuario]").css("border-color", "red");
            valida = false;
        } else $("[id$=txtNombreUsuario]").css("border-color", "");

        if (txtContrasenia == "") {
            errores.push('Debe ingresar la contraseña.');
            $("[id$=txtContrasenia]").css("border-color", "red");
            valida = false;
        } else $("[id$=txtContrasenia]").css("border-color", "");

        if (!valida) {
            var err = "";

            errores.forEach(function (elem) {
                err += elem + "\n";
            });

            showWarning(err);
        }
        return valida;
    }

    $('#txtFechaNacimiento').on('change', function (e) {
        if (!ageVerification($('#txtFechaNacimiento').val())) {
            $('#txtFechaNacimiento').val('')
            showWarning('Debe ser mayor de 18 años');
        }
    });

    $(".allownumericwithoutdecimal").on("keypress keyup blur", function (event) {
        $(this).val($(this).val().replace(/[^\d].+/, ""));
        if ((event.which < 48 || event.which > 57)) {
            event.preventDefault();
        }
    });

</script>
