<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="top.jsp"/>

<div class="container marketing">

    <div class="page-header" style="margin-top: 10%;">
        <h1>购物车</h1>
    </div>

    <div id="to_be_delivered_list">
        <h2 class="sub-header"></h2>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>名称</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>金额</th>
                    <th>操作</th>
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
                            <a href="/order/increase/${DETAIL.userId}/${item.commodityId}" style="margin-right: 20px;">增加</a>
                            <a href="/order/decrease/${DETAIL.userId}/${item.commodityId}" style="margin-right: 20px;">减少</a>
                            <a href="/order/remove/${DETAIL.userId}/${item.commodityId}" style="margin-right: 20px;">移除</a>
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
        <div class="col-lg-2"><h4>合计：￥<fmt:formatNumber value="${DETAIL.totalAmount}" pattern="#0.00"/></h4></div>
        <form action="/order/to_pay_cart/${DETAIL.userId}" method="get">
            <button class="btn btn-primary col-lg-2" type="submit">提交订单</button>
        </form>
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
</body>
</html>