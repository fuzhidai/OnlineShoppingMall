<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div class="page-header">
        <h1>
            <c:choose>
                <c:when test="${TYPE == 'all'}">全部商品</c:when>
                <c:when test="${TYPE == 'in_stock'}">已上架商品</c:when>
                <c:when test="${TYPE == 'for_sale'}">待上架商品</c:when>
            </c:choose>
        </h1>
    </div>

    <div id="to_be_delivered_list">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>名称</th>
                    <th>类别</th>
                    <th>价格</th>
                    <th>库存</th>
                    <th>销量</th>
                    <th>状态</th>
                    <th>上架时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${LIST}" var="item">

                    <tr>
                        <td>${item.id}</td>
                        <td>${item.name}</td>
                        <td>${item.type}</td>
                        <td>￥ ${item.price}</td>
                        <td>${item.stock} 件</td>
                        <td>${item.salesVolume} 件</td>
                        <td>
                            <c:choose>
                                <c:when test="${item.status == 'in_stock'}">已上架</c:when>
                                <c:when test="${item.status == 'for_sale'}">未上架</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${item.status == 'in_stock'}"><fmt:formatDate value="${item.addedTime}" pattern="yyyy-MM-dd HH:mm"/></c:when>
                                <c:when test="${item.status == 'for_sale'}">暂未上架</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <a href="/backstage/commodity/${TYPE}/detail/${item.id}" style="margin-right: 20px;">详情</a>
                            <a href="/backstage/commodity/${TYPE}/to_edit/${item.id}" style="margin-right: 20px;">修改</a>
                            <c:choose>
                                <c:when test="${item.status == 'in_stock'}"><a href="/backstage/commodity/${TYPE}/change_status/${item.id}">下架</a></c:when>
                                <c:when test="${item.status == 'for_sale'}"><a href="/backstage/commodity/${TYPE}/change_status/${item.id}">上架</a></c:when>
                            </c:choose>
                        </td>
                    </tr>

                </c:forEach>

                </tbody>
            </table>

            <div class="col-lg-offset-4 col-lg-7">

                <span>第${INFO.pageNum}页</span>
                <span style="margin-right: 10px;">/ 共${INFO.pages}页</span>
                <a href="/backstage/commodity/list/${TYPE}/${INFO.navigateFirstPage}">首页</a>
                <c:if test="${INFO.isFirstPage == false}"><a href="/backstage/commodity/list/${TYPE}/${INFO.prePage}">上一页</a></c:if>
                <c:forEach items="${INFO.navigatepageNums}" var="item">
                    <a href="/backstage/commodity/list/${TYPE}/${item}">${item}</a>
                </c:forEach>
                <c:if test="${INFO.isLastPage == false}"><a href="/backstage/commodity/list/${TYPE}/${INFO.nextPage}">下一页</a></c:if>
                <a href="/backstage/commodity/list/${TYPE}/${INFO.navigateLastPage}">末页</a>
                <span style="margin-left: 10px;">跳转到</span>
                <input id="navigate_page_num" type="number" style="width: 50px;text-align: center;"/>
                <input id="current_page_model" type="hidden" value="commodity"/>
                <input id="current_page_type" type="hidden" value="${TYPE}"/>
                <button id="navigate_page_btn">跳转</button>

            </div>
        </div>
    </div>
</div>

<jsp:include page="bottom.jsp"/>
