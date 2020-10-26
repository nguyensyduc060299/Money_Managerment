<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en" dir="ltr">

<!-- soccer/project/project-ticket.html  07 Jan 2020 03:41:12 GMT -->
<head>
    <%@ include file="head.jsp" %>
</head>

<body class="font-montserrat">
<!-- Page Loader -->
<!-- <div class="page-loader-wrapper">
    <div class="loader">
    </div>
</div> -->
<%@ include file="side-bar.jsp" %>
<div id="main_content">
    <div class="page">
        <div id="page_top" class="section-body top_dark">
            <div class="container-fluid">
                <div class="page-header">
                    <div class="left">
                        <a href="javascript:void(0)" class="icon menu_toggle mr-3"><i class="fa  fa-align-left"></i></a>
                        <h1 class="page-title">FeedBack Manage</h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="section-body mt-3">
            <div class="container-fluid">
                <div class="row clearfix">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4>Total: ${total} FeedBack</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card">
                            <div class="table-responsive">
                                <table class="table table-hover table-striped table-vcenter mb-0 text-nowrap">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>User ID</th>
                                        <th>Title</th>
                                        <th>Message</th>
                                        <th>Delete</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${feedBacks}" var="feedBack">
                                        <tr>
                                            <td><span>${feedBack.id}</span></td>
                                            <td><span>${feedBack.user_id}</span></td>
                                            <td><span>${feedBack.title}</span></td>
                                            <td><span>${feedBack.content}</span></td>
                                            <td><span>${user.role}</span></td>
                                            <td>
                                                <button type="button" class="btn btn-primary" data-toggle="modal"
                                                        data-target="#sure" > Delete
                                                </button>
                                            </td>

                                            <div class="modal fade" id="sure" tabindex="-1" role="dialog">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h6 class="title" id="defaultModalLabel">Are you sure ?</h6>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <a href="${pageContext.request.contextPath}/plan/delete?id=${event.id}&start=${start}&end=${end}"
                                                               role="button" class="btn btn-danger">Delete</a>
                                                            <button type="button" class="btn btn-primary"
                                                                    data-dismiss="modal">Cancel
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </tr>
                                    </c:forEach>


                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Add New Transaction -->

    </div>
</div>
</body>
</html>