<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div class="page-header">
        <h1>
            <c:choose>
                <c:when test="${TYPE == 'all_orders'}">全部</c:when>
                <c:when test="${TYPE == 'to_be_delivered'}">待发货</c:when>
                <c:when test="${TYPE == 'pending_receipt'}">待收货</c:when>
                <c:when test="${TYPE == 'to_be_commented'}">待评价</c:when>
                <c:when test="${TYPE == 'completed'}">已完成</c:when>
            </c:choose>
            订单
        </h1>
    </div>

    <div id="to_be_delivered_list">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>状态</th>
                    <th>总件数</th>
                    <th>总价格</th>
                    <th>运单号</th>
                    <th>创建时间</th>
                    <th>最后更新</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${LIST}" var="item">

                    <tr>
                        <td>${item.id}</td>
                        <td>
                            <c:choose>
                                <c:when test="${item.status == 'to_be_delivered'}">待发货</c:when>
                                <c:when test="${item.status == 'pending_receipt'}">待收货</c:when>
                                <c:when test="${item.status == 'to_be_commented'}">待评价</c:when>
                                <c:when test="${item.status == 'completed'}">已完成</c:when>
                            </c:choose>
                        </td>
                        <td>${item.commodityQuantity} 件</td>
                        <td>￥ ${item.totalAmount}</td>
                        <td>
                            <c:choose>
                                <c:when test="${item.waybillNumber == null}">暂未发货</c:when>
                                <c:when test="${item.waybillNumber != null}">${item.waybillNumber}</c:when>
                            </c:choose>
                        </td>
                        <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td><fmt:formatDate value="${item.updateTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>
                            <c:if test="${item.status == 'to_be_delivered'}">
                                <a href="/backstage/order/${TYPE}/to_deliver/${item.id}" style="margin-right: 20px;">发货</a>
                            </c:if>
                            <a href="/backstage/order/${TYPE}/detail/${item.id}" style="margin-right: 20px;">详情</a>
                        </td>
                    </tr>

                </c:forEach>

                </tbody>
            </table>

            <div class="col-lg-offset-4 col-lg-7">

                <span>第${INFO.pageNum}页</span>
                <span style="margin-right: 10px;">/ 共${INFO.pages}页</span>
                <a href="/backstage/order/list/${TYPE}/${INFO.navigateFirstPage}">首页</a>
                <a href="/backstage/order/list/${TYPE}/${INFO.prePage}">上一页</a>
                <c:forEach items="${INFO.navigatepageNums}" var="item">
                    <a href="/backstage/order/list/${TYPE}/${item}">${item}</a>
                </c:forEach>
                <a href="/backstage/order/list/${TYPE}/${INFO.nextPage}">下一页</a>
                <a href="/backstage/order/list/${TYPE}/${INFO.navigateLastPage}">末页</a>
                <span style="margin-left: 10px;">跳转到</span>
                <input id="navigate_page_num" type="number" style="width: 50px;text-align: center;"/>
                <input id="current_page_model" type="hidden" value="order"/>
                <input id="current_page_type" type="hidden" value="${TYPE}"/>
                <button id="navigate_page_btn">跳转</button>

            </div>
        </div>
    </div>
</div>

<jsp:include page="bottom.jsp"/>