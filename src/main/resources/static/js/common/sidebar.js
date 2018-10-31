$(function(){
    $("#firstMenu").click();
    $(".nav-header").click(function(){
        $(this).find("span").toggleClass('glyphicon-chevron-down');
        $(this).find("span").toggleClass('glyphicon-chevron-right');
    });
});

function initMenu(data) {
    $.each(data, function (i, obj) {
        if(!obj.parentId || $('#' + obj.perId).length > 0){
            $('#' + obj.perId).show();
        }
    });
    $('.sidebar-left li:hidden').remove();
}

function initSecondMenu(data) {
    $.each(data, function (i, obj) {
        if(obj.parentId || $('#' + obj.perId).length > 0){
            $('#' + obj.perId).show();
        }
    });
    $('.nav.nav-pills li:hidden').remove();
}