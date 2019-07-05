<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"/>

<div class="container marketing">

    <div class="row" style="margin-top: 10%;">
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
                </div><!-- /btn-group -->
                <input type="text" class="form-control" aria-label="...">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                </span>
            </div><!-- /input-group -->
        </div><!-- /.col-lg-6 -->
        <div class="col-lg-2"></div>
    </div><!-- /.row -->

    <div class="page-header">
        <h1>${LIST[0].type}</h1>
    </div>

    <div class="row">

        <c:forEach items="${LIST}" var="item">

            <div class="col-lg-4">
                <img src="/pic/${item.image}" alt="Generic placeholder image" width="100%" height="350px">
                <h2>${item.name}</h2>
                <p style="height: 80px;">${item.introduction}</p>
                <p>
                    <a class="btn btn-default" href="#" role="button" style="margin-right: 30px;">立即购买</a>
                    <a class="btn btn-default" href="/commodity/detail/${item.id}" role="button">详情 &raquo;</a>
                </p>
            </div>

        </c:forEach>

    </div>

    <div class="row">
        <div class="col-lg-4"></div>
        <nav aria-label="Page navigation" class="col-lg-4">
            <ul class="pagination">
                <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
        <div class="col-lg-4"></div>
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
</body>
</html>
