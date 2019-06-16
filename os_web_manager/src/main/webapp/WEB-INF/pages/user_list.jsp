<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <c:choose>

        <c:when test="${TYPE == 'member'}">
            <div class="page-header">
                <h1>会员 管理</h1>
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
                                        <c:when test="${item.status == 'delete'}">已删除</c:when>
                                    </c:choose>
                                </td>
                                <td>${item.phone}</td>
                                <td>${item.email}</td>
                                <td><fmt:formatDate value="${item.lastLogin}" pattern="yyyy-MM-dd HH:mm"/></td>
                                <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                                <td>
                                    <a href="/backstage/user/detail/${item.id}" style="margin-right: 20px;">详情</a>

                                    <c:choose>
                                        <c:when test="${item.status == 'normal'}">
                                            <a href="/backstage/user/change_status/${item.id}/lock" style="margin-right: 20px;">锁定</a>
                                        </c:when>
                                        <c:when test="${item.status == 'lock'}">
                                            <a href="/backstage/user/change_status/${item.id}/normal" style="margin-right: 20px;">解锁</a>
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${item.status == 'delete'}">
                                            <a href="/backstage/user/change_status/${item.id}/normal" style="margin-right: 20px;">恢复</a>
                                        </c:when>
                                        <c:when test="${item.status != 'delete'}">
                                            <a href="/backstage/user/change_status/${item.id}/delete" style="margin-right: 20px;">删除</a>
                                        </c:when>
                                    </c:choose>
                                    <a href="#"></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:when>

        <c:when test="${TYPE == 'administrator'}">
            <div class="page-header">
                <h1>管理员 管理</h1>
            </div>

            <div id="to_be_delivered_list">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>姓名</th>
                            <th>权限</th>
                            <th>电话</th>
                            <th>邮箱</th>
                            <th>后台最后操作</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${LIST}" var="item">
                            <tr>
                                <td>${item.id}</td>
                                <td>${item.name}</td>
                                <td>${item.permission} 级</td>
                                <td>${item.phone}</td>
                                <td>${item.email}</td>
                                <td><fmt:formatDate value="${item.lastLogin}" pattern="yyyy-MM-dd HH:mm"/></td>
                                <td>
                                    <a href="/backstage/user/detail/${item.id}" style="margin-right: 20px;">详情</a>
                                    <a href="/backstage/log/personal/${item.id}/list">操作记录</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:when>

    </c:choose>

</div>

<jsp:include page="bottom.jsp"/>