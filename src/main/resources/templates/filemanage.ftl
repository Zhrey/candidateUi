    <#include "common/header.ftl">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-table.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-select.css">
    <script type="text/javascript" src="js/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-select.js"></script>
    <script type="text/javascript" src="js/filemanage/filemanage.js"></script>
    <#--bootbox的JS文件-->
    <script type="text/javascript" src="js/bootbox.min.js"></script>

    <title>合同查询</title>
    <style>
        .mb-file-manage .bar-file-manage {
            background: #e7e7e7;
        }

        .mb-file-manage .menu-file-search {
            border-bottom: 2px solid #2d8cf0;
        }

        .menu-content .bootstrap-table {
            margin: 10px 15px;
        }
    </style>
</head>
<body>
<div>
<#include "common/navbar.ftl">
    <div class="main-body mb-file-manage">
    <#include "common/sidebar.ftl">
        <div class="view-container">
            <div class="menu-content">
                <div class="container-fluid" style="margin-top: 20px">
                    <label for="contractName" class="col-sm-1 control-label"
                           style="width: 90px; text-align: left;padding-left: 19px;margin-top: 18px" >合同名称</label>
                    <div class="input-group-btn">
                        <div class="col-sm-2">
                            <input type="text" class="form-control" style="margin: 10px 15px;" id="contractName"
                                   placeholder="">
                        </div>
                        <div class="col-sm-2">
                            <button class="btn btn-primary" id="searchbtn" style="margin: 10px 7px;">查询</button>
                            <button class="btn btn-primary" id="uploadFiles" style="margin-right: 10px">上传简历</button>
                            <button class="btn btn-primary" id="downloadFiles" style="margin-right: 10px">打包下载</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-10">
                            <table id="resumeTable"></table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<#--简历导入-->
<div class="modal fade" tabindex="-1" role="dialog" id="addfilemodel" aria-labelledby="myModalLabel" data-backdrop="static" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">文件上传</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div id="fileModelDiv" class="form-group">
                        <label for="" class="col-sm-2 control-label">合同文件</label>
                        <div class="col-sm-8">
                            <input type="file" name="fileModel" class="file" id="fileModel" placeholder="">
                        </div>
                    </div>
                    <p name="hideDiv" style="padding-left: 30px">
                        文件大小不超过2M，最多允许上传1个文件。
                    </p>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    文件详情
                </h4>
            </div>
            <div class="modal-body">
                <ul id="modalbody" class="unstyled">

                </ul>
            </div>`
        </div>
    </div><!-- /.modal-content -->
</div><!-- /.modal -->

<script type="text/javascript">
    $(function () {
        //查询
        $("#searchbtn").on('click', function () {
            $('#countTable').bootstrapTable('refresh');
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
            pageSize: 10,
            pageNumber: 1,
            pageList: [10, 25],
            queryParams: function queryParams(params) {

                //设置查询参数
                var param = {
                    pageSize: params.pageSize,
                    pageNumber: params.pageNumber
                };
                return param;
            },
            striped: true,
            columns: [
                {
                    field: 'id',
                    title: 'id',
                    visible: false
                },
                {
                    field: 'canName',
                    title: '候选人姓名',
                    width: '15%'
                },
                {
                    title: '性别',
                    field: 'sex',
                    width: '10%'
                },
                {
                    title: '工作年限',
                    field: 'workYears',
                    width: '10%'
                },
                {
                    title: '简历名称',
                    field: 'resumeName',
                    width: '17%'
                },
                {
                    field: 'operate',
                    title: '操作',
                    align: 'center',
                    events: operateEvents,
                    formatter: operateFormatter,
                    width: '17%'
                }
            ],
            onLoadSuccess: function (data) {

            }
        }

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
</script>
</body>
</html>