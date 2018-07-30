<#include "common/header.ftl">
<title>首页</title>
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
</body>
</html>