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
                        <h1 class="page-title">User Manage</h1>
                    </div>
                    <div class="right">
                        <div class="input-icon xs-hide mr-4">
                        </div>
                        <div>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addevent">
                                Add
                            </button>
                        </div>
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
                                <h4>Total: ${totaluser} User</h4>
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
                                        <th>Name</th>
                                        <th>Username</th>
                                        <th>Email</th>
                                        <th>Role</th>
                                        <th>Edit</th>
                                        <th>Delete</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${users}" var="user">
                                        <tr>
                                            <td><span>${user.id}</span></td>
                                            <td><span>${user.firstName} ${user.lastName}</span></td>
                                            <td><span>${user.userName}</span></td>
                                            <td><span>${user.email}</span></td>
                                            <td><span>${user.role}</span></td>
                                            <td>
                                                <button type="button" class="btn btn-primary btn-edit"
                                                        data-toggle="modal"
                                                        data-target="#editevent" id="${event.id}">Edit
                                                </button>
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-primary" data-toggle="modal"
                                                        data-target="#sure" id="${event.id}"> Delete
                                                </button>
                                            </td>
                                            <div class="modal fade" id="editevent" tabindex="-1" role="dialog">
                                                <div class="modal-dialog" role="document">
                                                    <form:form action="${pageContext.request.contextPath}/admin/user-manage"
                                                               modelAttribute="user" method="POST">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h6 class="title" id="defaultModalLabel2">Edit
                                                                    Event</h6>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="row clearfix">
                                                                    <div class="col-12">
                                                                        <div class="form-group ">
                                                                            <input type="text" class="form-control"
                                                                                   placeholder="Name" name="name"
                                                                                   value="${event.name}">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12">
                                                                        <!-- <div class="form-group">
                                                                            <textarea class="form-control" placeholder="Description"></textarea>
                                                                        </div> -->
                                                                        <div class="form-group ">
                                                                            <select class="form-control"
                                                                                    data-placeholder="Choose a color..."
                                                                                    name="btn"
                                                                                    data-value="${event.btn}">
                                                                                <option value="success">Success</option>
                                                                                <option value="danger">Danger</option>
                                                                                <option value="info">Info</option>
                                                                                <option value="primary">Primary</option>
                                                                                <option value="warning">Warning</option>
                                                                            </select>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <input type="text" class="form-control"
                                                                                   data-provide="datepicker"
                                                                                   placeholder="Date"
                                                                                   value="${event.date}"
                                                                                   name="date" id="timeedit">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12">
                                                                        <div class="form-group">
                                                                            <textarea class="form-control"
                                                                                      placeholder="Note"
                                                                                      name="note">${event.note}</textarea>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-success"
                                                                        value="Edit">Edit
                                                                </button>
                                                                <button type="button" class="btn btn-default"
                                                                        data-dismiss="modal">Close
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </form:form>
                                                </div>
                                            </div>
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
        <div class="modal fade" id="addevent" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h6 class="title" id="defaultModalLabel5">Add Event</h6>
                    </div>
                    <div class="modal-body">
                        <div class="row clearfix">
                            <div class="col-12">
                                <div class="form-group ">
                                    <input type="text" class="form-control"
                                           placeholder="Name" name="name" id="name">
                                </div>
                            </div>
                            <div class="col-12">
                                <!-- <div class="form-group">
                                    <textarea class="form-control" placeholder="Description"></textarea>
                                </div> -->
                                <div class="form-group ">
                                    <select class="form-control"
                                            data-placeholder="Choose a color..."
                                            name="btn" id="btn">
                                        <option value="" disabled selected>Mức Độ</option>
                                        <option value="success">Success</option>
                                        <option value="danger">Danger</option>
                                        <option value="info">Info</option>
                                        <option value="primary">Primary</option>
                                        <option value="warning">Warning</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control"
                                           data-provide="datepicker"
                                           placeholder="Date"
                                           name="date" id="time">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <textarea class="form-control" placeholder="Note" name="note" id="note"></textarea>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success"
                                value="Add" id="btn-add">Add
                        </button>
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">Close
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        $("#btn-add").click(function () {
            var name = $("#name").val();
            var btn = $("#btn").val();
            var note = $("#note").val();
            var date = $("#time").val();
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/plan/add",
                data: {
                    name: name,
                    btn: btn,
                    note: note,
                    date: date
                },

                success: function (data) {
                    alert("Add New Event Sucessful");
                    location.reload();
                },
                error: function (e) {
                    console.log(e);
                    alert("Add fail");
                }
            });
        })

        $('#time').datepicker({format: 'yyyy-mm-dd'});
        $("#timeedit").datepicker({format: 'yyyy-mm-dd'});
        $('#start_date').datepicker({format: 'yyyy-mm-dd'});
        $('#end_date').datepicker({format: 'yyyy-mm-dd'});

        $("#search").click(function () {
            var start = $("#start_date").val();
            var end = $("#end_date").val();
            window.location = "${pageContext.request.contextPath}/plan?&start=" + start + "&end=" + end;
        })
    })
</script>
</html>