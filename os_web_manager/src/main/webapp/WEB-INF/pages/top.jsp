<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Dashboard Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/backstage_container.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">易购在线商城后台</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Settings</a></li>
                <li><a href="#">Profile</a></li>
                <li><a href="#">Help</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="page-header" style="margin-top: 10px;"><h4>${sessionScope.user.name}</h4></div>
            <ul class="nav nav-sidebar">
                <c:choose>
                    <c:when test="${TYPE=='member'}"><li class="active"><a href="/backstage/user/member/list">会员管理</a></li></c:when>
                    <c:when test="${TYPE!='member'}"><li><a href="/backstage/user/member/list">会员管理</a></li></c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${TYPE=='administrator'}"><li class="active"><a href="/backstage/user/administrator/list">管理员管理</a></li></c:when>
                    <c:when test="${TYPE!='administrator'}"><li><a href="/backstage/user/administrator/list">管理员管理</a></li></c:when>
                </c:choose>
            </ul>
            <ul class="nav nav-sidebar">

                <c:choose>
                    <c:when test="${TYPE=='add'}"><li class="active"><a href="/backstage/commodity/to_add">上架商品</a></li></c:when>
                    <c:when test="${TYPE!='add'}"><li><a href="/backstage/commodity/to_add">上架商品</a></li></c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${TYPE=='all'}"><li class="active"><a href="/backstage/commodity/list/all">全部商品</a></li></c:when>
                    <c:when test="${TYPE!='all'}"><li><a href="/backstage/commodity/list/all">全部商品</a></li></c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${TYPE=='in_stock'}"><li class="active"><a href="/backstage/commodity/list/in_stock">已上架商品</a></li></c:when>
                    <c:when test="${TYPE!='in_stock'}"><li><a href="/backstage/commodity/list/in_stock">已上架商品</a></li></c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${TYPE=='for_sale'}"><li class="active"><a href="/backstage/commodity/list/for_sale">待上架商品</a></li></c:when>
                    <c:when test="${TYPE!='for_sale'}"><li><a href="/backstage/commodity/list/for_sale">待上架商品</a></li></c:when>
                </c:choose>

                <li><a href="#">秒杀区商品</a></li>
                <li><a href="#">商品数据分析</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <c:choose>
                    <c:when test="${TYPE=='all_orders'}"><li class="active"><a href="/backstage/order/list/all">全部订单</a></li></c:when>
                    <c:when test="${TYPE!='all_orders'}"><li><a href="/backstage/order/list/all">全部订单</a></li></c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${TYPE=='to_be_delivered'}"><li class="active"><a href="/backstage/order/list/to_be_delivered">待发货订单</a></li></c:when>
                    <c:when test="${TYPE!='to_be_delivered'}"><li><a href="/backstage/order/list/to_be_delivered">待发货订单</a></li></c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${TYPE=='pending_receipt'}"><li class="active"><a href="/backstage/order/list/pending_receipt">待收货订单</a></li></c:when>
                    <c:when test="${TYPE!='pending_receipt'}"><li><a href="/backstage/order/list/pending_receipt">待收货订单</a></li></c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${TYPE=='to_be_commented'}"><li class="active"><a href="/backstage/order/list/to_be_commented">待评价订单</a></li></c:when>
                    <c:when test="${TYPE!='to_be_commented'}"><li><a href="/backstage/order/list/to_be_commented">待评价订单</a></li></c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${TYPE=='completed'}"><li class="active"><a href="/backstage/order/list/completed">已完成订单</a></li></c:when>
                    <c:when test="${TYPE!='completed'}"><li><a href="/backstage/order/list/completed">已完成订单</a></li></c:when>
                </c:choose>
                <li><a href="">订单数据分析</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <c:choose>
                    <c:when test="${TYPE=='operating'}"><li class="active"><a href="/backstage/log/list/operating">操作日志</a></li></c:when>
                    <c:when test="${TYPE!='operating'}"><li><a href="/backstage/log/list/operating">操作日志</a></li></c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${TYPE=='login'}"><li class="active"><a href="/backstage/log/list/login">登陆日志</a></li></c:when>
                    <c:when test="${TYPE!='login'}"><li><a href="/backstage/log/list/login">登陆日志</a></li></c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${TYPE=='system'}"><li class="active"><a href="/backstage/log/list/system">系统日志</a></li></c:when>
                    <c:when test="${TYPE!='system'}"><li><a href="/backstage/log/list/system">系统日志</a></li></c:when>
                </c:choose>
            </ul>
        </div>