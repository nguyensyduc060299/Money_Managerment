<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en" dir="ltr">

<!-- soccer/project/project-ticket.html  07 Jan 2020 03:41:12 GMT -->
<head>
    <%@ include file="head.jsp"%>
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
                        <h1 class="page-title">Transaction List</h1>                        
                    </div>
                    <div class="right">
                        <div class="input-icon xs-hide mr-4">
                            <select class="form-control show-tick" id="wallet_default">
                                <c:forEach items="${wallets}" var="wallet">
                                    <c:if test="${walletid == wallet.id}">
                                        <option selected="selected" value="${wallet.id}">${wallet.name}</option>
                                    </c:if>
                                    <c:if test="${walletid != wallet.id}">
                                        <option value="${wallet.id}">${wallet.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addtransaction">Add</button>
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
                                <div class="row">
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <div class="input-group ">
                                            <select class="form-control show-tick" id="category_search" data-placeholder="Category">
                                                <option value="0">All Category</option>
                                                <!--dưới này sẽ đưa ra các category có trong CSDL ra để người dùng chọn-->
                                                <c:forEach items="${categories}" var="category">
                                                    <c:if test="${categoryid == category.id}">
                                                        <option selected="selected" value="${category.id}">${category.name}</option>
                                                    </c:if>
                                                    <c:if test="${categoryid != category.id}">
                                                        <option value="${category.id}">${category.name}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <div class="input-group">
                                            <input type="text" class="form-control" data-provide="datepicker" placeholder="Start Date" id="start_date">
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <div class="input-group">
                                            <input type="text" class="form-control" data-provide="datepicker" placeholder="End Date" id="end_date">
                                        </div>
                                    </div>
                                    <div class="col-lg-1 col-md-4 col-sm-6">
                                        <button type="button" class="btn btn-primary" id="search">Search</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card">
                            <div class="table-responsive">
                                <table class="table table-hover table-striped table-vcenter mb-0 text-nowrap">
                                    <thead>
                                        <tr>
                                            <!-- <th class="w30">&nbsp;</th> -->
                                            <th>ID</th>
                                            <th>Wallet</th>
                                            <th>Category</th>
                                            <th>Amount</th>
                                            <!-- <th>Agent</th> -->
                                            <th>Date</th>
                                            <th>Note</th>
                                            <th>User</th>
                                            <th>Edit</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                           <c:forEach items="${transactions}" var="transaction">
                                           <tr>
                                               <td><span>${transaction.id}</span></td>
                                               <td><span>${transaction.wallet}</span></td>
                                               <td><span>${transaction.category}</span></td>
                                               <td><span>${transaction.amount}</span></td>
                                               <td><span>${transaction.time}</span></td>
                                               <td><span>${transaction.note}</span></td>
                                               <td><span>${transaction.username}</span></td>
                                               <td><button type="button" class="btn btn-primary btn-edit edit_form" data-toggle="modal"
                                                           data-target="#edittransaction" id="${transaction.id}">Edit
                                               </button></td>
                                               <td><button type="button" class="btn btn-primary delete-btn" data-toggle="modal"
                                                           data-target="#sure" id="${transaction.id}"> Delete
                                               </button></td>
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
        <div class="modal fade" id="addtransaction" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h6 class="title" id="defaultModalLabel1">Add New Transaction</h6>
                    </div>
                    <div class="modal-body">
                        <div class="row clearfix">
                            <div class="col-12">
                                <div class="form-group ">
                                    <select class="form-control show-tick" id="wallet2" name="wallet">
                                        <c:forEach items="${wallets}" var="wallet" >
                                            <c:if test="${walletid == wallet.id}">
                                                <option selected="selected" value="${wallet.id}">${wallet.name}</option>
                                            </c:if>
                                            <c:if test="${walletid != wallet.id}">
                                                <option value="${wallet.id}">${wallet.name}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group ">
                                    <select class="form-control show-tick" id="category2" name="category">
                                        <option>Category</option>
                                        <c:forEach items="${categories}" var="category">
                                            <c:if test="${categoryid == category.id}">
                                                <option selected="selected" value="${category.id}">${category.name}</option>
                                            </c:if>
                                            <c:if test="${categoryid != category.id}">
                                                <option value="${category.id}">${category.name}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Giá trị giao dịch" id="amount">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" data-provide="datepicker" placeholder="Date" id="time">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <textarea class="form-control" placeholder="Note" id="note"></textarea>
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
        <div class="modal fade" id="edittransaction" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <form:form modelAttribute="transaction" method="POST" id="form_edit">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h6 class="title" id="defaultModalLabel2">Edit Transaction</h6>
                        </div>
                        <div class="modal-body">
                            <div class="row clearfix">
                                <div class="col-12">
                                    <div class="form-group ">
                                        <select class="form-control show-tick" id="wallet1" name="wallet">
                                            <c:forEach items="${wallets}" var="wallet" >
                                                <c:if test="${walletid == wallet.id}">
                                                    <option selected="selected" value="${wallet.name}">${wallet.name}</option>
                                                </c:if>
                                                <c:if test="${walletid != wallet.id}">
                                                    <option value="${wallet.name}">${wallet.name}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group ">
                                        <select class="form-control show-tick" id="category_edit" name="category">
                                            <c:forEach items="${categories}" var="category">
                                                    <option id="${category.name}">${category.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Giá trị giao dịch" id="amount_edit" name="amount">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" data-provide="datepicker" placeholder="Date" id="time_edit" name="time" id="time_edit">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea class="form-control" placeholder="Note" name="note" id="note_edit"></textarea>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success" value="Edit" >Edit</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
                        <a  role="button" class="btn btn-danger delete_submit">Delete</a>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
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
            var walletid = $("#wallet2").val();
            var categoryid = $("#category2").val();
            var amount = $("#amount").val();
            var note = $("#note").val();
            var time = $("#time").val();
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/transaction/add",
                data: {
                    walletid: walletid,
                    categoryid: categoryid,
                    amount: amount,
                    note: note,
                    time: time
                },

                success: function (data) {
                    alert("Add New Transaction Sucessful");
                    location.reload();
                },
                error: function (e) {
                    console.log(e);
                    alert("Add fail");
                }
            });
        })
        $("#wallet_default").change(function(){
            var walletid = $("#wallet_default").val();
            var start = $("#start_date").val();
            var end =$("#end_date").val();
            window.location = "${pageContext.request.contextPath}/transaction?walletid="+ walletid+"&categoryid=0&start="+start+"&end="+end;
        })
        $('#time').datepicker({ format: 'yyyy-mm-dd' });
        $("#timeedit").datepicker({ format: 'yyyy-mm-dd' });
        $('#start_date').datepicker({ format: 'yyyy-mm-dd' });
        $('#end_date').datepicker({ format: 'yyyy-mm-dd' });

        $("#search").click(function(){
            var walletid =$("#wallet_default").val();
            var start = $("#start_date").val();
            var end =$("#end_date").val();
            var categoryid =$("#category_search").val();
            window.location = "${pageContext.request.contextPath}/transaction?walletid="+ walletid+"&categoryid="+categoryid+
                              "&start="+start+"&end="+end;
        })
        $(".edit_form").click(function () {
            var walletid =$("#wallet_default").val();
            var start = $("#start_date").val();
            var end =$("#end_date").val();
            var categoryid =$("#category_search").val();
            var list_transaction = [${transactionss}];
            var id = this.id;
            for(var i = 0; i<list_transaction[0].length;i++){
                if(list_transaction[0][i].id == id){
                    var category = list_transaction[0][i].category;
                    console.log(category)
                    $("#"+category).attr("selected", "selected");
                    $("#time_edit").attr("value", list_transaction[0][i].time);
                    $("#amount_edit").attr("value", list_transaction[0][i].amount);
                    $("#note_edit").html(list_transaction[0][i].note);
                    $("#form_edit").attr("action", "${pageContext.request.contextPath}/transaction/update?walletid="+ walletid+"&categoryid="+categoryid+
                        "&start="+start+"&end="+end+"&id="+id);
                }
            }
        })

        $(".delete-btn").click(function () {
            var walletid =$("#wallet_default").val();
            var start = $("#start_date").val();
            var end =$("#end_date").val();
            var categoryid =$("#category_search").val();
            var list_transaction = [${transactionss}];
            var id = this.id;
            for(var i = 0; i<list_transaction[0].length;i++){
                if(list_transaction[0][i].id == id){
                    $(".delete_submit").attr("href","${pageContext.request.contextPath}/transaction/delete?walletid="+ walletid+"&categoryid="+categoryid+
                        "&start="+start+"&end="+end+"&id="+id);
                }
            }
        })
    })
</script>

</html>