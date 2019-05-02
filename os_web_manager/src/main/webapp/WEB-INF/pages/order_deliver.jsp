<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div class="page-header">
        <h1 id="page_title">确认订单信息</h1>
    </div>

    <div id="make_sure_info">
        <div id="to_be_delivered_list">
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
        </div>

        <div style="margin-top: 40px; margin-bottom: 40px;">
            <div class="col-lg-6"></div>
            <div class="col-lg-2"><h4>已选商品 ${DETAIL.commodityQuantity} 件</h4></div>
            <div class="col-lg-2"><h4>合计：￥${DETAIL.totalAmount}</h4></div>
            <c:if test="${TYPE == 'to_be_delivered'}">
                <button id="input_waybillNumber_btn" class="btn btn-primary col-lg-2">填写运单号</button>
            </c:if>
        </div>
    </div>

    <div id="input_waybillNumber" style="display: none;">

        <form class="form-horizontal" action="/backstage/order/deliver" method="post"  style="margin-top: 50px; margin-bottom: 50px;">
            <input type="hidden" name="id" value="${DETAIL.id}">
            <div id="input_phone" class="form-group">
                <label for="waybillNumber" class="col-sm-4 control-label">运单号</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="waybillNumber" name="waybillNumber" placeholder="请输入运单号">
                </div>
            </div>
            <div class="row" style="margin-top: 50px;">
                <div class="col-lg-5"></div>
                <button id="submit" class="btn btn-primary col-lg-2" type="submit">确认发货</button>
                <div class="col-lg-5"></div>
            </div>
        </form>
    </div>

</div>

<jsp:include page="bottom.jsp"/>