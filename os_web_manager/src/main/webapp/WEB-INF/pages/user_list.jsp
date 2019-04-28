<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div class="page-header">
        <h1>会员管理</h1>
    </div>

    <div id="to_be_delivered_list">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>状态</th>
                    <th>电话</th>
                    <th>邮箱</th>
                    <th>最后登录</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${LIST}" var="item">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.name}</td>
                        <td>
                            <c:choose>
                                <c:when test="${item.status == 'normal'}">正常</c:when>
                                <c:when test="${item.status == 'lock'}">锁定</c:when>
                            </c:choose>
                        </td>
                        <td>${item.phone}</td>
                        <td>${item.email}</td>
                        <td><fmt:formatDate value="${item.lastLogin}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>
                            <a href="#" style="margin-right: 20px;">详情</a>
                            <a href="#" style="margin-right: 20px;">
                                <c:choose>
                                    <c:when test="${item.status == 'normal'}">锁定</c:when>
                                    <c:when test="${item.status == 'lock'}">解锁</c:when>
                                </c:choose>
                            </a>
                            <a href="#">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
