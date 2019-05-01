<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"/>

<div class="container marketing">

    <div class="page-header" style="margin-top: 10%;">
        <h1>${DETAIL.name}</h1>
    </div>

    <div class="row featurette">
        <div class="col-md-7 col-md-push-5">
            <h1>￥${DETAIL.price} <h4><span class="text-muted">销量 ${DETAIL.salesVolume} | 评论 23 | 库存 ${DETAIL.stock}</span></h4></h1>
            <p class="lead" style="margin-top: 8%; height: 125px;">
                ${DETAIL.introduction}
            </p>

            <form action="/order/buy" method="post">

                <input type="hidden" name="commodityId" value="${DETAIL.id}">
                <input type="hidden" name="commodityName" value="${DETAIL.name}">
                <input type="hidden" name="commodityPrice" value="${DETAIL.price}">
                <input type="hidden" id="type" name="type">


                <div class="row">
                    <div class="col-lg-3">
                        <div class="input-group">
                        <span class="input-group-btn">
                            <button id="minus_number_button" class="btn btn-default" type="button">-</button>
                        </span>
                            <input id="buy_commodity_count" name="commodityQuantity" type="number" class="form-control" style="text-align: center;" value="1">
                            <span class="input-group-btn">
                            <button id="plus_number_button" class="btn btn-default" type="button">+</button>
                        </span>
                        </div>
                    </div>
                    <div class="col-lg-9"></div>
                </div>

                <div>
                    <div class="col-lg-6"></div>
                    <div class="col-lg-1"></div>
                    <button id="buy_now_btn" class="btn btn-default col-lg-2" type="submit">立即购买</button>
                    <div class="col-lg-1"></div>
                    <button id="add_cart_btn" class="btn btn-default col-lg-2" type="submit">加入购物车</button>
                </div>

            </form>
        </div>
        <div class="col-md-5 col-md-pull-7">
            <img class="featurette-image img-responsive center-block" src="test.jpg" alt="Generic placeholder image">
        </div>
    </div>

    <ul class="nav nav-tabs col-lg-12" style="margin-top: 5%;">
        <li role="presentation" class="active" id="mall_detail"><a>商品详情</a></li>
        <li role="presentation" id="mall_comment"><a>商品评论</a></li>
        <li role="presentation" id="mall_sales_record"><a>销售记录</a></li>
    </ul>

    <div style="height: 110px;"></div>


    <div id="mall_detail_list">
        ${DETAIL.detailedIntroduction}
    </div>

    <div id="mall_comment_list" style="display: none">
        商品评论
    </div>

    <!-- 销售记录列表 -->
    <div id="mall_sales_record_list" style="display: none">

        <h2 class="sub-header">销售记录</h2>
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

    $("#buy_now_btn").click(function () {
        $("#type").val("now");
    });

    $("#add_cart_btn").click(function () {
        $("#type").val("cart");
    });

    $("#mall_detail").click(function(){
        $("#mall_detail_list").show();
        $("#mall_detail").addClass("active");

        $("#mall_sales_record_list").hide();
        $("#mall_sales_record").removeClass("active");

        $("#mall_comment_list").hide();
        $("#mall_comment").removeClass("active");
    });


    $("#mall_comment").click(function(){
        $("#mall_comment_list").show();
        $("#mall_comment").addClass("active");

        $("#mall_detail_list").hide();
        $("#mall_detail").removeClass("active");

        $("#mall_sales_record_list").hide();
        $("#mall_sales_record").removeClass("active");
    });

    $("#mall_sales_record").click(function(){
        $("#mall_sales_record_list").show();
        $("#mall_sales_record").addClass("active");

        $("#mall_comment_list").hide();
        $("#mall_comment").removeClass("active");

        $("#mall_detail_list").hide();
        $("#mall_detail").removeClass("active");
    });

    $("#plus_number_button").click(function () {
        var count = parseInt($("#buy_commodity_count").val());
        $("#buy_commodity_count").val(count+1);
    });

    $("#minus_number_button").click(function () {
        var count = parseInt($("#buy_commodity_count").val());
        if (count > 0) {
            $("#buy_commodity_count").val(count-1);
        }
    })

</script>

</body>
</html>
