<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en" dir="ltr">

<head>
    <%@ include file="head.jsp"%>

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
                <form:form action="${pageContext.request.contextPath}/authenticateUser" method="POST" >
                    <div class="form-group">
                        <!-- Check for login error -->
                        <c:if test="${param.error != null}">
                            <div class="single-login-2">
                                <div class="alert alert-danger col-xs-offset-1 col-xs-10">
                                    Tài khoản hoặc mật khẩu không đúng !
                                </div>
                            </div>
                        </c:if>
                        <!-- Kiểm tra có phải vừa logout -->
<%--                        <c:if test="${param.logout != null }">--%>
<%--                            <div class="single-login-2">--%>
<%--                                <div class="alert alert-success col-xs-offset-1 col-xs-10">--%>
<%--                                    Bạn đã đăng xuất!--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </c:if>--%>
                        <div class="form-group">
                            <label>UserName<span>*</span></label>
                            <input type="text" name="username" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>Password <span>*</span></label>
                            <input type="password" name="password" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-success" value="Login" >Login</button>
                        </div>
                    </div>
                </form:form>
            </div>
            <div class="text-center text-muted">
                Don't have account yet? <a href="${pageContext.request.contextPath }/register/showRegistrationForm">Sign up</a>
            </div>
        </div>
    </div>
    <div class="auth_right full_img"></div>
</div>

<script src="assets/bundles/lib.vendor.bundle.js"></script>
<script src="assets/js/core.js"></script>
</body>

</html>