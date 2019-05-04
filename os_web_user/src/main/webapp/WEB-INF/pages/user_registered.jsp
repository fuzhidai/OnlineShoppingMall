<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"/>

<div class="container marketing">

    <div class="row" style="margin-top: 10%;">
        <h2 class="page-header">注册</h2>
        <form class="form-horizontal" action="/user/registered" method="post"  style="margin-top: 50px; margin-bottom: 50px;">
            <div id="input_name" class="form-group">
                <label for="name" class="col-sm-4 control-label">姓名</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="name" name="name" placeholder="请输入您的姓名">
                </div>
            </div>
            <div id="input_nickname" class="form-group">
                <label for="nickname" class="col-sm-4 control-label">昵称</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="nickname" name="nickname" placeholder="请输入您的姓名">
                </div>
            </div>
            <div id="input_phone" class="form-group">
                <label for="phone" class="col-sm-4 control-label">电话</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入您的电话号码">
                </div>
            </div>
            <div id="input_email" class="form-group">
                <label for="email" class="col-sm-4 control-label">邮箱</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="email" name="email" placeholder="请输入您的邮箱">
                </div>
            </div>
            <div id="input_address" class="form-group">
                <label for="address" class="col-sm-4 control-label">地址</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="address" name="address" placeholder="请输入默认收货地址">
                </div>
            </div>
            <div id="first_input_password" class="form-group">
                <label for="password" class="col-sm-4 control-label">密码</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入要设置的密码">
                </div>
            </div>
            <div id="second_input_password" class="form-group">
                <label for="password" class="col-sm-4 control-label">确认密码</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="make_password" placeholder="请再次输入要设置的密码">
                </div>
            </div>

            <div class="row" style="margin-top: 50px;">
                <div class="col-lg-5"></div>
                <button id="submit" class="btn btn-primary col-lg-2" type="submit">注 册</button>
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

<script>
    $("#make_password").change(function () {
        if ($("#password").val() != $("#make_password").val()) {
            $("#second_input_password").addClass("has-error");
        }else{
            $("#first_input_password").removeClass("has-error");
            $("#second_input_password").removeClass("has-error");
        }
    });

    $("#name").change(function () {
        if ($("#name").val().length != 0) {
            $("#input_name").removeClass("has-error");
        }
    });

    $("#phone").change(function () {
        if ($("#phone").val().length != 0) {
            $("#input_phone").removeClass("has-error");
        }
    });

    $("#address").change(function () {
        if ($("#address").val().length != 0) {
            $("#input_address").removeClass("has-error");
        }
    });

    $("#nickname").change(function () {
        if ($("#nickname").val().length != 0) {
            $("#input_nickname").removeClass("has-error");
        }
    });

    $("#email").change(function () {
        if ($("#email").val().length != 0) {
            $("#input_email").removeClass("has-error");
        }
    });

    $("#submit").click(function () {

        var canSubmit = true;

        if ($("#password").val().length == 0 || $("#password").val() != $("#make_password").val()){
            $("#first_input_password").addClass("has-error");
            $("#second_input_password").addClass("has-error");
            canSubmit = false;
        }

        if ($("#name").val().length == 0){
            $("#input_name").addClass("has-error");
            canSubmit = false;
        }

        if ($("#nickname").val().length == 0){
            $("#input_nickname").addClass("has-error");
            canSubmit = false;
        }

        if ($("#phone").val().length == 0){
            $("#input_phone").addClass("has-error");
            canSubmit = false;
        }

        if ($("#email").val().length == 0){
            $("#input_email").addClass("has-error");
            canSubmit = false;
        }

        if ($("#address").val().length == 0) {
            $("#input_address").addClass("has-error");
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
