<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="top.jsp"/>

<div class="container marketing">

    <div class="row" style="margin-top: 10%;">
        <h2 class="page-header">订单评价<small style="margin-left: 20px;">${DETAIL}</small></h2>

        <form class="form-horizontal" action="/order/comment_commodity" method="post"  style="margin-top: 50px; margin-bottom: 50px;">
            <input type="hidden" name="orderId" VALUE="${ORDER_ID}">
            <div class="form-group">
                <label for="shelf_category" class="col-sm-3 control-label">评级</label>
                <div class="col-sm-6" id="shelf_category">
                    <select name="grade" class="form-control">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="content" class="col-sm-3 control-label">商品评价</label>
                <div class="col-sm-6">
                    <textarea name="content" class="form-control" rows="6" id="content" placeholder="请输入订单的商品评价"></textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="image" class="col-sm-3 control-label">评价图片</label>
                <div class="col-sm-6">
                    <input type="file" id="image" name="image" placeholder="Password">
                </div>
            </div>

            <div class="row" style="margin-top: 50px;">
                <div class="col-lg-5"></div>
                <button id="submit" class="btn btn-primary col-lg-2" type="submit">提交评价</button>
                <div class="col-lg-5"></div>

            </div>
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

<script src="/js/jquery.md5.manager.js"></script>

</body>
</html>