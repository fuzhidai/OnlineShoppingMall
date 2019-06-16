<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="top.jsp"/>

<div class="container marketing">

    <div class="page-header" style="margin-top: 10%;">
        <h1>
            <c:choose>
                <c:when test="${TYPE == 'all'}">全部</c:when>
                <c:when test="${TYPE == 'to_be_paid'}">待支付</c:when>
                <c:when test="${TYPE == 'to_be_delivered'}">待发货</c:when>
                <c:when test="${TYPE == 'pending_receipt'}">待收货</c:when>
                <c:when test="${TYPE == 'to_be_commented'}">待评价</c:when>
                <c:when test="${TYPE == 'completed'}">已完成</c:when>
            </c:choose>
            订单
        </h1>
    </div>

    <div id="to_be_delivered_list">
        <h2 class="sub-header"></h2>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>订单编号</th>
                    <th>订单状态</th>
                    <th>订单金额</th>
                    <th>运单号码</th>
                    <th>创建时间</th>
                    <th>
                        <c:choose>
                            <c:when test="${TYPE == 'all'}">状态更新</c:when>
                            <c:when test="${TYPE == 'to_be_paid'}">结算时间</c:when>
                            <c:when test="${TYPE == 'to_be_delivered'}">支付时间</c:when>
                            <c:when test="${TYPE == 'pending_receipt'}">发货时间</c:when>
                            <c:when test="${TYPE == 'to_be_commented'}">确认收货</c:when>
                            <c:when test="${TYPE == 'completed'}">完成时间</c:when>
                        </c:choose>
                    </th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${LIST}" var="item">
                    <tr>
                        <td>${item.id}</td>
                        <td>
                            <c:choose>
                                <c:when test="${item.status == 'to_be_paid'}">待支付</c:when>
                                <c:when test="${item.status == 'to_be_delivered'}">待发货</c:when>
                                <c:when test="${item.status == 'pending_receipt'}">待收货</c:when>
                                <c:when test="${item.status == 'to_be_commented'}">待评价</c:when>
                                <c:when test="${item.status == 'completed'}">已完成</c:when>
                            </c:choose>
                        </td>
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
                            <c:choose>
                                <c:when test="${item.status == 'to_be_paid'}">
                                    <a href="/order/to_pay/${item.id}" style="margin-right: 20px;">支付</a>
                                    <a id="cancel_btn" href="#" style="margin-right: 20px;">取消</a>
                                    <form id="cancel_order" action="/order/cancel" method="post">
                                        <input type="hidden" name="type" value="list">
                                        <input type="hidden" name="id" value="${item.id}">
                                    </form>
                                </c:when>
                                <c:when test="${item.status == 'to_be_delivered'}">
                                    <a href="/order/detail/${item.id}" style="margin-right: 20px;">详情</a>
                                    <a href="#" style="margin-right: 20px;">催单</a>
                                </c:when>
                                <c:when test="${item.status == 'pending_receipt'}">
                                    <a href="/order/detail/${item.id}" style="margin-right: 20px;">详情</a>
                                    <a href="/order/to_confirm_receipt/${item.id}" style="margin-right: 20px;">收货</a>
                                </c:when>
                                <c:when test="${item.status == 'to_be_commented'}">
                                    <a href="/order/detail/${item.id}" style="margin-right: 20px;">详情</a>
                                    <a href="/order/to_confirm_receipt/${item.id}" style="margin-right: 20px;">评价</a>
                                </c:when>
                                <c:when test="${item.status == 'completed'}">
                                    <a href="/order/detail/${item.id}" style="margin-right: 20px;">详情</a>
                                </c:when>
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
</div><!-- /.container -->


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

<script>

    $("#cancel_btn").click(function () {
        $("#cancel_order").submit();
    });

</script>
</body>
</html>