<%@ Page Title="" Language="C#" MasterPageFile="~/WebTurnos.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Web_Turnos.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container border-light w-50 rowTop" style="padding-top: 3%;">
        <div class="row rowTitle rowTop">
            <div class="col-12">
                <span>Reservar turno</span>
            </div>
        </div>

        <div class="row p-2 bg-white">
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
                <asp:Button ID="btnReservar" Text="Reservar" runat="server" CssClass="btn btn-primary" OnClientClick="return Validate()" OnCLick="btnReservar_Click"/>
            </div>
        </div>
    </div>

    <script>
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
    </script>

</asp:Content>
