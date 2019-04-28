<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"/>

<div class="container marketing">

    <div class="row" style="margin-top: 10%;">
        <h2 class="page-header">登陆</h2>
        <form class="form-horizontal" action="/user/login" method="post"  style="margin-top: 50px; margin-bottom: 50px;">
            <div id="input_phone" class="form-group">
                <label for="phone" class="col-sm-4 control-label">电话</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入您的电话号码">
                </div>
            </div>
            <div id="input_password" class="form-group">
                <label for="password" class="col-sm-4 control-label">密码</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入您的密码">
                </div>
            </div>
            <div class="row" style="margin-top: 50px;">
                <div class="col-lg-5"></div>
                <button id="submit" class="btn btn-primary col-lg-2" type="submit">登 陆</button>
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

<script src="/js/jquery.md5.js"></script>

<script>

    $("#phone").change(function () {
        if ($("#name").val().length != 0) {
            $("#input_name").removeClass("has-error");
        }
    });

    $("#password").change(function () {
        if ($("#password").val().length != 0) {
            $("#input_phone").removeClass("has-error");
        }
    });


    $("#submit").click(function () {

        var canSubmit = true;

        if ($("#phone").val().length == 0){
            $("#input_phone").addClass("has-error");
            canSubmit = false;
        }

        if ($("#password").val().length == 0){
            $("#input_password").addClass("has-error");
            canSubmit = false;
        }

        if (canSubmit) {
            var md5 = $.md5($("#password").val());
            $("#password").val(md5);
        }

        return canSubmit;
    })
</script>

</body>
</html>