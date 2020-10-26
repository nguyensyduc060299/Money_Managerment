<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en" dir="ltr">

<!-- soccer/project/project-list.html  07 Jan 2020 03:41:01 GMT -->
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
                        <h1 class="page-title">Wallet List</h1>
                    </div>
                    <div class="right">
                        <div>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addwallet">
                                Add
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section-body">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="d-flex justify-content-between align-items-center">
                            <ul class="nav nav-tabs page-header-tab">
                                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#WalletList">List</a>
                                </li>
                            </ul>
                            <div class="header-action d-md-flex">
                                <div class="input-group mr-2">
                                    <input type="text" class="form-control" placeholder="Search...">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section-body mt-3">
            <div class="container-fluid">
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="WalletList" role="tabpanel">
                        <div class="row">
                            <c:forEach items="${wallets}" var="wallet">
                                <!--thẻ ví-->
                                <div class="col-lg-6 col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h3 class="card-title">${wallet.name}</h3>
                                            <div class="card-options">
                                                <!-- <label class="custom-switch m-0">
                                                    <input type="checkbox" value="1" class="custom-switch-input" checked>
                                                    <span class="custom-switch-indicator"></span>
                                                </label> -->
                                                <a href="${pageContext.request.contextPath}/transaction?walletid=${wallet.id}&categoryid=0&start=&end="
                                                   class="card-options-collapse" data-toggle="card-collapse"><i
                                                        class="fe fe-chevron-up"></i></a>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <span class="tag tag-blue mb-3">${wallet.user}</span>
                                            <span class="tag tag-yellow mb-3">Owner</span>
                                            <div class="row">
                                                <div class="col-5 py-1"><strong>Đơn vị tiền</strong></div>
                                                <div class="col-7 py-1">VND</div>
                                                <div class="col-5 py-1"><strong>Số dư ban đầu</strong></div>
                                                <div class="col-7 py-1">${wallet.initialbalance}</div>
                                                <div class="col-5 py-1"><strong>Số dư hiện tại</strong></div>
                                                <div class="col-7 py-1">${wallet.overbalnce}</div>

                                            </div>
                                        </div>
                                        <div class="card-group">
                                            <div class="col-md-1"></div>
                                            <div class="col-md-2">
                                                <button type="button" class="btn btn-primary btn-edit edit_form"
                                                        data-toggle="modal"
                                                        data-target="#editwallet" id="${wallet.id}">Edit
                                                </button>
                                            </div>
                                            <div class="col-md-3">
                                                <button type="button" class="btn btn-primary delete-btn" data-toggle="modal"
                                                        data-target="#sure" id="${wallet.id}"> Delete
                                                </button>
                                            </div>
                                            <div class="col-md-3">
                                                <button type="button" class="btn btn-primary btn-share" data-toggle="modal"
                                                        data-target="#share" id="${wallet.id}"> Share
                                                </button>
                                            </div>
                                        </div>



                                        <br>
                                        <div class="card-footer">
                                            <div class="clearfix">
                                                <div class="float-left"><strong>${wallet.percent}%</strong></div>
                                                <div class="float-right"><small class="text-muted">Progress</small>
                                                </div>
                                            </div>
                                            <div class="progress progress-xs">
                                                <div class="progress-bar bg-green" role="progressbar"
                                                     style="width: ${wallet.percent}%" aria-valuenow="75"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </c:forEach>
                            <c:forEach items="${walletshare}" var="wallet">
                                <!--thẻ ví-->
                                <div class="col-lg-6 col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h3 class="card-title">${wallet.name}</h3>
                                            <div class="card-options">
                                                <!-- <label class="custom-switch m-0">
                                                    <input type="checkbox" value="1" class="custom-switch-input" checked>
                                                    <span class="custom-switch-indicator"></span>
                                                </label> -->
                                                <a href="${pageContext.request.contextPath}/transaction?walletid=${wallet.id}&categoryid=0&start=&end="
                                                   class="card-options-collapse" data-toggle="card-collapse"><i
                                                        class="fe fe-chevron-up"></i></a>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <span class="tag tag-blue mb-3">${wallet.user}</span>
                                            <span class="tag tag-green mb-3">Shared</span>
                                            <div class="row">
                                                <div class="col-5 py-1"><strong>Đơn vị tiền</strong></div>
                                                <div class="col-7 py-1">VND</div>
                                                <div class="col-5 py-1"><strong>Số dư ban đầu</strong></div>
                                                <div class="col-7 py-1">${wallet.initialbalance}</div>
                                                <div class="col-5 py-1"><strong>Số dư hiện tại</strong></div>
                                                <div class="col-7 py-1">${wallet.overbalnce}</div>

                                            </div>
                                        </div>
                                        <div class="card-group">
                                            <div class="col-md-1"></div>
                                            <div class="col-md-2">
                                                <button type="button" class="btn btn-primary btn-edit edit_form"
                                                        data-toggle="modal"
                                                        data-target="#editwallet" id="${wallet.id}">Edit
                                                </button>
                                            </div>
                                            <div class="col-md-3">
                                                <button type="button" class="btn btn-primary delete-btn" data-toggle="modal"
                                                        data-target="#sure" id="${wallet.id}"> Delete
                                                </button>
                                            </div>
                                            <div class="col-md-3">
                                                <button type="button" class="btn btn-primary btn-share" data-toggle="modal"
                                                        data-target="#share" id="${wallet.id}"> Share
                                                </button>
                                            </div>
                                        </div>



                                        <br>
                                        <div class="card-footer">
                                            <div class="clearfix">
                                                <div class="float-left"><strong>${wallet.percent}%</strong></div>
                                                <div class="float-right"><small class="text-muted">Progress</small>
                                                </div>
                                            </div>
                                            <div class="progress progress-xs">
                                                <div class="progress-bar bg-green" role="progressbar"
                                                     style="width: ${wallet.percent}%" aria-valuenow="75"
                                                     aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>

<!-- Add New Wallet -->
<div class="modal fade" id="addwallet" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="title" id="defaultModalLabel1">Add New Wallet</h6>
            </div>
            <div class="modal-body">
                <div class="row clearfix">
                    <div class="col-12">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Tên ví" name="walletname"
                                   id="walletname">
                        </div>
                    </div>
                    <div class="col-12 row">
                        <div class="form-group col-lg-8 col-md-12">
                            <input type="text" class="form-control" placeholder="Số dư ban đầu" name="initialbalance"
                                   id="initialbalance">
                        </div>
                        <div class="form-group col-lg-4 col-md-12">
                            <select class="form-control show-tick">
                                <option>Đơn vị tiền tệ</option>
                                <!--dưới này sẽ đưa ra các đơn vị tiền tệ có trong CSDL ra để người dùng chọn-->
                                <option>VND</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btn-add">Add</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="editwallet" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <form:form modelAttribute="wallet" method="POST" id="form_edit">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="title" id="defaultModalLabel2">Edit Wallet</h6>
                </div>
                <div class="modal-body">
                    <div class="row clearfix">
                        <div class="col-12">
                            <div class="form-group">
                                <input type="text" class="form-control"
                                       placeholder="Tên ví" name="name"
                                       id="name_edit">
                            </div>
                        </div>
                        <div class="col-12 row">
                            <div class="form-group col-lg-8 col-md-12">
                                <input type="text" class="form-control"
                                       placeholder="Số dư ban đầu"
                                       name="initialbalance"
                                       id="edit_init">
                            </div>
                            <div class="form-group col-lg-4 col-md-12">
                                <select class="form-control show-tick">
                                        <%--                                                                        <option>Đơn vị tiền tệ</option>--%>
                                    <!--dưới này sẽ đưa ra các đơn vị tiền tệ có trong CSDL ra để người dùng chọn-->
                                    <option>VND</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success" value="Edit">
                        Edit
                    </button>
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">
                        Close
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
                <a role="button" class="btn btn-danger" id="delete_submit">Delete</a>
                <button type="button" class="btn btn-primary"
                        data-dismiss="modal">
                    Cancel
                </button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="share" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <form:form method="post" id="share_form">
            <div class="modal-content">
                <div class="modal-header">
                    <input type="text" class="form-control" placeholder="" id="walletidd">
                </div>
                <div class="modal-header">
                    <input type="text" class="form-control" placeholder="Email User" id="email_share">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-info btn-check" value="Check">Check</button>
                    <button type="submit" class="btn btn-success" value="Share" disabled="disabled" id="btn-share">Share</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </form:form>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#btn-add").click(function () {
            var walletname = $("#walletname").val();
            var initialbalance = $("#initialbalance").val();
            console.log(initialbalance);
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/wallet/add",
                data: {
                    walletname: walletname,
                    initialbalance: initialbalance
                },

                success: function (data) {
                    alert("Add New Wallet Sucessful");
                    location.reload();
                },
                error: function (e) {
                    console.log(e);
                    alert("Add fail");
                }
            });
        })
        $(".edit_form").click(function () {
            var list_wallet = [${walletss}];
            var id = this.id;
            for(var i = 0; i<list_wallet[0].length;i++){
                if(list_wallet[0][i].id == id){
                    $("#name_edit").attr("value", list_wallet[0][i].name);
                    $("#edit_init").attr("value", list_wallet[0][i].initialbalance);
                    $("#form_edit").attr("action", "${pageContext.request.contextPath}/wallet/update?id="+id);
                }
            }
        })

        $(".delete-btn").click(function () {
            var list_wallet = [${walletss}];
            var id = this.id;
            for(var i = 0; i<list_wallet[0].length;i++){
                if(list_wallet[0][i].id == id){
                    $("#delete_submit").attr("href","${pageContext.request.contextPath }/wallet/delete?id="+id);
                }
            }
        })
        $(".btn-share").click(function () {
            var id = this.id;
            var list_wallet = [${walletss}];
            for(var i = 0; i<list_wallet[0].length;i++){
                if(list_wallet[0][i].id == id){
                    $("#walletidd").attr("value", list_wallet[0][i].name);
                }
            }
            $(".btn-check").click(function(){
                var email = $("#email_share").val();
                var listUser = [${listUser}];
                var check = false;
                for(var i = 0; i<listUser[0].length;i++){
                    if(listUser[0][i].email == email){
                        check = true;
                        alert("Exist User");
                        $("#btn-share").removeAttr("disabled");
                        $("#share_form").attr("action","${pageContext.request.contextPath }/wallet/share?walletid="+id+"&email="+email);
                        break;
                    }

                }
                if(check == false)alert("User not exist");
            })
        })
    })
</script>
</body>
</html>
