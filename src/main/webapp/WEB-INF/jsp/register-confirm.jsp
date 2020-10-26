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
                <h5>Đăng ký thành công</h5>
                <h6><a href="${pageContext.request.contextPath }/login" title="Login">Đăng nhập ngay nào</a></h6>
            </div>
        </div>
    </div>
    <div class="auth_right full_img"></div>
</div>

<script src="assets/bundles/lib.vendor.bundle.js"></script>
<script src="assets/js/core.js"></script>
</body>

<!-- soccer/project/register.jsp  07 Jan 2020 03:42:43 GMT -->
</html>