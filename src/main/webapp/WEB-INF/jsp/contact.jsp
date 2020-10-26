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
                        <h1 class="page-title">Contact</h1>                        
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
                        <form:form action="${pageContext.request.contextPath}/wallet/contact/send" modelAttribute="feedback" method="post">
                        <div class="card-body">
                                <h4>Help Us Become Better</h4>
                            <br>
                            <br>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Title" name="title"
                                               id="title">
                                    </div>
                                </div>
                                <div class="col-12 row">
                                    <textarea class="form-control" placeholder="Your FeedBack ....." id="content" name="content"></textarea>
                                </div>
                            <div class="mt-4 text-right">
                                <button type="submit" class="btn btn-primary" id="btn-send">Send</button>
                            </div>
                        </div>
                        </form:form>
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
<!--danh sách các phản hồi trước-->
<%--                    <div class="tab-pane fade show active" id="list" role="tabpanel">--%>
<%--                        <div class="row clearfix">--%>
<%--                            <div class="col-lg-12">--%>
<%--                                <div class="table-responsive" id="users">--%>
<%--                                    <table class="table table-hover table-vcenter text-nowrap table_custom border-style list">--%>
<%--                                        <tbody>--%>
<%--                                            <tr class="">--%>
<%--                                                <td class="width35 hidden-xs">--%>
<%--                                                    <a href="javascript:void(0);" class="mail-star"><i class="fa fa-star"></i></a>--%>
<%--                                                </td>--%>
<%--                                                <td class="text-center width40">--%>
<%--                                                    <div class="avatar d-block">--%>
<%--                                                        <img class="avatar" src="assets/images/xs/avatar4.jpg" alt="avatar">--%>
<%--                                                    </div>--%>
<%--                                                </td>--%>
<%--                                                <td>--%>
<%--                                                    <div><a href="javascript:void(0);">John Smith</a></div>--%>
<%--                                                    <div class="text-muted">+264-625-2583</div>--%>
<%--                                                </td>--%>
<%--                                                <td class="hidden-xs">--%>
<%--                                                    <div class="text-muted">johnsmith@info.com</div>--%>
<%--                                                </td>--%>
<%--                                                <td class="hidden-sm">--%>
<%--                                                    <div class="text-muted">455 S. Airport St. Moncks Corner, SC 29461</div>                                                --%>
<%--                                                </td>--%>
<%--                                                <td class="text-right">--%>
<%--                                                    <a class="btn btn-sm btn-link" href="javascript:void(0)" data-toggle="tooltip" title="Phone"><i class="fa fa-phone"></i></a>--%>
<%--                                                    <a class="btn btn-sm btn-link" href="javascript:void(0)" data-toggle="tooltip" title="Mail"><i class="fa fa-envelope"></i></a>--%>
<%--                                                    <a class="btn btn-sm btn-link hidden-xs js-sweetalert" data-type="confirm" href="javascript:void(0)" data-toggle="tooltip" title="Delete"><i class="fa fa-trash"></i></a>--%>
<%--                                                </td>--%>
<%--                                            </tr>--%>
<%--                                            <tr class="">--%>
<%--                                                <td class="width35 hidden-xs">--%>
<%--                                                    <a href="javascript:void(0);" class="mail-star active"><i class="fa fa-star"></i></a>--%>
<%--                                                </td>--%>
<%--                                                <td class="text-center width40">--%>
<%--                                                    <div class="avatar d-block">--%>
<%--                                                        <img class="avatar" src="assets/images/xs/avatar2.jpg" alt="avatar">--%>
<%--                                                    </div>--%>
<%--                                                </td>--%>
<%--                                                <td>--%>
<%--                                                    <div><a href="javascript:void(0);">Merri Diamond</a></div>--%>
<%--                                                    <div class="text-muted">+264-625-2583</div>--%>
<%--                                                </td>--%>
<%--                                                <td class="hidden-xs">--%>
<%--                                                    <div class="text-muted">hermanbeck@info.com</div>--%>
<%--                                                </td>--%>
<%--                                                <td class="hidden-sm">--%>
<%--                                                    <div class="text-muted">455 S. Airport St. Moncks Corner, SC 29461</div>                                                --%>
<%--                                                </td>--%>
<%--                                                <td class="text-right">--%>
<%--                                                    <a class="btn btn-sm btn-link" href="javascript:void(0)" data-toggle="tooltip" title="Phone"><i class="fa fa-phone"></i></a>--%>
<%--                                                    <a class="btn btn-sm btn-link" href="javascript:void(0)" data-toggle="tooltip" title="Mail"><i class="fa fa-envelope"></i></a>--%>
<%--                                                    <a class="btn btn-sm btn-link hidden-xs js-sweetalert" data-type="confirm" href="javascript:void(0)" data-toggle="tooltip" title="Delete"><i class="fa fa-trash"></i></a>--%>
<%--                                                </td>--%>
<%--                                            </tr>--%>
<%--                                            <tr class="">--%>
<%--                                                <td class="hidden-xs">--%>
<%--                                                    <a href="javascript:void(0);" class="mail-star love"><i class="fa fa-heart"></i></a>--%>
<%--                                                </td>--%>
<%--                                                <td class="text-center width40">--%>
<%--                                                    <div class="avatar d-block">--%>
<%--                                                        <img class="avatar" src="assets/images/xs/avatar3.jpg" alt="avatar">--%>
<%--                                                    </div>--%>
<%--                                                </td>--%>
<%--                                                <td>--%>
<%--                                                    <div class="from"><a href="javascript:void(0);">Sara Hopkins</a></div>--%>
<%--                                                    <div class="text-muted">+264-625-3333</div>--%>
<%--                                                </td>--%>
<%--                                                <td class="hidden-xs">--%>
<%--                                                    <div class="text-muted">maryadams@info.com</div>--%>
<%--                                                </td>--%>
<%--                                                <td class="hidden-sm">--%>
<%--                                                    <div class="text-muted">19 Ohio St. Snellville, GA 30039</div>                                                --%>
<%--                                                </td>--%>
<%--                                                <td class="text-right">--%>
<%--                                                    <a class="btn btn-sm btn-link" href="javascript:void(0)" data-toggle="tooltip" title="Phone"><i class="fa fa-phone"></i></a>--%>
<%--                                                    <a class="btn btn-sm btn-link" href="javascript:void(0)" data-toggle="tooltip" title="Mail"><i class="fa fa-envelope"></i></a>--%>
<%--                                                    <a class="btn btn-sm btn-link hidden-xs js-sweetalert" data-type="confirm" href="javascript:void(0)" data-toggle="tooltip" title="Delete"><i class="fa fa-trash"></i></a>--%>
<%--                                                </td>--%>
<%--                                            </tr>--%>
<%--                                            <tr class="">--%>
<%--                                                <td class="hidden-xs">--%>
<%--                                                    <a href="javascript:void(0);" class="mail-star active"><i class="fa fa-star"></i></a>--%>
<%--                                                </td>--%>
<%--                                                <td class="text-center width40">--%>
<%--                                                    <div class="avatar d-block">--%>
<%--                                                        <img class="avatar" src="assets/images/xs/avatar7.jpg" alt="avatar">--%>
<%--                                                    </div>--%>
<%--                                                </td>--%>
<%--                                                <td>--%>
<%--                                                    <div class="from"><a href="javascript:void(0);">Andrew Patrick</a></div>--%>
<%--                                                    <div class="text-muted">+264-625-2586</div>--%>
<%--                                                </td>--%>
<%--                                                <td class="hidden-xs">--%>
<%--                                                    <div class="text-muted">mikethimas@info.com</div>--%>
<%--                                                </td>--%>
<%--                                                <td class="hidden-sm">--%>
<%--                                                    <div class="text-muted">728 Blackburn St. Andover, MA 01810</div>                                                --%>
<%--                                                </td>--%>
<%--                                                <td class="text-right">--%>
<%--                                                    <a class="btn btn-sm btn-link" href="javascript:void(0)" data-toggle="tooltip" title="Phone"><i class="fa fa-phone"></i></a>--%>
<%--                                                    <a class="btn btn-sm btn-link" href="javascript:void(0)" data-toggle="tooltip" title="Mail"><i class="fa fa-envelope"></i></a>--%>
<%--                                                    <a class="btn btn-sm btn-link hidden-xs js-sweetalert" data-type="confirm" href="javascript:void(0)" data-toggle="tooltip" title="Delete"><i class="fa fa-trash"></i></a>--%>
<%--                                                </td>--%>
<%--                                            </tr>--%>
<%--                                            <tr class="">--%>
<%--                                                <td class="hidden-xs">--%>
<%--                                                    <a href="javascript:void(0);" class="mail-star"><i class="fa fa-star"></i></a>--%>
<%--                                                </td>--%>
<%--                                                <td class="text-center width40">--%>
<%--                                                    <div class="avatar d-block">--%>
<%--                                                        <img class="avatar" src="assets/images/xs/avatar5.jpg" alt="avatar">--%>
<%--                                                    </div>--%>
<%--                                                </td>--%>
<%--                                                <td>--%>
<%--                                                    <div class="from"><a href="javascript:void(0);">Claire Peters</a></div>--%>
<%--                                                    <div class="text-muted">+264-625-3333</div>--%>
<%--                                                </td>--%>
<%--                                                <td class="hidden-xs">--%>
<%--                                                    <div class="text-muted">clairepeters@info.com</div>--%>
<%--                                                </td>--%>
<%--                                                <td class="hidden-sm">--%>
<%--                                                    <div class="text-muted">19 Ohio St. Snellville, GA 30039</div>                                                --%>
<%--                                                </td>--%>
<%--                                                <td class="text-right">--%>
<%--                                                    <a class="btn btn-sm btn-link" href="javascript:void(0)" data-toggle="tooltip" title="Phone"><i class="fa fa-phone"></i></a>--%>
<%--                                                    <a class="btn btn-sm btn-link" href="javascript:void(0)" data-toggle="tooltip" title="Mail"><i class="fa fa-envelope"></i></a>--%>
<%--                                                    <a class="btn btn-sm btn-link hidden-xs js-sweetalert" data-type="confirm" href="javascript:void(0)" data-toggle="tooltip" title="Delete"><i class="fa fa-trash"></i></a>--%>
<%--                                                </td>--%>
<%--                                            </tr>--%>
<%--                                            <tr class="" >--%>
<%--                                                <td class="hidden-xs">--%>
<%--                                                    <a href="javascript:void(0);" class="mail-star"><i class="fa fa-star"></i></a>--%>
<%--                                                </td>--%>
<%--                                                <td class="text-center width40">--%>
<%--                                                    <div class="avatar d-block">--%>
<%--                                                        <img class="avatar" src="assets/images/xs/avatar6.jpg" alt="avatar">--%>
<%--                                                    </div>--%>
<%--                                                </td>--%>
<%--                                                <td>--%>
<%--                                                    <div class="from"><a href="javascript:void(0);">Allen Collins</a></div>--%>
<%--                                                    <div class="text-muted">+264-625-4526</div>--%>
<%--                                                </td>--%>
<%--                                                <td class="hidden-xs">--%>
<%--                                                    <div class="text-muted">kenpatrick@info.com</div>--%>
<%--                                                </td>--%>
<%--                                                <td class="hidden-sm">--%>
<%--                                                    <div class="text-muted">728 Blackburn St. Andover, MA 01810</div>                                                --%>
<%--                                                </td>--%>
<%--                                                <td class="text-right">--%>
<%--                                                    <a class="btn btn-sm btn-link" href="javascript:void(0)" data-toggle="tooltip" title="Phone"><i class="fa fa-phone"></i></a>--%>
<%--                                                    <a class="btn btn-sm btn-link" href="javascript:void(0)" data-toggle="tooltip" title="Mail"><i class="fa fa-envelope"></i></a>--%>
<%--                                                    <a class="btn btn-sm btn-link hidden-xs js-sweetalert" data-type="confirm" href="javascript:void(0)" data-toggle="tooltip" title="Delete"><i class="fa fa-trash"></i></a>--%>
<%--                                                </td>--%>
<%--                                            </tr>--%>
<%--                                            <tr class="">--%>
<%--                                                <td class="width35 hidden-xs">--%>
<%--                                                    <a href="javascript:void(0);" class="mail-star"><i class="fa fa-star"></i></a>--%>
<%--                                                </td>--%>
<%--                                                <td class="text-center width40">--%>
<%--                                                    <div class="avatar d-block">--%>
<%--                                                        <img class="avatar" src="assets/images/xs/avatar4.jpg" alt="avatar">--%>
<%--                                                    </div>--%>
<%--                                                </td>--%>
<%--                                                <td>--%>
<%--                                                    <div><a href="javascript:void(0);">Erin Gonzales</a></div>--%>
<%--                                                    <div class="text-muted">+264-625-1593</div>--%>
<%--                                                </td>--%>
<%--                                                <td class="hidden-xs">--%>
<%--                                                    <div class="text-muted">eringonzales@info.com</div>--%>
<%--                                                </td>--%>
<%--                                                <td class="hidden-sm">--%>
<%--                                                    <div class="text-muted">455 S. Airport St. Moncks Corner, SC 29461</div>                                                --%>
<%--                                                </td>--%>
<%--                                                <td class="text-right">--%>
<%--                                                    <a class="btn btn-sm btn-link" href="javascript:void(0)" data-toggle="tooltip" title="Phone"><i class="fa fa-phone"></i></a>--%>
<%--                                                    <a class="btn btn-sm btn-link" href="javascript:void(0)" data-toggle="tooltip" title="Mail"><i class="fa fa-envelope"></i></a>--%>
<%--                                                    <a class="btn btn-sm btn-link hidden-xs js-sweetalert" data-type="confirm" href="javascript:void(0)" data-toggle="tooltip" title="Delete"><i class="fa fa-trash"></i></a>--%>
<%--                                                </td>--%>
<%--                                            </tr>--%>
<%--                                            <tr class="">--%>
<%--                                                <td class="hidden-xs">--%>
<%--                                                    <a href="javascript:void(0);" class="mail-star"><i class="fa fa-star"></i></a>--%>
<%--                                                </td>--%>
<%--                                                <td class="text-center width40">--%>
<%--                                                    <div class="avatar d-block">--%>
<%--                                                        <img class="avatar" src="assets/images/xs/avatar5.jpg" alt="avatar">--%>
<%--                                                    </div>--%>
<%--                                                </td>--%>
<%--                                                <td>--%>
<%--                                                    <div class="from"><a href="javascript:void(0);">Harry McCall</a></div>--%>
<%--                                                    <div class="text-muted">+264-625-2468</div>--%>
<%--                                                </td>--%>
<%--                                                <td class="hidden-xs">--%>
<%--                                                    <div class="text-muted">susiewillis@info.com</div>--%>
<%--                                                </td>--%>
<%--                                                <td class="hidden-sm">--%>
<%--                                                    <div class="text-muted">19 Ohio St. Snellville, GA 30039</div>                                                --%>
<%--                                                </td>--%>
<%--                                                <td class="text-right">--%>
<%--                                                    <a class="btn btn-sm btn-link" href="javascript:void(0)" data-toggle="tooltip" title="Phone"><i class="fa fa-phone"></i></a>--%>
<%--                                                    <a class="btn btn-sm btn-link" href="javascript:void(0)" data-toggle="tooltip" title="Mail"><i class="fa fa-envelope"></i></a>--%>
<%--                                                    <a class="btn btn-sm btn-link hidden-xs js-sweetalert" data-type="confirm" href="javascript:void(0)" data-toggle="tooltip" title="Delete"><i class="fa fa-trash"></i></a>--%>
<%--                                                </td>--%>
<%--                                            </tr>--%>
<%--                                        </tbody>--%>
<%--                                    </table>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>