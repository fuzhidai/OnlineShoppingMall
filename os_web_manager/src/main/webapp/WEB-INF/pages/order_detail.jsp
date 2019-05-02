<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <div class="page-header">
        <h1>订单详情</h1>
    </div>

    <ul class="nav nav-tabs">
        <li role="presentation" class="active" id="order_commodity_info"><a>商品详情</a></li>
        <li role="presentation" id="order_deal_record"><a>处理记录</a></li>
    </ul>

    <div id="order_commodity_info_list">
        <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>名称</th>
                        <th>单价</th>
                        <th>数量</th>
                        <th>金额</th>
                        <th>详情</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${DETAIL.detailList}" var="item">
                        <tr>
                            <td>${item.commodityName}</td>
                            <td>￥ ${item.commodityPrice}</td>
                            <td>${item.commodityQuantity} 件</td>
                            <td>￥ <fmt:formatNumber value="${item.commodityPrice * item.commodityQuantity}" pattern="#0.00"/></td>
                            <td>
                                <a href="/backstage/commodity/${TYPE}/detail/${DETAIL.id}" style="margin-right: 20px;">查看</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        <div style="margin-top: 40px; margin-bottom: 40px;">
            <div class="col-lg-8"></div>
            <div class="col-lg-2"><h4>已选商品 ${DETAIL.commodityQuantity} 件</h4></div>
            <div class="col-lg-2"><h4>合计：￥${DETAIL.totalAmount}</h4></div>
        </div>
    </div>

    <div id="order_deal_record_list" style="display: none;">
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th>时间</th>
                    <th>商品状态</th>
                    <th>处理人</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1,001</td>
                    <td>Lorem</td>
                    <td>Lorem</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<jsp:include page="bottom.jsp"/>