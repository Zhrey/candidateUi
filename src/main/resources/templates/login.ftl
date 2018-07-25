<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>登录</title>

    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/login.css" rel="stylesheet">
</head>

<body class="text-center">
<form class="form-signin">
    <input type="text" id="username" class="form-control" placeholder="用户名" required autofocus>
    <input type="password" id="password" class="form-control" placeholder="密码" required style="margin-top: 20px">
    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="remember-me"> 记住密码
        </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block b-login" type="button">登录</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
</form>
</body>
<script type="text/javascript">


    $(function () {
        $('.b-login').click(function () {
            $('.b-login').addClass('disabled');
            var params = {loginName: $('#username').val(), loginPwd: $('#password').val()};
            $.ajax({
                url: '/login', type: 'post', data: JSON.stringify(params), success: function (res) {
                    if (res.code == 0) {
                        window.location = 'home';
                    } else {
                        $('#errorMsg').text(res.errors[0].message);
                        $('#errorMsg').show();
                        $('.b-login').removeClass('disabled');
                    }
                }, dataType: 'json', contentType: 'application/json', error: function () {
                    $('#errorMsg').text('登录失败，请联系管理员');
                    $('#errorMsg').show();
                    $('.b-login').removeClass('disabled');
                }
            });
        });
        $('#password').on('keyup', function (event) {
            if (event.keyCode == "13") {
                $('.b-login').click();
            }
        });
    });
</script>
</html>
