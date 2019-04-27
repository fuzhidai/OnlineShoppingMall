<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div class="page-header">
        <h1>商品详情<small style="float: right; margin-top: 2%; font-size: medium;">修改信息</small></h1>
    </div>

    <div class="form-horizontal">
        <div class="form-group">
            <div class="col-lg-4">
                <h4>编号</h4>
                <h4 class="subtext">${DETAIL.id}</h4>
            </div>
            <div class="col-lg-4">
                <h4>名称</h4>
                <h4 class="subtext">${DETAIL.name}</h4>
            </div>
            <div class="col-lg-4">
                <h4>状态</h4>
                <h4 class="subtext">${DETAIL.status}</h4>
            </div>
        </div>

        <div class="row" style="margin-top: 60px;">
            <div class="col-lg-4">
                <h4>创建时间</h4>
                <h4 class="subtext"><fmt:formatDate value="${DETAIL.createTime}" pattern="yyyy-MM-dd HH:mm"/></h4>
            </div>
            <div class="col-lg-4">
                <h4>上架时间</h4>
                <h4 class="subtext"><fmt:formatDate value="${DETAIL.addedTime}" pattern="yyyy-MM-dd HH:mm"/></h4>
            </div>
            <div class="col-lg-4">
                <h4>最后修改时间</h4>
                <h4 class="subtext"><fmt:formatDate value="${DETAIL.updateTime}" pattern="yyyy-MM-dd HH:mm"/></h4>
            </div>
        </div>

        <div class="form-group" style="margin-top: 60px;">
            <div class="col-lg-3">
                <h4>分类</h4>
                <h4 class="subtext">${DETAIL.type}</h4>
            </div>
            <div class="col-lg-3">
                <h4>价格</h4>
                <h4 class="subtext">￥ ${DETAIL.price}</h4>
            </div>
            <div class="col-lg-3">
                <h4>库存</h4>
                <h4 class="subtext">${DETAIL.stock} 件</h4>
            </div>
            <div class="col-lg-3">
                <h4>销量</h4>
                <h4 class="subtext">${DETAIL.salesVolume} 件</h4>
            </div>
        </div>

        <div class="row col-lg-12" style="margin-top: 60px;">
            <h4>简介</h4>
            <h4 class="subtext">${DETAIL.introduction}</h4>
        </div>

        <div class="row col-lg-12" style="margin-top: 60px;">
            <h4>详细介绍</h4>
            <h4 class="subtext">${DETAIL.detailedIntroduction}</h4>
        </div>

        <div class="row col-lg-12" style="margin-top: 60px;">
            <h4>展示图片</h4>
            <h4 class="subtext">${DETAIL.image}</h4>
        </div>

    </div>

</div>

<jsp:include page="bottom.jsp"/>
