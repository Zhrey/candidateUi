<#--bootstrapValidator的css文件-->
<link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/bootstrap-validator/0.5.3/css/bootstrapValidator.min.css">
<#--bootstrapValidator的JS文件-->
<script type="text/javascript" src="https://cdn.bootcss.com/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
<nav class="navbar navbar-default topbar">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand"><img src="img/logo-navbar.png"></a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="n-workbench"><a href="home">工作台 <span class="sr-only">(current)</span></a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/myMessage"><span>消息</span><span class="badge" style="margin: -3px 0 0 5px;"
                                                              id="message"></span></a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"><span class="nav-username"></span><span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#">
                                <button id="btnSafetySet" type="button" class="btn" data-toggle="modal"
                                        data-target="#changePassword"
                                        style="border: none;background: none;margin-left: -12px;margin-top: -6px;height: 20px;">
                                    修改密码
                                </button>
                            </a>

                        </li>
                        <li role="separator" class="divider"></li>
                        <li><a href="/logout">退出系统</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- 模态框   修改密码 -->
            <div class="modal fade" id="changePassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 data-backdrop="static" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">修改密码</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" id="changePasswordForm">
                                <div class="form-group">
                                    <label for="oldPassword" class="col-sm-4 control-label">旧密码</label>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control col-sm-6" name="oldPassword"
                                               id="oldPassword">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="newPassword" class="col-sm-4 control-label">新密码</label>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control col-sm-6" name="newPassword"
                                               id="newPassword">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="checkPassword" class="col-sm-4 control-label">确认密码</label>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control col-sm-6" name="checkPassword"
                                               id="checkPassword">
                                    </div>
                                </div>
                                <span id="warning">   </span>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                关闭
                            </button>
                            <button type="button" class="btn btn-primary" id="btnNewPassword">
                                确定
                            </button>
                        </div>
                    </div>
                </div>
            </div>
<script>
    // TODO 根据token获取个人信息
    $('.nav-username').text("管理员");
    // $.getJSON('common/userInfo', function (res) {
    //     $('.nav-username').text(res.data.name);
    // });

    $(function () {

        /**
         * 关闭模态框
         */
        $("#changePassword").on("hide.bs.modal", function () {
            formReset($(this).find("form")[0].id);
        });

        /**
         *  表单重置
         */
        function formReset(id) {
            //内容重置
            if (id == "addUserForm") {
                $("#" + id).get(0).reset();
            }
            //校验销毁
            $("#" + id).data('bootstrapValidator').destroy();
            $("#" + id).data('bootstrapValidator', null);

            //重新添加校验
            addFormValidate();
        }
        /**
         * 修改密码
         */
        $("#btnNewPassword").click(function () {
            $("#changePasswordForm").bootstrapValidator('validate');
            //获取验证结果，如果成功，执行下面代码
            if ($("#changePasswordForm").data('bootstrapValidator').isValid()) {
                //提交验证
                $.ajax({
                    type: "post",
                    url: "passwordChange/change",
                    dataType: 'json',
                    contentType: 'application/json',
                    data: JSON.stringify({"password": $("#newPassword").val(), "oldPassword": $("#oldPassword").val()}),
                    success: function (data) {
                        if (data.code == "0") {
                            $('#changePassword').modal('hide');
                            bootbox.alert("修改成功");
                        } else {
                            bootbox.alert(data.errors[0].message);
                        }

                    },
                    error: function () {
                        bootbox.alert("系统异常,请联系管理员!");
                    }
                });
            }
        });

        addFormValidate();

    });

    function addFormValidate() {

        // 表单验证
        $('#changePasswordForm').bootstrapValidator({
            // 生效规则
            live: 'enabled',
            // 验证样式
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            // 验证规则
            fields: {
                // 旧密码
                oldPassword: {
                    validators: {
                        notEmpty: {
                            message: '旧密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 18,
                            message: '密码长度必须在6到18位之间'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9]+$/,
                            message: '用户名只能包含大写、小写和数字'
                        },
                        remote: {
                            url: '/passwordChange/oldPassword',//验证地址
                            message: '旧密码不正确',//提示消息
                            type: 'POST', //请求方式
                            dataType: 'json',
                            // 自定义提交数据，默认值提交当前input value
                            /*data: JSON.stringify({"password": $("#newPassword").val(), "oldPassword": $("#oldPassword").val()}),*/
                            data: function (validator) {
                                var oldPwd = $("#oldPassword").val();
                                return {
                                    "oldPassword": oldPwd
                                };
                            }
                        }
                    }
                },
                // 新密码
                newPassword: {
                    validators: {
                        notEmpty: {
                            message: '新密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 18,
                            message: '密码长度必须在6到18位之间'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9]+$/,
                            message: '密码只能包含大写、小写和数字'
                        }
                    }
                },
                // 确认密码
                checkPassword: {
                    validators: {
                        notEmpty: {
                            message: '确认密码不能为空'
                        },
                        identical: {
                            field: 'newPassword',
                            message: '新密码与确认密码不一致！'
                        }
                    }
                }
            }
        });
    }
</script>
