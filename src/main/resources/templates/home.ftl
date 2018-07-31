<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <#include "common/header.ftl">
    <script type="text/javascript" src="js/echarts.min.js"></script>
    <title>工作台</title>
    <style>
        .navbar-nav .n-workbench{
            background: #eaedf1;
        }
        .view-container.workbench-body{
            background: #eaedf1;
            padding: 20px;
        }
        .workbench-body .wb-panel{
            background: #ffffff;
            box-shadow: 0 1px 1px rgba(0,0,0,0.15);
            padding: 0 15px 15px;
            margin-right: 20px;
        }
        .workbench-body .row{
            margin: 0 0 20px;
        }
        .wb-panel .nav-pills{
            padding: 0;
            margin: 0 0 15px;
        }
        .wb-panel .row{
            line-height: 25px;
            margin: 4px 0;
            background: #F5F5F6;
            border: 1px solid #F5F5F6;
            cursor: pointer;
        }
        .wb-panel .row:hover{
            background: #ffffff;
            border: 1px solid #00C1DE;
        }
        .wb-panel .row div:last-child{
            text-align: right;
        }
        .wb-actions:after{
            clear: both;
            content: " ";
            display: block;
        }
        .wb-actions div{
            text-align: center;
            background: #33cde5;
            color: #fff;
            line-height: 40px;
            margin: 0 15px 15px 0;
            cursor: pointer;
        }
        .wb-actions div:hover{
            background: #00C1DE;
        }
        .wb-actions a{
            color: #fff;
            text-decoration: none;
            display: block;
        }
    </style>
</head>
<body>
<div>
    <#include "common/navbar.ftl">
    <div class="main-body">
        <#include "common/sidebar.ftl">
        <div class="view-container workbench-body">
            <div class="row" style="height: 500px">
                <div class="col-sm-5 wb-panel" style="height: 500px;">
                    <ul class="nav nav-pills">
                        <li role="presentation" class="active"><a href="todoTask">近期待办</a></li>
                    </ul>
                    <div id = "todotaskdiv"></div>
                    <ul class="nav nav-pills">
                        <li role="presentation" class="active"><a href="contractSearch">活动合同</a></li>
                    </ul>
                    <div id = "countdiv"></div>
                    <ul class="nav nav-pills">
                        <li role="presentation" class="active"><a href="myMessage">消息通知</a></li>
                    </ul>
                    <div id = "noticediv"></div>
                </div>
                <div class="col-sm-5 wb-panel" style="height: 500px;">
                    <ul class="nav nav-pills">
                        <li role="presentation" class="active"><a href="#canvas-div" aria-controls="canvas-div" role="tab" data-toggle="tab"  onclick="test(0)">周</a></li>
                        <li role="presentation"><a href="#canvas-div" aria-controls="canvas-div" role="tab" data-toggle="tab" onclick="test(1)">月</a></li>
                        <li role="presentation"><a href="#canvas-div" aria-controls="canvas-div" role="tab" data-toggle="tab"  onclick="test(2)">年</a></li>
                    </ul>
                    <div class="row" id="canvas-div">
                        <div id="canvas" style="width: 100%;height:420px;"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-10 wb-panel" style="width: 84.5%">
                    <ul class="nav nav-pills">
                        <li role="presentation" class="active"><a href="#">新建...</a></li>
                    </ul>
                    <div class="wb-actions">


                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!--消息详情模态框-->
<div class="modal fade" id="noticeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    消息详情
                </h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">关闭
                </button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        var chartData = {};
        // canvasInit();
        // noticeInit();
        // todoTaskInit();
        // countInit();
    });

    function test(type){
        myChart = echarts.init(document.getElementById('canvas'));
        myChart.clear();
        var option = {
            title : {
                text: '工作任务量',
                subtext: ''
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['已完成任务','未完成任务']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    boundaryGap : false,
                    data :chartData.data[type].xaxis
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    axisLabel : {
                        formatter: '{value}'
                    }
                }
            ],
            series : [
                {
                    name:'已完成任务',
                    type:'line',
                    data:chartData.data[type].completeTaskCount,
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: '平均值'}
                        ]
                    }
                },
                {
                    name:'未完成任务',
                    type:'line',
                    data:chartData.data[type].unCompleteTaskCount,
                    markPoint : {
                        data : [
                            {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name : '平均值'}
                        ]
                    }
                }
            ]
        };
        myChart.setOption(option);
    }
    //初始化图标模块
    function canvasInit() {
        $.ajax({
            url: "/home/data",
            type : "GET",
            dataType : "json",
            async : false,
            success:function (data) {
                chartData = data;
                test(0);
            }
        });

    }

    //消息通知
    function noticeInit() {
        var params = {pageSize:3,pageNo:1,readFlag:0};
        // 发起ajax请求，从后台查询消息数据o
        $.ajax({
            url: 'home/noticeInit', type: 'post', data: JSON.stringify(params), success: function (rst) {
                $("#noticediv").empty();
                var rstdata = rst.data;
                if(rstdata!=null) {
                    $.each(rstdata.result, function (i, v) {//.toLocaleString()         .format("yyyy-MM-dd")
                        var content = v.workName.substr(0, 10);
                        if(v.workName.length>10){
                            content = v.workName.substr(0, 10) + "......";
                        }
                        $("#noticediv").append('<div class="row" onclick="detailNotice(\'' + v.id + '\',\'' + v.workName + '\')" style="height: 25px">'
                                + '<div class="col-sm-5" style="height: 25px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">' + v.entityName + '</div>'
                                + '<div class="col-sm-3" style="height: 25px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">' + content + '</div>'
                                + '<div class="col-sm-4" style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">' + new Date(v.sendDate).format("yyyy-MM-dd") + '</div>'
                                + '</div>'
                        );
                    });
                }else{
                    $("#noticediv").append('<div class="row" style="height: 105px;">');
                }
            }, dataType: 'json', contentType: 'application/json'
        });
    }
    // 查询消息详情
    function detailNotice(id,content) {
        $("#noticeModal").modal("show");
        $("#noticeModal .modal-body").text(content);
    }

    //近期待办
    function todoTaskInit() {
        var params = {pageSize: 3, pageNumber: 1, taskStatus: 2, userStatus: 1};
        // 发起ajax请求，从后台查询消息数据
        $.ajax({
            url: 'home/todoTaskinit', type: 'post', data: JSON.stringify(params), success: function (rst) {
                $("#todotaskdiv").empty();
                var rstdata = rst.data;
                if(rstdata!=null){
                    $.each(rstdata.rows, function(i, v){
                        if(i<3){
                            $("#todotaskdiv").append('<div class="row" onclick="todoTaskNotice(\'' + v.entityId + '\',\'' + v.taskId + '\')" style="height: 25px">'
                                    + '<div class="col-sm-5" style="height: 25px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">' + v.entityName + '</div>'
                                    + '<div class="col-sm-3" style="height: 25px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">' + v.workTask + '</div>'
                                    + '<div class="col-sm-4" style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">' + v.createTimeString + '</div>'
                                    +'</div>'
                            );
                        }
                    });
                }else{
                    $("#todotaskdiv").append('<div class="row" style="height: 105px;">');
                }

            }, dataType: 'json', contentType: 'application/json'
        });
    }

    // 查询合同详情
    function todoTaskNotice(entityid,taskId) {
        location = 'contractDetail?entityId=' + entityid + '&taskId=' + taskId;
    }
    function countInit() {
        var params = {pageSize:3,pageNumber:1};//,contractStatus: 3
        // 发起ajax请求，从后台查询消息数据
        $.ajax({
            url: 'home/countinit', type: 'post', data: JSON.stringify(params), success: function (rst) {
                $("#countdiv").empty();
                var rstdata = rst.data;
                if(rstdata!=null){
                    $.each(rstdata.rows, function(i, v){
                        $("#countdiv").append('<div class="row" onclick="detailCount(\'' + v.id + '\',\'' + v.taskId + '\')" style="height: 25px">'
                                + '<div class="col-sm-5" style="height: 25px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">' + v.contractName + '</div>'
                                + '<div class="col-sm-3" style="height: 25px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">' + (v.contractStatus ? v.contractStatus : '-') + '</div>' //  ' + v.contractStatus + '
                                + '<div class="col-sm-4" style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">' + v.createTime + '</div>'
                                +'</div>'
                        );
                    });
                }else{
                    $("#countdiv").append('<div class="row" style="height: 105px;">');
                }
            }, dataType: 'json', contentType: 'application/json'
        });
    }
    // 合同详情
    function detailCount(id,taskId) {
        location = 'contractDetail?entityId=' + id+ '&taskId=' + taskId;
    }

    Date.prototype.format = function(fmt) {
        var o = {
            "M+" : this.getMonth()+1,                 //月份
            "d+" : this.getDate(),                    //日
            "h+" : this.getHours(),                   //小时
            "m+" : this.getMinutes(),                 //分
            "s+" : this.getSeconds(),                 //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S"  : this.getMilliseconds()             //毫秒
        };
        if(/(y+)/.test(fmt)) {
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        }
        for(var k in o) {
            if(new RegExp("("+ k +")").test(fmt)){
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
            }
        }
        return fmt;
    }
</script>
</body>
</html>