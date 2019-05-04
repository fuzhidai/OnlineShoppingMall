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
        </div>
    </div>
</div>

<jsp:include page="bottom.jsp"/>