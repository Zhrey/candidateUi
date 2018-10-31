    <#include "common/header.ftl">
    <link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
    <#--fileinput的css文件-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.8/css/fileinput.min.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="js/filemanage/filemanage.js"></script>
    <#--fileinput的JS文件-->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.8/js/fileinput.min.js"></script>
    <#--fileinput的中文包-->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.8/js/locales/zh.min.js"></script>

    <title>简历管理</title>
    <style>
        .mb-file-manage .bar-file-manage {
            background: #e7e7e7;
        }

        .mb-file-manage {
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
                <div class="container-fluid" style="margin-top: 40px">
                    <label for="contractName" class="col-sm-1 control-label"
                           style="width: 110px; text-align: left;padding-left: 19px;margin-top: 18px" >候选人姓名</label>
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
                        <div class="col-sm-12">
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

</body>
</html>