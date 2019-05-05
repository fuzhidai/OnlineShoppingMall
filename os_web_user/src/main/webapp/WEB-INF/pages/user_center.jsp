<%@ page import="java.util.List" %>
<%@ page import="com.aden.os.entity.CommodityOrder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.aden.os.entity.Commodity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="top.jsp"/>

<div class="container marketing">

    <div class="page-header" style="margin-top: 10%;">
        <h1>个人中心<small style="float: right; margin-top: 2%; font-size: medium;"><a href="/user/to_edit">编辑资料</a></small></h1>
    </div>

    <div class="featurette">
        <div class="row">
            <div class="col-lg-3">
                <h5>姓名</h5>
                <h4><span>${sessionScope.user.name}</span></h4>
            </div>
            <div class="col-lg-3">
                <h5>昵称</h5>
                <h4><span>${sessionScope.user.nickname}</span></h4>
            </div>
            <div class="col-lg-3">
                <h5>状态</h5>
                <h4><span>
                    <c:choose>
                        <c:when test="${sessionScope.user.status == 'normal'}">正常</c:when>
                        <c:when test="${sessionScope.user.status == 'lock'}">锁定</c:when>
                    </c:choose>
                </span></h4>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <h5>电话</h5>
                <h4><span>${sessionScope.user.phone}</span></h4>
            </div>
            <div class="col-lg-3">
                <h5>地址</h5>
                <h4><span>${sessionScope.user.address}</span></h4>
            </div>
            <div class="col-lg-3">
                <h5>邮箱</h5>
                <h4><span>${sessionScope.user.email}</span></h4>
            </div>
        </div>

        <div class="row">

            <%
                List<CommodityOrder> toBePaid = new ArrayList<>();
                List<CommodityOrder> toBeDelivered = new ArrayList<>();
                List<CommodityOrder> pendingReceipt = new ArrayList<>();
                List<CommodityOrder> comment = new ArrayList<>();
                List<CommodityOrder> completed = new ArrayList<>();
                List<CommodityOrder> all = (List<CommodityOrder>) request.getAttribute("LIST");

                for (CommodityOrder commodityOrder: all)
                {
                    switch (commodityOrder.getStatus()){
                        case "to_be_paid":
                            toBePaid.add(commodityOrder);
                            break;
                        case "to_be_delivered":
                            toBeDelivered.add(commodityOrder);
                            break;
                        case "pending_receipt":
                            pendingReceipt.add(commodityOrder);
                            break;
                        case "to_be_commented":
                            comment.add(commodityOrder);
                            break;
                        case "completed":
                            completed.add(commodityOrder);
                            default:break;
                    }
                }

                request.setAttribute("toBePaidList", toBePaid);
                request.setAttribute("toBeDelivered", toBeDelivered);
                request.setAttribute("pendingReceipt", pendingReceipt);
                request.setAttribute("comment", comment);
                request.setAttribute("completed", completed);

            %>

            <div class="page-header" style="margin-top: 5%;">
                <h3>订单记录</h3>
            </div>
            <div class="col-lg-2">
                <h5>待支付</h5>
                <h3><span>${toBePaidList.size()}件</span></h3>
            </div>
            <div class="col-lg-2">
                <h5>待发货</h5>
                <h3><span>${toBeDelivered.size()}件</span></h3>
            </div>
            <div class="col-lg-2">
                <h5>待收货</h5>
                <h3><span>${pendingReceipt.size()}件</span></h3>
            </div>
            <div class="col-lg-2">
                <h5>待评价</h5>
                <h3><span>${comment.size()}件</span></h3>
            </div>
            <div class="col-lg-2">
                <h5>已完成</h5>
                <h3><span>${completed.size()}件</span></h3>
            </div>
            <div class="col-lg-2">
                <h5>全部订单</h5>
                <h3><span>${LIST.size()}件</span></h3>
            </div>
        </div>

    </div>


    <ul class="nav nav-tabs col-lg-12" style="margin-top: 5%;">
        <li role="presentation" class="active" id="to_be_paid"><a>代支付</a></li>
        <li role="presentation" id="to_be_delivered"><a>代发货</a></li>
        <li role="presentation" id="pending_receipt"><a>待收货</a></li>
        <li role="presentation" id="comment"><a>待评价</a></li>
        <li role="presentation" id="completed"><a>已完成</a></li>
        <li role="presentation" id="all_orders"><a>全部订单</a></li>
    </ul>

    <div style="height: 110px;"></div>

    <div id="to_be_paid_list">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>订单编号</th>
                    <th>订单状态</th>
                    <th>订单金额</th>
                    <th>运单号码</th>
                    <th>创建时间</th>
                    <th>结算时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${toBePaidList}" var="item">
                    <tr>
                        <td>${item.id}</td>
                        <td>
                            <c:choose>
                                <c:when test="${item.status == 'to_be_paid'}">待支付</c:when>
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
                            <a href="/order/to_pay/${item.id}" style="margin-right: 20px;">支付</a>
                            <a id="cancel_btn" href="#" style="margin-right: 20px;">取消</a>
                            <form id="cancel_order" action="/order/cancel" method="post">
                                <input type="hidden" name="type" value="center">
                                <input type="hidden" name="id" value="${item.id}">
                            </form>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>

    <div id="to_be_delivered_list" style="display: none">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>订单编号</th>
                    <th>订单状态</th>
                    <th>订单金额</th>
                    <th>运单号码</th>
                    <th>创建时间</th>
                    <th>支付时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${toBeDelivered}" var="item">
                    <tr>
                        <td>${item.id}</td>
                        <td>
                            <c:choose>
                                <c:when test="${item.status == 'to_be_delivered'}">待发货</c:when>
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
                            <a href="/order/detail/${item.id}" style="margin-right: 20px;">详情</a>
                            <a href="#" style="margin-right: 20px;">催单</a>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>

    <div id="pending_receipt_list" style="display: none">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>订单编号</th>
                    <th>订单状态</th>
                    <th>订单金额</th>
                    <th>运单号码</th>
                    <th>创建时间</th>
                    <th>发货时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${pendingReceipt}" var="item">
                    <tr>
                        <td>${item.id}</td>
                        <td>
                            <c:choose>
                                <c:when test="${item.status == 'pending_receipt'}">待收货</c:when>
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
                            <a href="/order/detail/${item.id}" style="margin-right: 20px;">详情</a>
                            <a href="/order/to_confirm_receipt/${item.id}" style="margin-right: 20px;">收货</a>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>

    <div id="comment_list" style="display: none">

        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>订单编号</th>
                    <th>订单状态</th>
                    <th>订单金额</th>
                    <th>运单号码</th>
                    <th>创建时间</th>
                    <th>确认收货</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${comment}" var="item">
                    <tr>
                        <td>${item.id}</td>
                        <td>
                            <c:choose>
                                <c:when test="${item.status == 'to_be_commented'}">待评价</c:when>
                            </c:choose>
                        </td>
                        <td>￥ ${item.totalAmount}</td>
                        <td>${item.waybillNumber}</td>
                        <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td><fmt:formatDate value="${item.updateTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>
                            <a href="/order/detail/${item.id}" style="margin-right: 20px;">详情</a>
                            <a href="/order/to_comment_order/${item.id}" style="margin-right: 20px;">评价</a>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

    </div>

    <div id="completed_list" style="display: none">

        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>订单编号</th>
                    <th>订单状态</th>
                    <th>订单金额</th>
                    <th>运单号码</th>
                    <th>创建时间</th>
                    <th>确认收货</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${completed}" var="item">
                    <tr>
                        <td>${item.id}</td>
                        <td>
                            <c:choose>
                                <c:when test="${item.status == 'completed'}">已完成</c:when>
                            </c:choose>
                        </td>
                        <td>￥ ${item.totalAmount}</td>
                        <td>${item.waybillNumber}</td>
                        <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td><fmt:formatDate value="${item.updateTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>
                            <a href="/order/detail/${item.id}" style="margin-right: 20px;">详情</a>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

    </div>

    <div id="all_orders_list" style="display: none">

        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>订单编号</th>
                    <th>订单状态</th>
                    <th>订单金额</th>
                    <th>运单号码</th>
                    <th>创建时间</th>
                    <th>确认收货</th>
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
                        <td>${item.waybillNumber}</td>
                        <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td><fmt:formatDate value="${item.updateTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>
                            <a href="/order/detail/${item.id}" style="margin-right: 20px;">详情</a>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

    </div>

    <hr class="featurette-divider">

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

    $("#to_be_paid").click(function(){
        $("#to_be_delivered_list").hide();
        $("#to_be_delivered").removeClass("active");

        $("#pending_receipt_list").hide();
        $("#pending_receipt").removeClass("active");

        $("#comment_list").hide();
        $("#comment").removeClass("active");

        $("#completed_list").hide();
        $("#completed").removeClass("active");

        $("#all_orders_list").hide();
        $("#all_orders").removeClass("active");

        $("#to_be_paid_list").show();
        $("#to_be_paid").addClass("active");
    });

    $("#to_be_delivered").click(function(){
        $("#to_be_delivered_list").show();
        $("#to_be_delivered").addClass("active");

        $("#pending_receipt_list").hide();
        $("#pending_receipt").removeClass("active");

        $("#comment_list").hide();
        $("#comment").removeClass("active");

        $("#completed_list").hide();
        $("#completed").removeClass("active");

        $("#all_orders_list").hide();
        $("#all_orders").removeClass("active");

        $("#to_be_paid_list").hide();
        $("#to_be_paid").removeClass("active");
    });

    $("#pending_receipt").click(function(){
        $("#to_be_delivered_list").hide();
        $("#to_be_delivered").removeClass("active");

        $("#pending_receipt_list").show();
        $("#pending_receipt").addClass("active");

        $("#comment_list").hide();
        $("#comment").removeClass("active");

        $("#completed_list").hide();
        $("#completed").removeClass("active");

        $("#all_orders_list").hide();
        $("#all_orders").removeClass("active");

        $("#to_be_paid_list").hide();
        $("#to_be_paid").removeClass("active");
    });

    $("#comment").click(function(){
        $("#to_be_delivered_list").hide();
        $("#to_be_delivered").removeClass("active");

        $("#pending_receipt_list").hide();
        $("#pending_receipt").removeClass("active");

        $("#comment_list").show();
        $("#comment").addClass("active");

        $("#completed_list").hide();
        $("#completed").removeClass("active");

        $("#all_orders_list").hide();
        $("#all_orders").removeClass("active");

        $("#to_be_paid_list").hide();
        $("#to_be_paid").removeClass("active");
    });

    $("#completed").click(function(){
        $("#to_be_delivered_list").hide();
        $("#to_be_delivered").removeClass("active");

        $("#pending_receipt_list").hide();
        $("#pending_receipt").removeClass("active");

        $("#comment_list").hide();
        $("#comment").removeClass("active");

        $("#completed_list").show();
        $("#completed").addClass("active");

        $("#all_orders_list").hide();
        $("#all_orders").removeClass("active");

        $("#to_be_paid_list").hide();
        $("#to_be_paid").removeClass("active");
    });

    $("#all_orders").click(function(){
        $("#to_be_delivered_list").hide();
        $("#to_be_delivered").removeClass("active");

        $("#pending_receipt_list").hide();
        $("#pending_receipt").removeClass("active");

        $("#comment_list").hide();
        $("#comment").removeClass("active");

        $("#completed_list").hide();
        $("#completed").removeClass("active");

        $("#all_orders_list").show();
        $("#all_orders").addClass("active");

        $("#to_be_paid_list").hide();
        $("#to_be_paid").removeClass("active");
    });

    $("#cancel_btn").click(function () {
        $("#cancel_order").submit();
    });

</script>


</body>
</html>