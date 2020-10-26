<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
            <div class="card-body">
                <div class="display-3 text-muted mb-5"><i class="si si-exclamation"></i> 404</div>
                <h1 class="h3 mb-3">Oops.. You just found an error page..</h1>
                <p class="h6 text-muted font-weight-normal mb-3">We are sorry but our service is currently not available&hellip;</p>
                <a class="btn btn-primary" href="javascript:history.back()"><i class="fe fe-arrow-left mr-2"></i>Go back</a>
            </div>
        </div>        
    </div>
    <div class="auth_right full_img"></div>
</div>
</body>
</html>