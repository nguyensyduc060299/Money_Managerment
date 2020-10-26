<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en" dir="ltr">


<head>
<meta charset="UTF-8">
</head>

<body >
<!-- Page Loader -->
<div class="page-loader-wrapper">
    <div class="loader">
    </div>
</div>

<div >

    <div id="header_top" class="header_top">
        <div class="container">
            <div class="hleft">
                <a class="header-brand" href="${pageContext.request.contextPath}/"><img src="/assets/images/logo.png" width="30" height="30"></a>
                <div class="dropdown">
                    <a href="javascript:void(0)" class="nav-link user_btn"><img class="avatar" src="/assets/images/user.png" alt="" data-toggle="tooltip" data-placement="right" title="User Menu"/></a>
                </div>
            </div>
            <div class="hright">
                <div class="dropdown">
                    <a href="javascript:void(0)" class="nav-link icon menu_toggle"><i class="fa  fa-align-left"></i></a>
                </div>            
            </div>
        </div>
    </div>
    <div class="user_div row">
        <div class="col col-lg-12">
            <h5 class="brand-name mb-4">Profile</h5>
        </div>
        <div class="row col-md-auto left">
            <div class="col-md-auto">
                <button type="button" class="btn btn-primary">Edit</button>
            </div>
            <div class="col-md-auto">
                <a role="button" href="${pageContext.request.contextPath}/logout" class="btn btn-danger">Logout</a>
            </div>           
        </div>
        <hr>
    </div>

    <div id="left-sidebar" class="sidebar ">
        <h5 class="brand-name">Principal</h5>
        <nav id="left-sidebar-nav" class="sidebar-nav">
            <ul class="metismenu">
                <li class="g_heading"></li>
                <security:authorize access="hasRole('MEMBER')">
                <li><a href="${pageContext.request.contextPath}/wallet"><i class="fa fa-list-ol"></i><span>Wallet List</span></a></li>
                <li><a href="${pageContext.request.contextPath}/transaction?walletid=&categoryid=0&start=&end="><i class="fa fa-list-ul"></i><span>Transaction List</span></a></li>
                <li><a href="${pageContext.request.contextPath}/plan?start=&end="><i class="fa fa-check-square-o"></i><span>Plan List</span></a></li>
                <li><a href="${pageContext.request.contextPath}/plan/calender"><i class="fa fa-calendar"></i><span>Calendar</span></a></li>
                <li><a href="${pageContext.request.contextPath}/wallet/contact"><i class="fa fa-tag"></i><span>ContactUs</span></a></li>
                    </security:authorize>
                <security:authorize access="hasRole('ADMIN')">
                <li><a href="${pageContext.request.contextPath}/admin/user-manage/"><i class="fa fa-list-ol"></i><span>List User</span></a></li>
                <li><a href="${pageContext.request.contextPath}/admin/feedback-manage/"><i class="fa fa-check-square-o"></i><span>Feedback</span></a></li>
                </security:authorize>
            </ul>
        </nav>        
    </div>
</div>
</body>

<!--scrip-->

</html>
