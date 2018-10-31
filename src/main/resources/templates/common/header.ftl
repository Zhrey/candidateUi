<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="css/common/layout.css"/>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/bootbox.js/4.4.0/bootbox.min.js"></script>
<script>
    var fileServerUrl = "http://localhost:8005/file/downloadFile";
</script>
<style>
    .main-nav {
        margin-left: 1px;
    }

    .main-nav.nav-tabs.nav-stacked > li {
    }

    .main-nav.nav-tabs.nav-stacked > li > a {
        padding: 10px 8px;
        font-size: 12px;
        font-weight: 600;
        color: #4A515B;
        background: #E9E9E9;
        background: -moz-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#FAFAFA), color-stop(100%,#E9E9E9));
        background: -webkit-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
        background: -o-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
        background: -ms-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
        background: linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9');
        -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9')";
        border: 1px solid #D5D5D5;
        border-radius: 4px;
    }

    .main-nav.nav-tabs.nav-stacked > li > a > span {
        color: #4A515B;
    }

    .main-nav.nav-tabs.nav-stacked > li.active > a, #main-nav.nav-tabs.nav-stacked > li > a:hover {
        color: #FFF;
        background: #3C4049;
        background: -moz-linear-gradient(top, #4A515B 0%, #3C4049 100%);
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#4A515B), color-stop(100%,#3C4049));
        background: -webkit-linear-gradient(top, #4A515B 0%,#3C4049 100%);
        background: -o-linear-gradient(top, #4A515B 0%,#3C4049 100%);
        background: -ms-linear-gradient(top, #4A515B 0%,#3C4049 100%);
        background: linear-gradient(top, #4A515B 0%,#3C4049 100%);
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B', endColorstr='#3C4049');
        -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B', endColorstr='#3C4049')";
        border-color: #2B2E33;
    }

    #main-nav.nav-tabs.nav-stacked > li.active > a, #main-nav.nav-tabs.nav-stacked > li > a:hover > span {
        color: #FFF;
    }

    .main-nav.nav-tabs.nav-stacked > li {
        margin-bottom: 4px;
    }

    .nav-header.collapsed > span.glyphicon-chevron-toggle:before {
        content: "\e114";
    }

    .nav-header > span.glyphicon-chevron-toggle:before {
        content: "\e113";
    }

    footer.duomi-page-footer {
        background-color: white;
    }

    footer.duomi-page-footer .beta-message {
        color: #a4a4a4;
    }

    footer.duomi-page-footer .beta-message a {
        color: #53a2e4;
    }

    footer.duomi-page-footer .list-inline a, footer.authenticated-footer .list-inline li {
        color: #a4a4a4;
        padding-bottom: 30px;
    }




    footer.duomi-page-footer {
        background-color: white;
    }

    footer.duomi-page-footer .beta-message {
        color: #a4a4a4;
    }

    footer.duomi-page-footer .beta-message a {
        color: #53a2e4;
    }

    footer.duomi-page-footer .list-inline a, footer.authenticated-footer .list-inline li {
        color: #a4a4a4;
        padding-bottom: 30px;
    }

    /*********************************************自定义部分*********************************************/
    /*左侧菜单*/
    .sidebar-menu{
        border-right: 1px solid #c4c8cb;
    }
    /*一级菜单*/
    .menu-first{
        height:45px;
        line-height:45px;
        border-top: 1px solid #efefef;
        border-bottom: 1px solid #e1e1e1;
        padding: 0;
        font-size: 14px;
        font-weight: normal;
        text-align: center;
        display: block;
    }
    /*一级菜单鼠标划过状态*/
    .menu-first:hover{
        text-decoration: none;
        background-color: #d6d4d5;
        border-top: 1px solid #b7b7b7;
        border-bottom: 1px solid #acacac;
    }
    /*二级菜单*/
    .menu-second li a{
        background-color: #f6f6f6;
        height:31px;
        line-height:31px;
        border-top: 1px solid #efefef;
        border-bottom: 1px solid #efefef;
        font-size: 12px;
        text-align:center;
    }
    /*二级菜单鼠标划过样式*/
    .menu-second li a:hover {
        text-decoration: none;
        background-color: #66c3ec;
        border-top: 1px solid #83ceed;
        border-bottom: 1px solid #83ceed;
        border-right: 3px solid #f8881c;
        border-left: 3px solid #66c3ec;
    }
    /*二级菜单选中状态*/
    .menu-second-selected {
        background-color: #66c3ec;
        height:31px;
        line-height:31px;
        border-top: 1px solid #83ceed;
        border-bottom: 1px solid #83ceed;
        border-right: 3px solid #f8881c;
        border-left: 3px solid #66c3ec;
        text-align:center;
    }
    /*覆盖bootstrap的样式*/
    .nav-list,.nav-list li a{
        padding: 0px;
        margin: 0px;
    }
</style>