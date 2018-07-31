var filedownloadurl = 'file/downloadfile?filePath=';
//父表 文件履历按钮
/**
 * @return {string}
 */
function countoperateFormatter(value, row, index) {
    return [
        '<button type="button" data-toggle="modal" data-target="#myModal" id="filemodal" class="btn btn-primary btn-xs" >文件履历</button>'
    ].join('');
}

//子表 下载及删除按钮
/**
 * @return {string}
 */
function operateFormatter(value, row, index) {
    return [
        '<button id="filedown" type="button" class="btn btn-sm btn-primary">下载</button>&nbsp',
        '<button id="filedelete" type="button" class="btn btn-sm btn-danger">删除</button>'
    ].join('');
}


//文件履历model下载文件方法
/**
 * @return {string}
 */
function downLoadFile(obj) {
    var data = obj.attributes;
    bootbox.confirm({
        title: "文件下载",
        message: "是否下载文件",
        buttons: {
            cancel: {
                label: '<i class="fa fa-times"></i> 取消'
            },
            confirm: {
                label: '<i class="fa fa-check"></i> 下载'
            }
        },
        callback: function (result) {
            if (result) {
                var filePath = data.file_url.value;
                window.location.href = filePath;
            }
        }
    });
}

//下载、删除  按钮功能
window.operateEvents = {
    "click #filedown": function (e, vlaue, row) {
        bootbox.confirm({
            title: "文件下载",
            message: "是否下载文件",
            buttons: {
                cancel: {
                    label: '<i class="fa fa-times"></i> 取消'
                },
                confirm: {
                    label: '<i class="fa fa-check"></i> 下载'
                }
            },
            callback: function (result) {
                if (result) {
                    var filePath = row.filePath;
                    var fileName = row.name;
                    var url = filedownloadurl + filePath + '&fileName=' + fileName;
                    window.location.href = url;
                }
            }
        });
    },
    "click #filedelete": function (e, vlaue, row) {
        bootbox.confirm({
            title: "文件删除",
            message: "是否删除文件",
            buttons: {
                cancel: {
                    label: '<i class="fa fa-times"></i> 取消'
                },
                confirm: {
                    label: '<i class="fa fa-check"></i> 删除'
                }
            },
            callback: function (result) {
                if (result) {
                    var id = row.id;
                    $.ajax({
                        url: 'filemanage/delfile', type: 'post', data: id, success: function (rst) {
                            $("#searchbtn").click();
                        }, dataType: 'json', contentType: 'application/json'
                    });
                }
            }
        });
    },
    // 点击文件履历按钮，查询出所有文件
    "click #filemodal": function (e, vlaue, row) {
        //dataflag  区分是否查全部文件
        var params = {countId: row.id, dataFlag: 1,pageSize:200};
        $("#modalbody").text("");
        $.ajax({
            url: 'filemanage/getfile', type: 'post', data: JSON.stringify(params), success: function (rst) {
                $('#myModal').modal('show');
                var total = rst.data.total;
                var fileline = 0;
                var fileNolist = [];
                for (var i = 0; i < total; i++) {
                    var libollen = true;
                    var data = rst.data.rows[i];
                    var fileNo = data.fileNo;
                    var fileinum;
                    var fileName = data.name;
                    var filePath = data.filePath;
                    var url = filedownloadurl + filePath + '&fileName=' + fileName;
                    for (var j = 0; j < fileNolist.length; j++) {
                        if (fileNo === fileNolist[j]) {
                            libollen = false;
                            fileinum = j;
                            break;
                        }
                    }
                    if (libollen) {
                        var aclass = "abtn_" + fileline;
                        $("#modalbody").append("<li id=\"li_" + fileline + "\" style=\"margin-bottom: 20px;\"></li>");
                        if (filePath == null || filePath === undefined || filePath === "") {
                            $("#li_" + fileline).append("<a class=\"btn btn-danger\" disabled>" + fileName + "</a>");
                        } else {
                            $("#li_" + fileline).append("<a class=" + aclass + " onclick=\"downLoadFile(this)\" file_url=" + url + " file_name=" + fileName + ">" + fileName + "</a>");
                        }
                        $("." + aclass).addClass(aclass + " btn btn-success");
                        fileline++;
                        fileNolist.push(fileNo);
                    } else {
                        if (filePath == null || filePath === undefined || filePath === "") {
                            $("#li_" + fileinum).append("----<a class=\"btn btn-danger\" disabled>" + fileName + "</a>");
                        } else {
                            $(".abtn_" + fileinum).attr("class", "btn btn-primary");
                            $("#li_" + fileinum).append("----<a class=\"abtn_" + fileinum + " btn btn-success\" onclick=\"downLoadFile(this)\" file_url=" + url + " file_name=" + fileName + ">" + fileName + "</a>");
                        }
                    }
                }
            }, dataType: 'json', contentType: 'application/json'
        });
    }
};