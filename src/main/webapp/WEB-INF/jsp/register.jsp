<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en" dir="ltr">

<!-- soccer/project/register.jsp  07 Jan 2020 03:42:43 GMT -->
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
                <form:form action="${pageContext.request.contextPath}/register/processRegistrationForm"
                           modelAttribute="newUser" method="POST">
                    <div class="card-title">Create new account</div>
                    <div class="form-group">
                            <%--                    <label class="form-label">Name</label>--%>
                        <input type="text" class="form-control" placeholder="Enter name" name="userName">
                    </div>
                    <div class="form-group">
                        <!-- <label class="form-label">Email address</label> -->
                        <input type="email" class="form-control" placeholder="Enter email" name="email">
                    </div>
                    <div class="form-group">
                        <!-- <label class="form-label">Password</label> -->
                        <input type="password" class="form-control" placeholder="Password" name="password">
                    </div>
                    <div class="form-group">
                        <!-- <label class="form-label">Password</label> -->
                        <input type="text" class="form-control" placeholder="First Name" name="firstName">
                    </div>
                    <div class="form-group">
                        <!-- <label class="form-label">Password</label> -->
                        <input type="text" class="form-control" placeholder="Password" name="lastName">
                    </div>
                    <div class="form-group">
                        <label class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input"/>
                            <span class="custom-control-label">Agree the <a href="#">terms and policy</a></span>
                        </label>
                    </div>
                    <div class="form-footer">
                        <button type="submit" class="btn btn-primary btn-block">Create new account</button>
                    </div>
                </form:form>
            </div>
            <div class="text-center text-muted">
                Already have account? <a href="${pageContext.request.contextPath }/login">Sign in</a>
            </div>
        </div>
    </div>
    <div class="auth_right full_img"></div>
</div>


</body>

<!-- soccer/project/register.jsp  07 Jan 2020 03:42:43 GMT -->
</html>