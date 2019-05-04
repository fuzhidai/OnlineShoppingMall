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

    <title>Carousel Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
    <link href="/css/mall_homepage.css" rel="stylesheet">

    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none !important;
            margin: 0;
        }
    </style>
</head>

<!-- NAVBAR
================================================== -->
<body>
<div class="navbar-wrapper">
    <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">易购在线商城</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse" style="float: right">
                    <ul class="nav navbar-nav">
                        <li><a href="/commodity/homepage">首页</a></li>
                        <c:choose>
                            <c:when test="${sessionScope.user == null}">
                                <li><a href="/user/to_login">登陆</a></li>
                                <li><a href="/user/to_registered">注册</a></li>
                            </c:when>
                            <c:when test="${sessionScope.user != null}">
                                <li><a href="/user/center">个人中心</a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我的订单 <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="/order/list/to_be_paid">待支付</a></li>
                                        <li><a href="/order/list/to_be_delivered">待发货</a></li>
                                        <li><a href="/order/list/pending_receipt">待收货</a></li>
                                        <li><a href="/order/list/to_be_commented">待评价</a></li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="/order/list/all">全部订单</a></li>
                                    </ul>
                                </li>
                                <li><a href="/order/cart">购物车</a></li>
                                <li><a href="/user/logout">退出登陆</a></li>
                            </c:when>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </nav>

    </div>
</div>