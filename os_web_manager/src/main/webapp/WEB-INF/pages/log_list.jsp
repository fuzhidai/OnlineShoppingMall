<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div class="page-header">
        <h1>
            <c:choose>
                <c:when test="${TYPE == 'operating'}">操作</c:when>
                <c:when test="${TYPE == 'system'}">系统</c:when>
                <c:when test="${TYPE == 'login'}">登陆</c:when>
                <c:when test="${TYPE == 'personal'}">个人</c:when>
            </c:choose>
            日志
        </h1>
    </div>

    <div id="to_be_delivered_list">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>时间</th>
                    <th>模块</th>
                    <th>操作人</th>
                    <th>操作</th>
                    <th>结果</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${LIST}" var="item">

                    <tr>
                        <td><fmt:formatDate value="${item.time}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>${item.module}</td>
                        <td>${item.operator}</td>
                        <td>${item.operating}</td>
                        <td>${item.result}</td>
                    </tr>

                </c:forEach>

                </tbody>
            </table>

            <div class="col-lg-offset-4 col-lg-7">

                <span>第${INFO.pageNum}页</span>
                <span style="margin-right: 10px;">/ 共${INFO.pages}页</span>

                <c:if test="${TYPE != 'personal'}">
                    <a href="/backstage/log/list/${TYPE}/${INFO.navigateFirstPage}">首页</a>
                    <c:if test="${INFO.isFirstPage == false}"><a href="/backstage/log/list/${TYPE}/${INFO.prePage}">上一页</a></c:if>
                    <c:forEach items="${INFO.navigatepageNums}" var="item">
                        <a href="/backstage/log/list/${TYPE}/${item}">${item}</a>
                    </c:forEach>
                    <c:if test="${INFO.isLastPage == false}"><a href="/backstage/log/list/${TYPE}/${INFO.nextPage}">下一页</a></c:if>
                    <a href="/backstage/log/list/${TYPE}/${INFO.navigateLastPage}">末页</a>
                </c:if>

                <c:if test="${TYPE == 'personal'}">
                    <a href="/backstage/log/${TYPE}/${sessionScope.user.id}/list/${INFO.navigateFirstPage}">首页</a>
                    <c:if test="${INFO.isFirstPage == false}"><a href="/backstage/log/${TYPE}/${sessionScope.user.id}/list/${INFO.prePage}">上一页</a></c:if>
                    <c:forEach items="${INFO.navigatepageNums}" var="item">
                        <a href="/backstage/log/${TYPE}/${sessionScope.user.id}/list/${item}">${item}</a>
                    </c:forEach>
                    <c:if test="${INFO.isLastPage == false}"><a href="/backstage/log/${TYPE}/${sessionScope.user.id}/list/${INFO.nextPage}">下一页</a></c:if>
                    <a href="/backstage/log/${TYPE}/${sessionScope.user.id}/list/${INFO.navigateLastPage}">末页</a>
                </c:if>

                <span style="margin-left: 10px;">跳转到</span>
                <input id="navigate_page_num" type="number" style="width: 50px;text-align: center;"/>
                <input id="current_page_model" type="hidden" value="log"/>
                <input id="current_page_type" type="hidden" value="${TYPE}"/>
                <input id="current_user_id" type="hidden" value="${sessionScope.user.id}"/>
                <button id="navigate_page_btn">跳转</button>

            </div>
        </div>
    </div>
</div>

<jsp:include page="bottom.jsp"/>