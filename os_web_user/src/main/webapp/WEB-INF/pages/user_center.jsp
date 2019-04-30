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

            <div class="page-header" style="margin-top: 5%;">
                <h3>订单记录</h3>
            </div>
            <div class="col-lg-2">
                <h5>待发货</h5>
                <h3><span>12件</span></h3>
            </div>
            <div class="col-lg-2">
                <h5>待发货</h5>
                <h3><span>1件</span></h3>
            </div>
            <div class="col-lg-2">
                <h5>待评价</h5>
                <h3><span>3件</span></h3>
            </div>
            <div class="col-lg-2">
                <h5>退款/售后</h5>
                <h3><span>5件</span></h3>
            </div>
            <div class="col-lg-2">
                <h5>全部订单</h5>
                <h3><span>21件</span></h3>
            </div>
        </div>

    </div>


    <ul class="nav nav-tabs col-lg-12" style="margin-top: 5%;">
        <li role="presentation" class="active" id="to_be_delivered"><a>代发货</a></li>
        <li role="presentation" id="pending_receipt"><a>待收货</a></li>
        <li role="presentation" id="comment"><a>待评价</a></li>
        <li role="presentation" id="refund_and_after_sale"><a>退款/售后</a></li>
        <li role="presentation" id="all_orders"><a>全部订单</a></li>
    </ul>

    <div style="height: 110px;"></div>

    <div id="to_be_delivered_list">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>订单编号</th>
                    <th>订单状态</th>
                    <th>订单金额</th>
                    <th>运单号码</th>
                    <th>创建时间</th>
                    <th>最后更新</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${LIST}" var="item">
                    <c:if test="${item.status == 'paid'}">
                        <tr>
                            <td>${item.id}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.status == 'paid'}">待发货</c:when>
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
                    </c:if>
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
                    <th>会员昵称</th>
                    <th>购买数量</th>
                    <th>购买时间</th>
                    <th>交易状态</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1,001</td>
                    <td>Lorem</td>
                    <td>ipsum</td>
                    <td>dolor</td>
                    <td>sit</td>
                </tr>
                <tr>
                    <td>1,002</td>
                    <td>amet</td>
                    <td>consectetur</td>
                    <td>adipiscing</td>
                    <td>elit</td>
                </tr>
                <tr>
                    <td>1,003</td>
                    <td>Integer</td>
                    <td>nec</td>
                    <td>odio</td>
                    <td>Praesent</td>
                </tr>
                <tr>
                    <td>1,003</td>
                    <td>libero</td>
                    <td>Sed</td>
                    <td>cursus</td>
                    <td>ante</td>
                </tr>
                <tr>
                    <td>1,004</td>
                    <td>dapibus</td>
                    <td>diam</td>
                    <td>Sed</td>
                    <td>nisi</td>
                </tr>
                <tr>
                    <td>1,005</td>
                    <td>Nulla</td>
                    <td>quis</td>
                    <td>sem</td>
                    <td>at</td>
                </tr>
                <tr>
                    <td>1,006</td>
                    <td>nibh</td>
                    <td>elementum</td>
                    <td>imperdiet</td>
                    <td>Duis</td>
                </tr>
                <tr>
                    <td>1,007</td>
                    <td>sagittis</td>
                    <td>ipsum</td>
                    <td>Praesent</td>
                    <td>mauris</td>
                </tr>
                <tr>
                    <td>1,008</td>
                    <td>Fusce</td>
                    <td>nec</td>
                    <td>tellus</td>
                    <td>sed</td>
                </tr>
                <tr>
                    <td>1,009</td>
                    <td>augue</td>
                    <td>semper</td>
                    <td>porta</td>
                    <td>Mauris</td>
                </tr>
                <tr>
                    <td>1,010</td>
                    <td>massa</td>
                    <td>Vestibulum</td>
                    <td>lacinia</td>
                    <td>arcu</td>
                </tr>
                <tr>
                    <td>1,011</td>
                    <td>eget</td>
                    <td>nulla</td>
                    <td>Class</td>
                    <td>aptent</td>
                </tr>
                <tr>
                    <td>1,012</td>
                    <td>taciti</td>
                    <td>sociosqu</td>
                    <td>ad</td>
                    <td>litora</td>
                </tr>
                <tr>
                    <td>1,013</td>
                    <td>torquent</td>
                    <td>per</td>
                    <td>conubia</td>
                    <td>nostra</td>
                </tr>
                <tr>
                    <td>1,014</td>
                    <td>per</td>
                    <td>inceptos</td>
                    <td>himenaeos</td>
                    <td>Curabitur</td>
                </tr>
                <tr>
                    <td>1,015</td>
                    <td>sodales</td>
                    <td>ligula</td>
                    <td>in</td>
                    <td>libero</td>
                </tr>
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
                    <th>会员昵称</th>
                    <th>购买数量</th>
                    <th>购买时间</th>
                    <th>交易状态</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1,001</td>
                    <td>Lorem</td>
                    <td>ipsum</td>
                    <td>dolor</td>
                    <td>sit</td>
                </tr>
                <tr>
                    <td>1,002</td>
                    <td>amet</td>
                    <td>consectetur</td>
                    <td>adipiscing</td>
                    <td>elit</td>
                </tr>
                <tr>
                    <td>1,003</td>
                    <td>Integer</td>
                    <td>nec</td>
                    <td>odio</td>
                    <td>Praesent</td>
                </tr>
                <tr>
                    <td>1,003</td>
                    <td>libero</td>
                    <td>Sed</td>
                    <td>cursus</td>
                    <td>ante</td>
                </tr>
                <tr>
                    <td>1,004</td>
                    <td>dapibus</td>
                    <td>diam</td>
                    <td>Sed</td>
                    <td>nisi</td>
                </tr>
                <tr>
                    <td>1,005</td>
                    <td>Nulla</td>
                    <td>quis</td>
                    <td>sem</td>
                    <td>at</td>
                </tr>
                <tr>
                    <td>1,006</td>
                    <td>nibh</td>
                    <td>elementum</td>
                    <td>imperdiet</td>
                    <td>Duis</td>
                </tr>
                <tr>
                    <td>1,007</td>
                    <td>sagittis</td>
                    <td>ipsum</td>
                    <td>Praesent</td>
                    <td>mauris</td>
                </tr>
                <tr>
                    <td>1,008</td>
                    <td>Fusce</td>
                    <td>nec</td>
                    <td>tellus</td>
                    <td>sed</td>
                </tr>
                <tr>
                    <td>1,009</td>
                    <td>augue</td>
                    <td>semper</td>
                    <td>porta</td>
                    <td>Mauris</td>
                </tr>
                <tr>
                    <td>1,010</td>
                    <td>massa</td>
                    <td>Vestibulum</td>
                    <td>lacinia</td>
                    <td>arcu</td>
                </tr>
                <tr>
                    <td>1,011</td>
                    <td>eget</td>
                    <td>nulla</td>
                    <td>Class</td>
                    <td>aptent</td>
                </tr>
                <tr>
                    <td>1,012</td>
                    <td>taciti</td>
                    <td>sociosqu</td>
                    <td>ad</td>
                    <td>litora</td>
                </tr>
                <tr>
                    <td>1,013</td>
                    <td>torquent</td>
                    <td>per</td>
                    <td>conubia</td>
                    <td>nostra</td>
                </tr>
                <tr>
                    <td>1,014</td>
                    <td>per</td>
                    <td>inceptos</td>
                    <td>himenaeos</td>
                    <td>Curabitur</td>
                </tr>
                <tr>
                    <td>1,015</td>
                    <td>sodales</td>
                    <td>ligula</td>
                    <td>in</td>
                    <td>libero</td>
                </tr>
                </tbody>
            </table>
        </div>

    </div>

    <div id="refund_and_after_sale_list" style="display: none">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>订单编号</th>
                    <th>会员昵称</th>
                    <th>购买数量</th>
                    <th>购买时间</th>
                    <th>交易状态</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1,001</td>
                    <td>Lorem</td>
                    <td>ipsum</td>
                    <td>dolor</td>
                    <td>sit</td>
                </tr>
                <tr>
                    <td>1,002</td>
                    <td>amet</td>
                    <td>consectetur</td>
                    <td>adipiscing</td>
                    <td>elit</td>
                </tr>
                <tr>
                    <td>1,003</td>
                    <td>Integer</td>
                    <td>nec</td>
                    <td>odio</td>
                    <td>Praesent</td>
                </tr>
                <tr>
                    <td>1,003</td>
                    <td>libero</td>
                    <td>Sed</td>
                    <td>cursus</td>
                    <td>ante</td>
                </tr>
                <tr>
                    <td>1,004</td>
                    <td>dapibus</td>
                    <td>diam</td>
                    <td>Sed</td>
                    <td>nisi</td>
                </tr>
                <tr>
                    <td>1,005</td>
                    <td>Nulla</td>
                    <td>quis</td>
                    <td>sem</td>
                    <td>at</td>
                </tr>
                <tr>
                    <td>1,006</td>
                    <td>nibh</td>
                    <td>elementum</td>
                    <td>imperdiet</td>
                    <td>Duis</td>
                </tr>
                <tr>
                    <td>1,007</td>
                    <td>sagittis</td>
                    <td>ipsum</td>
                    <td>Praesent</td>
                    <td>mauris</td>
                </tr>
                <tr>
                    <td>1,008</td>
                    <td>Fusce</td>
                    <td>nec</td>
                    <td>tellus</td>
                    <td>sed</td>
                </tr>
                <tr>
                    <td>1,009</td>
                    <td>augue</td>
                    <td>semper</td>
                    <td>porta</td>
                    <td>Mauris</td>
                </tr>
                <tr>
                    <td>1,010</td>
                    <td>massa</td>
                    <td>Vestibulum</td>
                    <td>lacinia</td>
                    <td>arcu</td>
                </tr>
                <tr>
                    <td>1,011</td>
                    <td>eget</td>
                    <td>nulla</td>
                    <td>Class</td>
                    <td>aptent</td>
                </tr>
                <tr>
                    <td>1,012</td>
                    <td>taciti</td>
                    <td>sociosqu</td>
                    <td>ad</td>
                    <td>litora</td>
                </tr>
                <tr>
                    <td>1,013</td>
                    <td>torquent</td>
                    <td>per</td>
                    <td>conubia</td>
                    <td>nostra</td>
                </tr>
                <tr>
                    <td>1,014</td>
                    <td>per</td>
                    <td>inceptos</td>
                    <td>himenaeos</td>
                    <td>Curabitur</td>
                </tr>
                <tr>
                    <td>1,015</td>
                    <td>sodales</td>
                    <td>ligula</td>
                    <td>in</td>
                    <td>libero</td>
                </tr>
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
                    <th>会员昵称</th>
                    <th>购买数量</th>
                    <th>购买时间</th>
                    <th>交易状态</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1,001</td>
                    <td>Lorem</td>
                    <td>ipsum</td>
                    <td>dolor</td>
                    <td>sit</td>
                </tr>
                <tr>
                    <td>1,002</td>
                    <td>amet</td>
                    <td>consectetur</td>
                    <td>adipiscing</td>
                    <td>elit</td>
                </tr>
                <tr>
                    <td>1,003</td>
                    <td>Integer</td>
                    <td>nec</td>
                    <td>odio</td>
                    <td>Praesent</td>
                </tr>
                <tr>
                    <td>1,003</td>
                    <td>libero</td>
                    <td>Sed</td>
                    <td>cursus</td>
                    <td>ante</td>
                </tr>
                <tr>
                    <td>1,004</td>
                    <td>dapibus</td>
                    <td>diam</td>
                    <td>Sed</td>
                    <td>nisi</td>
                </tr>
                <tr>
                    <td>1,005</td>
                    <td>Nulla</td>
                    <td>quis</td>
                    <td>sem</td>
                    <td>at</td>
                </tr>
                <tr>
                    <td>1,006</td>
                    <td>nibh</td>
                    <td>elementum</td>
                    <td>imperdiet</td>
                    <td>Duis</td>
                </tr>
                <tr>
                    <td>1,007</td>
                    <td>sagittis</td>
                    <td>ipsum</td>
                    <td>Praesent</td>
                    <td>mauris</td>
                </tr>
                <tr>
                    <td>1,008</td>
                    <td>Fusce</td>
                    <td>nec</td>
                    <td>tellus</td>
                    <td>sed</td>
                </tr>
                <tr>
                    <td>1,009</td>
                    <td>augue</td>
                    <td>semper</td>
                    <td>porta</td>
                    <td>Mauris</td>
                </tr>
                <tr>
                    <td>1,010</td>
                    <td>massa</td>
                    <td>Vestibulum</td>
                    <td>lacinia</td>
                    <td>arcu</td>
                </tr>
                <tr>
                    <td>1,011</td>
                    <td>eget</td>
                    <td>nulla</td>
                    <td>Class</td>
                    <td>aptent</td>
                </tr>
                <tr>
                    <td>1,012</td>
                    <td>taciti</td>
                    <td>sociosqu</td>
                    <td>ad</td>
                    <td>litora</td>
                </tr>
                <tr>
                    <td>1,013</td>
                    <td>torquent</td>
                    <td>per</td>
                    <td>conubia</td>
                    <td>nostra</td>
                </tr>
                <tr>
                    <td>1,014</td>
                    <td>per</td>
                    <td>inceptos</td>
                    <td>himenaeos</td>
                    <td>Curabitur</td>
                </tr>
                <tr>
                    <td>1,015</td>
                    <td>sodales</td>
                    <td>ligula</td>
                    <td>in</td>
                    <td>libero</td>
                </tr>
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

    $("#to_be_delivered").click(function(){
        $("#to_be_delivered_list").show();
        $("#to_be_delivered").addClass("active");

        $("#pending_receipt_list").hide();
        $("#pending_receipt").removeClass("active");

        $("#comment_list").hide();
        $("#comment").removeClass("active");

        $("#refund_and_after_sale_list").hide();
        $("#refund_and_after_sale").removeClass("active");

        $("#all_orders_list").hide();
        $("#all_orders").removeClass("active");
    });

    $("#pending_receipt").click(function(){
        $("#to_be_delivered_list").hide();
        $("#to_be_delivered").removeClass("active");

        $("#pending_receipt_list").show();
        $("#pending_receipt").addClass("active");

        $("#comment_list").hide();
        $("#comment").removeClass("active");

        $("#refund_and_after_sale_list").hide();
        $("#refund_and_after_sale").removeClass("active");

        $("#all_orders_list").hide();
        $("#all_orders").removeClass("active");
    });

    $("#comment").click(function(){
        $("#to_be_delivered_list").hide();
        $("#to_be_delivered").removeClass("active");

        $("#pending_receipt_list").hide();
        $("#pending_receipt").removeClass("active");

        $("#comment_list").show();
        $("#comment").addClass("active");

        $("#refund_and_after_sale_list").hide();
        $("#refund_and_after_sale").removeClass("active");

        $("#all_orders_list").hide();
        $("#all_orders").removeClass("active");
    });

    $("#refund_and_after_sale").click(function(){
        $("#to_be_delivered_list").hide();
        $("#to_be_delivered").removeClass("active");

        $("#pending_receipt_list").hide();
        $("#pending_receipt").removeClass("active");

        $("#comment_list").hide();
        $("#comment").removeClass("active");

        $("#refund_and_after_sale_list").show();
        $("#refund_and_after_sale").addClass("active");

        $("#all_orders_list").hide();
        $("#all_orders").removeClass("active");
    });

    $("#all_orders").click(function(){
        $("#to_be_delivered_list").hide();
        $("#to_be_delivered").removeClass("active");

        $("#pending_receipt_list").hide();
        $("#pending_receipt").removeClass("active");

        $("#comment_list").hide();
        $("#comment").removeClass("active");

        $("#refund_and_after_sale_list").hide();
        $("#refund_and_after_sale").removeClass("active");

        $("#all_orders_list").show();
        $("#all_orders").addClass("active");
    });


</script>


</body>
</html>