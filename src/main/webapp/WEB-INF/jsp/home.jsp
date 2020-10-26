<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en" dir="ltr">

<!-- soccer/project/register.jsp  07 Jan 2020 03:42:43 GMT -->
<head>
    <%@ include file="head.jsp"%>/>


</head>
<body class="font-montserrat">

<div class="auth">
    <div class="auth_left">
        <div class="card">
            <div class="text-center mb-2">
                <a class="header-brand" href="login.jsp"><img src="/assets/images/logo.png" alt="Wallet Online" width="100"
                                                              height="100"></a>
            </div>
            <div class="card-body">
                <h4>Welcome To Website</h4>
                <p><b>Where you can manage your principal</b></p>
                <security:authorize access="isAnonymous()">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-5">
                        <a class="btn btn-success" href="${pageContext.request.contextPath }/login" role="button">  Login  </a>
                    </div>

                    <div class="col-md-5">
                        <a class="btn btn-primary" href="${pageContext.request.contextPath }/register/showRegistrationForm" role="button">  Register  </a>
                    </div>

                </div>
                </security:authorize>
                <security:authorize access="isAuthenticated()">
                    <h3>Xin chào <security:authentication property="principal.username"/></h3>
                <security:authorize access="hasRole('MEMBER')">
                    <a class="btn btn-success" href="${pageContext.request.contextPath }/wallet" role="button"> Your Wallet </a>
                </security:authorize>
                <security:authorize access="hasRole('ADMIN')">
                    <a class="btn btn-success" href="${pageContext.request.contextPath }/admin/user-manage/" role="button"> Manage Page </a>
                </security:authorize>
                    <a role="button" href="${pageContext.request.contextPath}/logout" class="btn btn-danger">Logout</a>
                </security:authorize>
            </div>
        </div>
    </div>
    <div class="auth_right full_img">
    </div>
</div>
</body>
</html>