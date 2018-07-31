// $.getJSON('common/getList', function (res) {
//     if (!res.data) {
//         bootbox.alert('未取到系统权限。', function () {
//             location = '/';
//         });
//     } else {
//         initMenu(res.data);
//     }
// });
// $.getJSON('common/countToDoTask', function (res) {
//     if (res.code == 0 && res.data > 0) {
//         $('.bar-personal-task .has-num').show();
//     } else {
//         $('.bar-personal-task .has-num').hide();
//     }
// });
// $.getJSON('common/countBorrowTodoTask', function (res) {
//     if (res.code == 0 && res.data > 0) {
//         $('.bar-contr-file .has-num').show();
//     } else {
//         $('.bar-contr-file .has-num').hide();
//     }
// });

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