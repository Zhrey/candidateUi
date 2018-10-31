    <#include "common/header.ftl">
    <link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
    <#--fileinput的css文件-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.8/css/fileinput.min.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="js/candidate/candidate.js"></script>
    <#--fileinput的JS文件-->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.8/js/fileinput.min.js"></script>
    <#--fileinput的中文包-->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.8/js/locales/zh.min.js"></script>

    <title>候选人信息</title>
    <style>
        .mb-cand-manage .bar-user-management {
            background: #e7e7e7;
        }

        .mb-cand-manage .menu-file-search {
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
    <div class="main-body mb-cand-manage">
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
</body>
</html>