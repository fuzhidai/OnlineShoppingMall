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

    $("#input_waybillNumber_btn").click(function () {
        $("#page_title").val("填写运单号");
        $("#make_sure_info").hide();
        $("#input_waybillNumber").show();
    });

    $("#order_commodity_info").click(function () {
        $("#order_commodity_info_list").show();
        $("#order_commodity_info").addClass("active");

        $("#order_deal_record_list").hide();
        $("#order_deal_record").removeClass("active");

        $("#order_evaluation_list").hide();
        $("#order_evaluation").removeClass("active");
    });

    $("#order_deal_record").click(function () {
        $("#order_commodity_info_list").hide();
        $("#order_commodity_info").removeClass("active");

        $("#order_deal_record_list").show();
        $("#order_deal_record").addClass("active");

        $("#order_evaluation_list").hide();
        $("#order_evaluation").removeClass("active");
    });

    $("#order_evaluation").click(function () {
        $("#order_commodity_info_list").hide();
        $("#order_commodity_info").removeClass("active");

        $("#order_deal_record_list").hide();
        $("#order_deal_record").removeClass("active");

        $("#order_evaluation_list").show();
        $("#order_evaluation").addClass("active");
    });

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

    $("#navigate_page_btn").click(function () {
        if ($("#current_user_id").val() != null){
            var current_user_id = $("#current_user_id").val();
        }
        var page_num = $("#navigate_page_num").val();
        var page_type = $("#current_page_type").val();
        var page_model = $("#current_page_model").val();
        if (page_type !== "personal" && page_num != null && page_num > 0){
            window.location.href = "/backstage/"+ page_model +"/list/"+ page_type +"/" + page_num;
        }else{
            window.location.href = "/backstage/"+ page_model + "/" + page_type + "/" + current_user_id + "/list/" + page_num;
        }
    })


</script>
</body>
</html>