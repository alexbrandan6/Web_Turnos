//Buscamos la lista con id 'navigator' y le agregamos un link y un texto dinamicos
function nav(link, text) {
    $('#navigator').append("<li><a href=" + link + "><i class='active'></i> " + text + "</a></li>");
}
//Buscamos el control del tipo 'input' y lo inicializamos como datepicker
function datepicker(id) {
    var from = $("input[id$=" + id + "]").val();
    if (from) {
        from = from.split("/");
        today = new Date(from[2], from[0]-1, from[1]);
    }
    else {
        date = new Date();
        today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
    }
    $("input[id$=" + id + "]").datepicker({
        language: 'en',
        format: 'mm/dd/yyyy',
        todayHighlight: true,
        defaultDate: today,
        autoclose: true
    });

    $("input[id$=" + id + "]").datepicker('setDate', today);
}
//agregamos un overlay de cargado cuando se indica
function setOverlay(x, id) {
	var loader = '<div class="overlay"><i class="fa fa-refresh fa-spin"></i></div>';
	if (!id)
		id = ".with-loader";
	if (x) {
        $(id).append(loader);
    }
    else
        $('.overlay', id).remove();
}

function toolTip(type, id, text) {
    try {
        new jBox('Tooltip', {
            attach: $(type + "[id*=" + id + "]"),
            title: text,
            theme: 'TooltipDark'
        });
    }
    catch (er) {
        console.log(er);
    }
}

function toolTipClass(cls, txt) {
    try {
        var tlp = new jBox('Tooltip', {
            attach: $(cls),
            title: txt,
            theme: 'TooltipDark'
        });
        return tlp;
    }
    catch (er) {
        console.log(er);
    }
}
// Convertir caracteres de html 
function htmlEscape(str) {
    return String(str)
      .replace(/&/g, '&amp;')
      .replace(/"/g, '&quot;')
      .replace(/'/g, '&#39;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;');
}
//Viceversa
function htmlEscapeUndo(str) {
    return String(str)
      .replace('&amp;', /&/g)
      .replace('&quot;', /"/g)
      .replace('&#39;', /'/g)
      .replace('&lt;', /</g)
      .replace('&gt;', />/g);
}
//Guardar en hidden
function saveHTML() {
    $('#froalaEditor').on('froalaEditor.contentChanged', function (e, editor) {
        var newText = this.value;
        newText = htmlEscape(newText);
        $('[id$=hfTextoHTML]').val(newText);
    });
}
//Buscamos el control por id e instanciamos el editor
function editor(id) {
    $("[id$=" + id + "]")
      .froalaEditor({
          // Set the image upload parameter.
          imageUploadParam: 'image_param',

          // Set the image upload URL.
          imageUploadURL: 'FroalaHandler.ashx',

          // Additional upload params.
          imageUploadParams: { postId: '123' },

          // Set request type.
          imageUploadMethod: 'POST',

          // Set max image size to 5MB.
          imageMaxSize: 5 * 1024 * 1024,

          // Allow to upload PNG and JPG.
          imageAllowedTypes: ['jpeg', 'jpg', 'png'],

          // Language
          language: 'es',

          //Buttons
          toolbarButtons: ["bold", "italic", "underline", "strikeThrough", "fontFamily", "fontSize", "color", "|",
                        "formatBlock", "align", "outdent", "indent", "|",
                        "insertOrderedList", "insertUnorderedList", "|",
                        "createLink", "insertImage", "insertVideo"],

          //Count Characters
          charCounterCount: false
      })
      .on('froalaEditor.image.beforeUpload', function (e, editor, images) {
          // Return false if you want to stop the image upload.
      })
      .on('froalaEditor.image.uploaded', function (e, editor, response) {
          // Image was uploaded to the server.
      })
      .on('froalaEditor.image.inserted', function (e, editor, $img, response) {
          // Image was inserted in the editor.
      })
      .on('froalaEditor.image.replaced', function (e, editor, $img, response) {
          // Image was replaced in the editor.
      })
      .on('froalaEditor.image.error', function (e, editor, error, response) {
      });
}

//Un simple mensaje de error
function showError(er) {
    swal({
        title: 'Error',
        type: 'warning',
        allowOutsideClick: false,
        text: er,
        confirmButtonText: 'Aceptar'
    })
}

//Validar formato email
function isValidEmailAddress(emailAddress) {
    var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
    return pattern.test(emailAddress);
}

//Setear html a div
function setHTML(id) {
    var html = $("[id$=hfTexto" + id + "]").val();
    $(".modal-body").html(html);
}

//Setear plugin datatable a gridview
function gvDataTable(id, obj) {
    var table = $('[id$=' + id + ']').prepend($("<thead></thead>").append($(obj).find("tr:first"))).DataTable({
        dom: 'Bfrtip',
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
        "aaSorting": []
    });
    return table;
}

function rpDataTable(id) {
    $('[id$=' + id + ']').DataTable({
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
}

//call handlebars
function getTemplate(url, context, container) {
    $.get(url, function (source) {
        // pass the template's source into the Handlebars compiler
        var template = Handlebars.compile(source);
        // pass the shopping list context in to render the template
        var html = template(context);
        // insert the HTML into the page
        $('#' + container).append(html);
    })
}

//Resolve video url
function resolveUrl(id) {
    if (!id) {
        id = '.embed-responsive-item';
    }
    try {
        $(id).each(function () {
            var iframe = "<ifreim class='embed-responsive-item' src='srcX' frameborder='0' allowfullscreen=''></ifreim>"
            var regExp = /^.*(youtu\.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
			var url = $(this).attr('href');
			var titulo = $(this).html();
            //Validar que la url del video no venga vacia
            if (url.length > 0) {
                var match = url.match(regExp);
                //Si la url es valida construimos la url embebida
                if (match && match[2].length == 11) {
                    var url = 'http://www.youtube.com/embed/' + match[2];
                    //Pegamos la url embebida en el html
                    var html = iframe.replace('srcX', url);
                    //Obtenemos la miniatura del video y la pegamos en un elemento img
					var video_thumbnail = $('<div class="img-holder ' + match[2] + '"><img class="' + match[2] + ' thumbnail-video" src="//img.youtube.com/vi/' + match[2] + '/0.jpg"><span>' + titulo +'</span><img class="img-responsive play" src="data:image/png;base64,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"/></div>');
                    var self = this;
                    //Insertamos el pseudo iframe que va a contener el reproductor en el contenedor
                    $(self).closest(".embed-responsive").append(html);
                    //Insertamos la miniatura en el contenedor
                    $(self).closest(".embed-responsive").after(video_thumbnail);
                    $("img." + match[2]).click(function (e) {
                        try{
                            var item = this;
                            $.when(
                                $(item).parent().prev().html($(item).parent().prev().html().replace('ifreim', 'iframe'))
                                ).done(function () {
                                    $(item).parent().prev().fadeToggle('400');
                                    $(item).parent().remove();
                                });
                        }
                        catch(er){}
                    });
                    $(self).remove();
                }
            }
                //Si viene vacia removemos el iframe
            else {
                $(this).closest(".embed-responsive").remove();
            }
        });
    }
    catch (er) {
        console.log(er);
    }
}
//Get queryString parameter
function getParameterByName(name, url) {
    if (!url) {
        url = window.location.href;
    }
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}
//Set style to chk
function checkbox() {
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
        checkboxClass: 'icheckbox_minimal-blue',
        radioClass: 'iradio_minimal-blue'
    });
}