<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</div>
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