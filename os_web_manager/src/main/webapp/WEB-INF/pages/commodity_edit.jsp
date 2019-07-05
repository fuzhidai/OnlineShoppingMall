<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h2 class="page-header">修改商品图片</h2>

    <form class="form-horizontal" action="/backstage/commodity/upload" enctype="multipart/form-data" method="post">
        <div class="form-group">
            <label for="image" class="col-sm-3 control-label">商品图片</label>
            <div class="col-sm-3">
                <input type="hidden" name="commodityId" value="${DETAIL.id}">
                <input type="hidden" name="type" value="edit">
                <input type="file" id="image" name="image">
            </div>
            <div class="col-sm-3">
                <button type="submit" class="btn btn-primary btn-sm">上传图片</button>
            </div>
        </div>
    </form>

    <h2 class="page-header">修改商品信息</h2>

    <form class="form-horizontal" action="/backstage/commodity/edit" enctype="application/x-www-form-urlencoded" method="post">
        <input type="hidden" name="id" value="${DETAIL.id}">
        <c:if test="${PIC_PATH != null}"><input type="hidden" name="image" value="${PIC_PATH}"></c:if>
        <c:if test="${DETAIL.image != null}"><input type="hidden" name="image" value="${DETAIL.image}"></c:if>
        <div class="form-group">
            <label for="name" class="col-sm-3 control-label">名称</label>
            <div class="col-sm-6">
                <c:choose>
                    <c:when test="${DETAIL != null}"><input type="text" class="form-control" id="name" name="name" placeholder="请输入商品名称" value="${DETAIL.name}"></c:when>
                    <c:when test="${DETAIL == null}"><input type="text" class="form-control" id="name" name="name" placeholder="请输入商品名称"></c:when>
                </c:choose>
            </div>
        </div>
        <div class="form-group">
            <label for="type" class="col-sm-3 control-label">类别</label>
            <div class="col-sm-6">
                <select class="form-control" id="type" name="typeId">
                    <c:forEach items="${TYPES}" var="item">
                        <option value="${item.id}">${item.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="price" class="col-sm-3 control-label">价格</label>
            <div class="col-sm-6">
                <c:choose>
                    <c:when test="${DETAIL != null}"><input type="number" class="form-control" id="price" name="price" placeholder="请输入商品价格" value="${DETAIL.price}"></c:when>
                    <c:when test="${DETAIL == null}"><input type="number" class="form-control" id="price" name="price" placeholder="请输入商品价格"></c:when>
                </c:choose>
            </div>
        </div>
        <div class="form-group">
            <label for="stock" class="col-sm-3 control-label">库存</label>
            <div class="col-sm-6">
                <c:choose>
                    <c:when test="${DETAIL != null}"><input type="number" class="form-control" id="stock" name="stock" placeholder="请输入商品库存量" value="${DETAIL.stock}"></c:when>
                    <c:when test="${DETAIL == null}"><input type="number" class="form-control" id="stock" name="stock" placeholder="请输入商品库存量"></c:when>
                </c:choose>
            </div>
        </div>
        <div class="form-group">
            <label for="introduction" class="col-sm-3 control-label">简介</label>
            <div class="col-sm-6">
                <c:choose>
                    <c:when test="${DETAIL != null}"><input type="text" class="form-control" id="introduction" name="introduction" placeholder="请输入商品简介" value="${DETAIL.introduction}"></c:when>
                    <c:when test="${DETAIL == null}"><input type="text" class="form-control" id="introduction" name="introduction" placeholder="请输入商品简介"></c:when>
                </c:choose>
            </div>
        </div>
        <div class="form-group">
            <label for="detailedIntroduction" class="col-sm-3 control-label">详细介绍</label>
            <div class="col-sm-6">
                <c:choose>
                    <c:when test="${DETAIL != null}"><textarea class="form-control" rows="6" id="detailedIntroduction" name="detailedIntroduction" placeholder="请输入商品的详细介绍">${DETAIL.detailedIntroduction}</textarea></c:when>
                    <c:when test="${DETAIL == null}"><textarea class="form-control" rows="6" id="detailedIntroduction" name="detailedIntroduction" placeholder="请输入商品的详细介绍"></textarea></c:when>
                </c:choose>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-6">
                <button type="submit" class="btn btn-primary btn-lg">提交修改</button>
            </div>
        </div>
    </form>

</div>


<jsp:include page="bottom.jsp"/>