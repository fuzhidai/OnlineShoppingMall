<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"/>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img class="first-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="First slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>Example headline.</h1>
                    <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
                    <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img class="second-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Second slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>Another example headline.</h1>
                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img class="third-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Third slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>One more for good measure.</h1>
                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
                </div>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<div class="container marketing">

    <div class="row">
        <div class="col-lg-2"></div>
        <div class="col-lg-8">
            <div class="input-group">
                <div class="input-group-btn">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">全部 <span class="caret"></span></button>
                    <ul class="dropdown-menu">
                        <li><a href="#">全部</a></li>
                        <li><a href="#">算法</a></li>
                        <li><a href="#">编程语言</a></li>
                        <li><a href="#">操作系统</a></li>
                        <li><a href="#">计算机网络</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </div>
                <input type="text" class="form-control" aria-label="...">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                </span>
            </div>
        </div>
        <div class="col-lg-2"></div>
    </div>

    <div class="page-header">
        <h1>热门排行<small style="float: right; margin-top: 2%; font-size: medium;">查看更多</small></h1>
    </div>
    <!-- Three columns of text below the carousel -->
    <div class="row">
        <div class="col-lg-offset-1 col-lg-5">
            <c:forEach var="index" begin="0" end="4">
                <h3 class="col-lg-offset-1">
                    <span class="col-lg-2">${index+1}.</span>
                    <small class="col-lg-7" style="margin-top: 2%"><strong><a href="/commodity/detail/${HOT_LIST[index].id}">${HOT_LIST[index].name}</a></strong></small>
                    <small><span>月销 <strong>${HOT_LIST[index].salesVolume}</strong> 件</span></small>
                </h3>
            </c:forEach>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-6">
            <c:forEach var="index" begin="5" end="9">
                <h3 class="col-lg-offset-1">
                    <span class="col-lg-2">${index+1}.</span>
                    <small class="col-lg-7" style="margin-top: 2%"><strong><a href="/commodity/detail/${HOT_LIST[index].id}">${HOT_LIST[index].name}</a></strong></small>
                    <small><span>月销 <strong>${HOT_LIST[index].salesVolume}</strong> 件</span></small>
                </h3>
            </c:forEach>
        </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->

    <c:forEach var="index" begin="0" end="${(LIST.size())/3-1}">

        <div class="page-header">
            <h1>${LIST[index*3].type}<small style="float: right; margin-top: 2%; font-size: medium;"><a href="/commodity/list_type/${LIST[index*3].typeId}">查看更多</a></small></h1>
        </div>
        <div class="row">

            <c:forEach items="${LIST}" var="item" begin="${index*3}" end="${index*3+2}">

                <div class="col-lg-4">
                    <img src="/pic/${item.image}" alt="Generic placeholder image" width="100%" height="350px">
                    <h2>${item.name}</h2>
                    <p style="height: 80px;">${item.introduction}</p>
                    <p>
                        <form action="/order/buy" method="post">

                            <input type="hidden" name="commodityId" value="${item.id}">
                            <input type="hidden" name="commodityName" value="${item.name}">
                            <input type="hidden" name="commodityPrice" value="${item.price}">
                            <input type="hidden" name="commodityQuantity" value="1">
                            <input type="hidden" id="type" name="type" value="now">

                            <button id="buy_now_btn" class="btn btn-default" type="submit" style="margin-right: 30px;">立即购买</button>
                            <a class="btn btn-default" href="/commodity/detail/${item.id}" role="button">详情 &raquo;</a>
                </form>
                    </p>
                </div>

            </c:forEach>

        </div>

    </c:forEach>

    <hr class="featurette-divider">

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
