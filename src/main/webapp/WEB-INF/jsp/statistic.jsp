<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en" dir="ltr">

<!-- soccer/project/app-contact.html  07 Jan 2020 03:40:20 GMT -->
<head>
    <%@ include file="head.jsp"%>
</head>

<body class="font-montserrat">
<%@ include file="side-bar.jsp" %>

<div id="main_content">
    <div class="page">
        <div id="page_top" class="section-body top_dark">
            <div class="container-fluid">
                <div class="page-header">
                    <div class="left">
                        <a href="javascript:void(0)" class="icon menu_toggle mr-3"><i class="fa  fa-align-left"></i></a>
                        <h1 class="page-title">Statistic</h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="section-body mt-3">
            <div class="container-fluid">
                <div class="row clearfix">
                    <div class="col-lg-12">
                        <br>
                        <h3> Hi ${user.firstName} ${user.lastName}</h3>
                        <br>
                    </div>
                </div>
            </div>
        </div>
        <div class="section-body">
            <div class="container-fluid">
                <div class="tab-content">
                    <div class="card">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/assets/bundles/lib.vendor.bundle.js"></script>
<script src="/assets/bundles/sweetalert.bundle.js"></script>
<script src="/assets/plugins/dropify/js/dropify.min.js"></script>
<script src="/assets/js/core.js"></script>
<script src="/assets/js/page/sweetalert.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#btn-send").click(function () {
            alert("Send FeedBack Success")
        })
    })
</script>
</body>
</html>
