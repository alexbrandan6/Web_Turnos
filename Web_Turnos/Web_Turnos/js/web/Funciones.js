function nav(a, b) {
    $("#navigator").append(
        "<li><a href=" + a + "><i class='active'></i> " + b + "</a></li>"
    );
}
function datepicker(a) {
    var b = $("input[id$=" + a + "]").val();
    b
        ? ((b = b.split("/")), (today = new Date(b[2], b[1] - 1, b[0])))
        : ((date = new Date()),
            (today = new Date(date.getFullYear(), date.getMonth(), date.getDate())));

    $.fn.datepicker.dates['es'] = {
        days: ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo", "Lunes"],
        daysShort: ["Lun", "Mar", "Mie", "Jue", "Vie", "Sab", "Dom", "Lun"],
        daysMin: ["Lu", "Ma", "Mi", "Ju", "Vi", "Sa", "Do", "Lu"],
        months: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
        monthsShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"]
    };

    $("input[id$=" + a + "]").datepicker({
        language: "es",
        format: "dd-mm-yyyy",
        todayHighlight: !0,
        defaultDate: today,
        autoclose: !0
    });
}
function setOverlay(a, b) {
    b || (b = ".with-loader");
    a
        ? $(b).append(
            '<div class="overlay"><i class="fa fa-refresh fa-spin"></i></div>'
        )
        : $(".overlay", b).remove();
}
function toolTip(a, b, c) {
    try {
        new jBox("Tooltip", {
            attach: $(a + "[id*=" + b + "]"),
            title: c,
            theme: "TooltipDark"
        });
    } catch (d) {
        console.log(d);
    }
}
function toolTipClass(a, b) {
    try {
        return new jBox("Tooltip", {
            attach: $(a),
            title: b,
            theme: "TooltipDark"
        });
    } catch (c) {
        console.log(c);
    }
}
function htmlEscape(a) {
    return String(a)
        .replace(/&/g, "&amp;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#39;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;");
}
function htmlEscapeUndo(a) {
    return String(a)
        .replace("&amp;", /&/g)
        .replace("&quot;", /"/g)
        .replace("&#39;", /'/g)
        .replace("&lt;", /</g)
        .replace("&gt;", />/g);
}
function saveHTML() {
    $("#froalaEditor").on("froalaEditor.contentChanged", function (a, b) {
        var c = this.value,
            c = htmlEscape(c);
        $("[id$=hfTextoHTML]").val(c);
    });
}
function editor(a) {
    $("[id$=" + a + "]")
        .froalaEditor({
            imageUploadParam: "image_param",
            imageUploadURL: "FroalaHandler.ashx",
            imageUploadParams: { postId: "123" },
            imageUploadMethod: "POST",
            imageMaxSize: 5242880,
            imageAllowedTypes: ["jpeg", "jpg", "png"],
            language: "es",
            toolbarButtons: "bold italic underline strikeThrough fontFamily fontSize color | formatBlock align outdent indent | insertOrderedList insertUnorderedList | createLink insertImage insertVideo".split(
                " "
            ),
            charCounterCount: !1
        })
        .on("froalaEditor.image.beforeUpload", function (b, a, d) { })
        .on("froalaEditor.image.uploaded", function (b, a, d) { })
        .on("froalaEditor.image.inserted", function (a, c, d, e) { })
        .on("froalaEditor.image.replaced", function (a, c, d, e) { })
        .on("froalaEditor.image.error", function (a, c, d, e) { });
}
function showWarning(a) {
    swal({
        title: "Atención",
        icon: "warning",
        allowOutsideClick: !1,
        text: a,
        confirmButtonText: "Aceptar"
    });
}
function showError(a) {
    swal({
        title: "Error",
        icon: "error",
        allowOutsideClick: !1,
        text: a,
        confirmButtonText: "Aceptar"
    });
}
function showSuccess(a) {
    swal({
        title: "Hecho",
        icon: "success",
        allowOutsideClick: !1,
        text: a,
        confirmButtonText: "Aceptar"
    });
}
function showDesLog(a) {
    swal({
        title: "Atención",
        icon: "warning",
        allowOutsideClick: !1,
        text: a,
        confirmButtonText: "Aceptar",
        showCancelButton: true
    });
}
function isValidEmailAddress(a) {
    return /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i.test(
        a
    );
}
function setHTML(a) {
    a = $("[id$=hfTexto" + a + "]").val();
    $(".modal-body").html(a);
}
function gvDataTable(a, b) {
    var tabla = $('[id$=' + a + ']');

    if(!($.fn.DataTable.isDataTable(tabla))){
        var tbl = $('[id$=' + a + ']').prepend($("<thead></thead>").append($(b).find("tr:first"))).DataTable({
            fixedHeader: true,
            dom: 'Blfrtip',
            buttons: [
                { extend: 'copy', text: 'Copiar' },
                'csv', 'excel', 'pdf',
                { extend: 'print', text: 'Imprimir' }
            ],
            language: {
                buttons: {
                    copyTitle: 'Copiado al portapapeles',
                    copySuccess: {
                        _: '%d lineas copiadas',
                        1: '1 linea copiada'
                    }
                }
            },
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
            "aaSorting": []
        });

        $('#gvDiv').css("display", "");

        $('[id$=' + a + '_paginate]').removeClass("text-align");

        $('[id$=' + a + ']').wrap('<div style="overflow:auto">');

        changeEllipsis(tbl, a);

        $('[id$=' + a + '_info]').bind("DOMSubtreeModified", function () { changeEllipsis(tbl, a); });
    }

    return tbl;
}

function changeEllipsis(tbl, a) {
    var max = "0";

    if ($('[id$=' + a + '_paginate] li a').length > 0) {
        max = $('[id$=' + a + '_paginate] li a').eq(this.length - 2).html();
    }

    if ($('[id$=ellipsis]').length > 0) {
        $('[id$=ellipsis]').eq(this.length - 1).html('<a><input id="pageChange" checked type="text" style="width: 40px;height: 20px;border: none;text-align:center" placeholder="Page" maxlength="' + max.length + '"></a>')
    }

    $('#pageChange').on('keypress', function (e) {
        if (e.which == 13) {
            changePage(tbl, a);
        }
    });

    $('#pageChange').on('change', function (e) {
        changePage(tbl, a);
    });
}

function changePage(tbl, a) {
    var val = $('#pageChange').val();
    var max = $('[id$=' + a + '_paginate] li a').eq(this.length - 2).html();

    if ($.isNumeric(val)) {
        if (val <= 0) {
            val = 1
        }
        if (val > max) {
            val = max;
        }

        tbl.page(val - 1).draw(false);
    }
}

function rpDataTable(a) {
    var tabla = $('[id$=' + a + ']');
   
    var tbl = $("[id$=" + a + "]").DataTable({
        fixedHeader: true,
        dom: 'Blfrtip',
        buttons: [
            { extend: 'copy', text: 'Copiar' },
            'csv', 'excel', 'pdf',
            { extend: 'print', text: 'Imprimir' }
        ],
        language: {
            buttons: {
                copyTitle: 'Copiado al portapapeles',
                copySuccess: {
                    _: '%d lineas copiadas',
                    1: '1 linea copiada'
                }
            }
        },
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
        "aaSorting": []
    });

    $('#gvDiv').css("display", "");

    $('[id$=' + a + '_paginate]').removeClass("text-align");

    $('[id$=' + a + ']').wrap('<div style="overflow:auto">');

    changeEllipsis(tbl, a);

    $('[id$=' + a + '_info]').bind("DOMSubtreeModified", function () { changeEllipsis(tbl, a); });

    return tbl;
}
function getTemplate(a, b, c) {
    $.get(a, function (a) {
        a = Handlebars.compile(a)(b);
        $("#" + c).append(a);
    });
}
function resolveUrl(a) {
    a || (a = ".embed-responsive-item");
    try {
        $(a).each(function () {
            var a = /^.*(youtu\.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
            var c = $(this).attr("href");
            var d = $(this).html();
            0 < c.length
                ? (a = c.match(a)) &&
                11 == a[2].length &&
                ((c = "http://www.youtube.com/embed/" + a[2]),
                    (c = "<ifreim class='embed-responsive-item' src='srcX' frameborder='0' allowfullscreen=''></ifreim>".replace(
                        "srcX",
                        c
                    )),
                    (d = $(
                        '<div class="img-holder ' +
                        a[2] +
                        '"><img class="' +
                        a[2] +
                        ' thumbnail-video" src="//img.youtube.com/vi/' +
                        a[2] +
                        '/0.jpg"><span>' +
                        d +
                        '</span><img class="img-responsive play" src="data:image/png;base64,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"/></div>'
                    )),
                    $(this)
                        .closest(".embed-responsive")
                        .append(c),
                    $(this)
                        .closest(".embed-responsive")
                        .after(d),
                    $("img." + a[2]).click(function (a) {
                        try {
                            var b = this;
                            $.when(
                                $(b)
                                    .parent()
                                    .prev()
                                    .html(
                                        $(b)
                                            .parent()
                                            .prev()
                                            .html()
                                            .replace("ifreim", "iframe")
                                    )
                            ).done(function () {
                                $(b)
                                    .parent()
                                    .prev()
                                    .fadeToggle("400");
                                $(b)
                                    .parent()
                                    .remove();
                            });
                        } catch (f) { }
                    }),
                    $(this).remove())
                : $(this)
                    .closest(".embed-responsive")
                    .remove();
        });
    } catch (b) {
        console.log(b);
    }
}
function getParameterByName(a, b) {
    b || (b = window.location.href);
    a = a.replace(/[\[\]]/g, "\\$&");
    var c = new RegExp("[?&]" + a + "(=([^&#]*)|&|#|$)").exec(b);
    return c ? (c[2] ? decodeURIComponent(c[2].replace(/\+/g, " ")) : "") : null;
}
function checkbox() {
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
        checkboxClass: "icheckbox_minimal-blue",
        radioClass: "iradio_minimal-blue"
    });
}
async function showReconfirmar(er) {
    try {
        var confirmado = await swal({
            title: "Aviso",
            text: er,
            type: "warning",
            showCancelButton: !0,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Si",
            cancelButtonText: "No"
        });
        return confirmado;
    } catch {
        return !1;
    }
}

function tableEs(e) {
    $(e).DataTable({
        autoWidth: false,
        lengthMenu: [5, 10, 20],
        columnDefs: [
            {
                targets: ['_all'],
                className: 'mdc-data-table__cell'
            }
        ],
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ registros",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún dato disponible en esta tabla",
            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            },
            "buttons": {
                "copy": "Copiar",
                "colvis": "Visibilidad"
            }
        }
    });
}

function showEstado(e, child) {
    let miTabla = document.getElementById(e);
    let listTr = Array.from(miTabla.children[1].getElementsByTagName('tr'));

    listTr.forEach(tr => {
        switch (tr.children[child].innerText) {
            case 'Solicitado':
                tr.classList.add('Solicitado');
                break;
            case 'Caducado':
                tr.classList.add('Caducado');
                break;
            case 'Cancelado':
                tr.classList.add('Cancelado');
                break;
        }
    })
}

function ageVerification(value) {
    value = value.split('-');
    var day = value[0];
    var month = value[1];
    var year = value[2];

    var today = new Date(),
        dd = today.getDate(),
        mm = today.getMonth() + 1,
        yyyy = today.getFullYear();

    var age = 18;

    if (year == (yyyy - age)) {
        if (month == mm) {
            if (day > dd) {
                return false;
            } else {
                return true;
            }
        } else if (month > mm) {
            return false;
        } else {
            return true;
        }
    } else if (year > (yyyy - age)) {
        return false;
    } else {
        return true;
    }
}