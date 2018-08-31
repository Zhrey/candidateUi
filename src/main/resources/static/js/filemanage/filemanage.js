$(function () {
    //初始化上传控件
    fileInput("fileModel");
    //查询
    $("#searchbtn").on('click', function () {
        $('#resumeTable').bootstrapTable('refresh');
    });
    //上传简历
    $("#uploadFiles").on('click', function () {
        $('#fileModel').fileinput('clear');
        $('#addfilemodel').modal();
    });

    //打包下载
    $('#downloadFiles').click(function () {
        var countList= $("#countTable").bootstrapTable('getSelections');
        if(countList.length<=0){
            bootbox.alert("打包下载请选中一行");
        }else {
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
                        window.location.href = Countfilesdownloadurl + "countList=" + JSON.stringify(countList);
                    }
                }
            });
        }
    });

    //初始化表格
    initTable();
});

function initTable() {
    $("#resumeTable").bootstrapTable('destroy');
    $('#resumeTable').bootstrapTable({
        url: 'resume/searchResume',
        method: 'post',
        pagination: true,
        sidePagination: "server",
        contentType: "application/json",
        striped: true,
        dataType: "json",
        searchTimeOut: 5000,
        queryParamsType: '',
        pageSize: 2,
        pageNumber: 1,
        pageList: [2, 25],
        queryParams: function queryParams(params) {

            //设置查询参数
            var param = {
                pageSize: params.pageSize,
                pageNo: params.pageNumber
            };
            return param;
        },
        striped: true,
        columns: [
            {
                field: 'id',
                title: 'id',
                visible: false
            },{
                field: 'name',
                title: '候选人姓名'
            },
            {
                title: '性别',
                field: 'sex'
            },
            {
                title: '工作年限',
                field: 'workingTime'
            },
            {
                title: '联系方式',
                field: 'mobile'
            },
            {
                title: '简历名称',
                field: 'resumeName'
            },
            {
                title: '标签名称',
                field: 'tagName'
            },
            {
                title: '应聘职位',
                field: 'jobPosition'
            },
            {
                title: '现在单位',
                field: 'currentCompany'
            },
            {
                title: '期望月薪(税前)',
                field: 'expectSalary'
            },
            {
                title: '投递(收藏)时间',
                field: 'deliveryDate'
            },
            {
                field: 'operate',
                title: '操作',
                align: 'center',
                events: operateEvents,
                formatter: operateFormatter
            }
        ],
        onLoadSuccess: function (data) {

        }
    });

}

function operateFormatter(value, row, index) {

    return '<button type="button" class="btn btn-primary btn-xs" id="fileDetail">详情</button>' +
        '<button type="button" class="btn btn-primary btn-xs" id="fileDownload" style="margin-left: 5px">下载</button>';
    '<button type="button" class="btn btn-cancel btn-xs" id="fileDelete" style="margin-left: 5px">删除</button>';
}

//下载、删除  按钮功能
window.operateEvents = {
    "click #fileDetail": function (e, vlaue, row) {
    },
    "click #fileDownload": function (e, vlaue, row) {
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
    "click #fileDelete": function (e, vlaue, row) {
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


function fileInput(id) {

    // 允许上传文件数
    var fileCount = 1;
    // 上传大小
    var fileSize = 20480;
    // 上传格式
    var extensions = ["xls","xlsx"];

    $('#' + id).fileinput({
        // 上传文件路径
        uploadUrl: "/resume/uploadResume",
        //是否显示拖拽区域
        dropZoneEnabled: false,
        // 接收的文件后缀
        allowedFileExtensions: extensions,
        // 是否显示上传按钮
        showUpload: false,
        // 是否显示移除按钮
        showRemove: false,
        // 上传大小，单位为kb
        maxFileSize: fileSize,
        // 是否自动替换当前图片
        autoReplace: true,
        // 表示允许同时上传的最大文件个数
        maxFileCount: fileCount,
        // 设置语言
        language: 'zh',
        // 异步上传
        uploadAsync: true,
        //当文件不符合规则，就不显示预览
        removeFromPreviewOnError: true

    }).on("filebatchselected", function (event, files) {
        $(this).fileinput("upload");
    }).on("fileuploaded", function (event, data, previewId, index) {
        if (data.response && data.response.code == "0") {
            bootbox.alert("上传成功！");
            $('#resumeTable').bootstrapTable('refresh');
        }else if(data.response){
            bootbox.alert(data.response.errors[0].message);
        }else {
            bootbox.alert("上传失败！");
        }
        $('#addfilemodel').modal('hide');
    });
}

