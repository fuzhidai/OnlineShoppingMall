<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h2 class="page-header">上架商品</h2>

    <form class="form-horizontal" action="/backstage/commodity/add">
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
            <label for="shelf_category" class="col-sm-3 control-label">上架类型</label>
            <div class="col-sm-6" id="shelf_category">
                <select class="form-control" name="status">
                    <option value="in_stock">立即上架</option>
                    <option value="for_sale">稍后上架</option>
                </select>
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
            <label for="image" class="col-sm-3 control-label">商品图片</label>
            <div class="col-sm-6">
                <input type="file" id="image" name="image">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-6">
                <button type="submit" class="btn btn-primary btn-lg">上架商品</button>
            </div>
        </div>
    </form>

</div>


<jsp:include page="bottom.jsp"/>