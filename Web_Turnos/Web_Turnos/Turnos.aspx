<%@ Page Title="" Language="C#" MasterPageFile="~/WebTurnos.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="Web_Turnos.Turnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="text-white">
            <header class="py-5 mt-5">
                <h1 class="display-4">Turnos</h1>
                <p class="lead">Podrá seleccionar el día con el horario deseado si este se encuentra disponible.</p>
            </header>
            <div class="container">
                <div class="row">
                    <div class="col-6">
                        <label for="">Día</label>
                        <asp:DropDownList ID="ddlDiaReserva" runat="server" AppendDataBoundItems="true" CssClass="form-select" DataTextField="FechaDdl" DataValueField="Fecha" AutoPostBack="true" OnSelectedIndexChanged="ddlDiaReserva_SelectedIndexChanged">
                            <asp:ListItem Value="-1">Seleccione día</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-6">
                        <label for="">Horario</label>
                        <asp:DropDownList ID="ddlHorarioReserva" runat="server" AppendDataBoundItems="true" CssClass="form-select" DataTextField="Descripcion" DataValueField="idHorario"></asp:DropDownList>
                    </div>

                    <div class="col d-flex justify-content-center pt-3">
                        <asp:Button ID="btnReservar" Text="Reservar" runat="server" CssClass="btn btn-primary" OnClientClick="return ValidateReserva()" OnClick="btnReservar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="text-white">
            <header class="py-5 mt-5">
                <h1 class="display-4">Mis Turnos</h1>
                <p class="lead">Se ven reflejados los turnos solicitados.</p>
            </header>
            <div class="container">
                <div class="row mb-4">
                    <div class="col-12">
                        <table id="tblTurnos" class="table table-hover text-center table-responsive-lg bg-light" style="width: 100%">
                            <thead>
                                <tr>
                                    <th>Acciones</th>
                                    <th>Nro. Turno</th>
                                    <th>Fecha</th>
                                    <th>Horario</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptTurnos" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <a href="Turnos.aspx?idTurno=<%# Eval("idTurno") %>" class="btn btn-warning w-10">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                                        <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                                                    </svg>
                                                </a>

                                                <asp:LinkButton ID="btnCancelarReserva" class="btn btn-danger w-10" runat="server" CommandName="Turno" OnCommand="CancelarTurno" CommandArgument='<%#Eval("idTurno")%>'>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                              <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                              <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                            </svg>
                                                </asp:LinkButton>
                                            </td>
                                            <td>
                                                <%# Eval("idTurno") %>
                                            </td>
                                            <td>
                                                <%# Eval("Fecha").ToString().Substring(0,10) %>
                                            </td>
                                            <td>
                                                <%# Eval("Descripcion") %>
                                            </td>
                                            <td>
                                                <%# Eval("Estado") %>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container" id="divDatosTurno" runat="server">
        <div class="text-white">
            <header class="py-5 mt-5">
                <h1 class="display-4">Modificar turno</h1>
            </header>
            <div class="container">
                <div class="row mb-5">
                    <div class="col-6">
                        <label class="input-group-text-placeholder" for="ddlGenero">Día</label>
                        <asp:DropDownList ID="ddlDia" runat="server" AppendDataBoundItems="true" CssClass="form-select w-100" DataTextField="FechaDdl" DataValueField="Fecha" AutoPostBack="true" OnSelectedIndexChanged="ddlDia_SelectedIndexChanged">
                            <asp:ListItem Value="-1">Seleccione día</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-6">
                        <label class="input-group-text-placeholder" for="ddlGenero">Horario</label>
                        <asp:DropDownList ID="ddlHorario" runat="server" AppendDataBoundItems="true" CssClass="form-select w-100" DataTextField="Descripcion" DataValueField="idHorario"></asp:DropDownList>
                    </div>

                    <div class="col d-flex justify-content-center pt-3">
                        <asp:Button ID="btnActualizar" Text="Actualizar" runat="server" CssClass="btn btn-primary" OnClientClick="return Validate()" OnClick="btnActualizar_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            tableEs($('#tblTurnos'));
            showEstado('tblTurnos', 4);
        });

        function Validate() {
            var valida = true;
            var errores = [];

            var ddlDia = $("[id$=ddlDia]").val();

            if (ddlDia == "-1") {
                errores.push('Debe seleccionar un día.');
                $("[id$=ddlDia]").css("border-color", "red");
                valida = false;
            } else $("[id$=ddlDia]").css("border-color", "");

            if (!valida) {
                var err = "";

                errores.forEach(function (elem) {
                    err += elem + "\n";
                });

                showWarning(err);
            }
            return valida;
        }

        function ValidateReserva() {
            var valida = true;
            var errores = [];

            var ddlDiaReserva = $("[id$=ddlDiaReserva]").val();
            var ddlHorarioReserva = $("[id$=ddlHorarioReserva]").val();

            if (ddlDiaReserva == "-1") {
                errores.push('Debe seleccionar un día.');
                $("[id$=ddlDiaReserva]").css("border-color", "red");
                valida = false;
            } else $("[id$=ddlDiaReserva]").css("border-color", "");

            if (valida) {
                if (ddlHorarioReserva == null) {
                    errores.push('No hay horarios disponibles.');
                    $("[id$=ddlHorarioReserva]").css("border-color", "red");
                    valida = false;
                } else $("[id$=ddlHorarioReserva]").css("border-color", "");
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

</asp:Content>
