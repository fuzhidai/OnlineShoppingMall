<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="action" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div class="page-header">
        <h1>商品详情<small style="float: right; margin-top: 2%; font-size: medium;"><a href="/backstage/commodity/${TYPE}/to_edit/${DETAIL.id}">修改信息</a></small></h1>
    </div>
    <div class="form-horizontal">
        <div class="form-group">
            <div class="col-lg-4">
                <h5>名称</h5>
                <h4 class="subtext">${DETAIL.name}</h4>
            </div>
            <div class="col-lg-4">
                <h5>状态</h5>
                <h4 class="subtext">
                    <c:choose>
                        <c:when test="${DETAIL.status == 'in_stock'}">已上架</c:when>
                        <c:when test="${DETAIL.status == 'for_sale'}">未上架</c:when>
                    </c:choose>
                </h4>
            </div>
            <div class="col-lg-4">
                <h5>分类</h5>
                <h4 class="subtext">${DETAIL.type}</h4>
            </div>
        </div>

        <div class="form-group">
            <div class="col-lg-4">
                <h5>价格</h5>
                <h4 class="subtext">￥ ${DETAIL.price}</h4>
            </div>
            <div class="col-lg-4">
                <h5>库存</h5>
                <h4 class="subtext">${DETAIL.stock} 件</h4>
            </div>
            <div class="col-lg-4">
                <h5>销量</h5>
                <h4 class="subtext">${DETAIL.salesVolume} 件</h4>
            </div>
        </div>

        <div class="page-header"></div>

        <div class="row">
            <div class="col-lg-4">
                <h5>创建时间</h5>
                <h4 class="subtext"><fmt:formatDate value="${DETAIL.createTime}" pattern="yyyy-MM-dd HH:mm"/></h4>
            </div>
            <div class="col-lg-4">
                <h5>上架时间</h5>
                <h4 class="subtext"><fmt:formatDate value="${DETAIL.addedTime}" pattern="yyyy-MM-dd HH:mm"/></h4>
            </div>
            <div class="col-lg-4">
                <h5>最后修改时间</h5>
                <h4 class="subtext"><fmt:formatDate value="${DETAIL.updateTime}" pattern="yyyy-MM-dd HH:mm"/></h4>
            </div>
        </div>

        <div class="page-header"></div>

        <div class="row col-lg-12">
            <h5>简介</h5>
            <h4 class="subtext">${DETAIL.introduction}</h4>
        </div>

        <div class="row col-lg-12" style="margin-top: 20px;">
            <h5>详细介绍</h5>
            <h4 class="subtext">${DETAIL.detailedIntroduction}</h4>
        </div>

        <div class="row col-lg-12" style="margin-top: 20px;">
            <h5>展示图片</h5>
            <img class="featurette-image img-responsive center-block" src="/pic/${DETAIL.image}" alt="Generic placeholder image">
        </div>

    </div>

</div>

<jsp:include page="bottom.jsp"/>
