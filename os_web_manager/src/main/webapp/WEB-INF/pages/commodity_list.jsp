<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div class="page-header">
        <h1>
            <c:choose>
                <c:when test="${TYPE == 'all'}">全部商品</c:when>
                <c:when test="${TYPE == 'in_stock'}">已上架商品</c:when>
                <c:when test="${TYPE == 'for_sale'}">待上架商品</c:when>
            </c:choose>
        </h1>
    </div>

    <div id="to_be_delivered_list">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>名称</th>
                    <th>类别</th>
                    <th>价格</th>
                    <th>库存</th>
                    <th>销量</th>
                    <th>状态</th>
                    <th>上架时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${LIST}" var="item">

                    <tr>
                        <td>${item.id}</td>
                        <td>${item.name}</td>
                        <td>${item.type}</td>
                        <td>￥ ${item.price}</td>
                        <td>${item.stock} 件</td>
                        <td>${item.salesVolume} 件</td>
                        <td>
                            <c:choose>
                                <c:when test="${item.status == 'in_stock'}">已上架</c:when>
                                <c:when test="${item.status == 'for_sale'}">未上架</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${item.status == 'in_stock'}"><fmt:formatDate value="${item.addedTime}" pattern="yyyy-MM-dd HH:mm"/></c:when>
                                <c:when test="${item.status == 'for_sale'}">暂未上架</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <a href="/backstage/commodity/toDetail/${item.id}" style="margin-right: 20px;">详情</a>
                            <a href="#" style="margin-right: 20px;">修改</a>
                            <c:choose>
                                <c:when test="${item.status == 'in_stock'}"><a href="#">下架</a></c:when>
                                <c:when test="${item.status == 'for_sale'}"><a href="#">上架</a></c:when>
                            </c:choose>
                        </td>
                    </tr>

                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>

<jsp:include page="bottom.jsp"/>
