<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="top.jsp"/>

<div class="container marketing">

    <div class="page-header" style="margin-top: 10%;">
        <h1>订单详情</h1>
    </div>

    <div class="featurette">
        <div class="row">
            <div class="col-lg-3">
                <h5>编号</h5>
                <h4><span>${DETAIL.id}</span></h4>
            </div>
            <div class="col-lg-3">
                <h5>状态</h5>
                <h4><span>
                    <c:choose>
                        <c:when test="${DETAIL.status == 'to_be_delivered'}">待发货</c:when>
                        <c:when test="${DETAIL.status == 'pending_receipt'}">待收货</c:when>
                        <c:when test="${DETAIL.status == 'to_be_commented'}">待评价</c:when>
                        <c:when test="${DETAIL.status == 'completed'}">已完成</c:when>
                    </c:choose>
                </span></h4>
            </div>
            <div class="col-lg-3">
                <h5>总金额</h5>
                <h4><span>￥ ${DETAIL.totalAmount}</span></h4>
            </div>
            <div class="col-lg-3">
                <h5>运单号</h5>
                <h4><span>
                    <c:choose>
                        <c:when test="${DETAIL.waybillNumber == null}">暂未发货</c:when>
                        <c:when test="${DETAIL.waybillNumber != null}">${DETAIL.waybillNumber}</c:when>
                    </c:choose>
                </span></h4>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <h5>创建时间</h5>
                <h4><span><fmt:formatDate value="${DETAIL.createTime}" pattern="yyyy-MM-dd HH:mm"/></span></h4>
            </div>
            <div class="col-lg-3">
                <h5>最后更新</h5>
                <h4><span><fmt:formatDate value="${DETAIL.updateTime}" pattern="yyyy-MM-dd HH:mm"/></span></h4>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 5%;">
        <div class="page-header">
            <h3>商品列表</h3>
        </div>
        <h2 class="sub-header"></h2>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>名称</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>金额</th>
                    <th>更多</th>
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
                            <a href="/commodity/detail/${item.commodityId}">查看详情</a>
                            <c:if test="${DETAIL.status == 'to_be_commented'}">
                                <a href="/order/to_confirm_receipt/${item.id}" style="margin-right: 20px;">评价</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div style="margin-top: 40px; margin-bottom: 40px;">
            <div class="col-lg-8"></div>
            <div class="col-lg-2"><h4>商品共 ${DETAIL.commodityQuantity} 件</h4></div>
            <div class="col-lg-2"><h4>合计：￥${DETAIL.totalAmount}</h4></div>
        </div>
    </div>

    <div class="row" style="margin-top: 5%;">
        <div class="page-header">
            <h3>订单处理记录</h3>
        </div>
        <h2 class="sub-header"></h2>
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th>时间</th>
                    <th>订单状态</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${RECORD}" var="item">
                    <tr>
                        <td><fmt:formatDate value="${item.time}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>
                            <c:choose>
                                <c:when test="${item.status == 'to_be_delivered'}">待发货</c:when>
                                <c:when test="${item.status == 'pending_receipt'}">待收货</c:when>
                                <c:when test="${item.status == 'to_be_commented'}">待评价</c:when>
                                <c:when test="${item.status == 'completed'}">已完成</c:when>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>


    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->


    <!-- FOOTER -->
    <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2016 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
    </footer>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="../../assets/js/vendor/holder.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>