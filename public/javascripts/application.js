$('input[type=text]').addClass('form-control btn-outline-info');
$('input[type=email]').addClass('form-control  btn-outline-info');
$('input[type=date]').addClass('form-control  btn-outline-info');
$('input[type=checkbox]').addClass('form-check form-check-input');
$('input[type=radio]').addClass('form-check form-check-input');
$('select').addClass('form-control');

function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}


function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $(link).parent().before(content.replace(regexp, new_id));
}