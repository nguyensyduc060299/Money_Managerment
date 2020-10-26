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
                        <h1 class="page-title">Calendar</h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="section-body mt-3">
            <div class="container-fluid">
                <div class="row clearfix row-deck">
                    <div class="col-lg-12 col-md-12">
                        <div class="card">
                            <div class="card-header bline">
                                <h3 class="card-title">Hi ${user.firstName} ${user.lastName}</h3>
                                <div class="card-options">
                                    <a href="#" class="card-options-fullscreen" data-toggle="card-fullscreen"><i class="fe fe-maximize"></i></a>
                                </div>
                            </div>
                            <div class="card-body">
                                <div id="calendar"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Add New Event popup -->
<div class="modal fade" id="addNewEvent" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><strong>Add</strong> an event</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <label class="control-label">Event Name</label>
                            <input class="form-control" placeholder="Enter name" type="text" name="category-name">
                        </div>
                        <div class="col-md-6">
                            <label class="control-label">Choose Event Color</label>
                            <select class="form-control" data-placeholder="Choose a color..." name="category-color">
                                <option value="success">Success</option>
                                <option value="danger">Danger</option>
                                <option value="info">Info</option>
                                <option value="primary">Primary</option>
                                <option value="warning">Warning</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success save-event" data-dismiss="modal">Save</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- Add Direct Event popup -->
<div class="modal fade" id="addDirectEvent" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Direct Event</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Event Name</label>
                            <input class="form-control" name="event-name" type="text" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Event Type</label>
                            <select name="event-bg" class="form-control">
                                <option value="success">Success</option>
                                <option value="danger">Danger</option>
                                <option value="info">Info</option>
                                <option value="primary">Primary</option>
                                <option value="warning">Warning</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn save-btn btn-success">Save</button>
                <button class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- Event Edit Modal popup -->
<div class="modal fade" id="eventEditModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Edit Event</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Event Name</label>
                            <input class="form-control" name="event-name" type="text" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Event Type</label>
                            <select name="event-bg" class="form-control">
                                <option value="success">Success</option>
                                <option value="danger">Danger</option>
                                <option value="info">Info</option>
                                <option value="primary">Primary</option>
                                <option value="warning">Warning</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn mr-auto delete-btn btn-danger">Delete</button>
                <button class="btn save-btn btn-success">Save</button>
                <button class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

<script src="/assets/bundles/lib.vendor.bundle.js"></script>

<script src="/assets/bundles/fullcalendar.bundle.js"></script>

<script src="/assets/js/core.js"></script>

<script type="text/javascript">
    $(function() {
        enableDrag();

        function enableDrag() {
            $('#external-events .fc-event').each(function() {
                $(this).data('event', {
                    title: $.trim($(this).text()), // use the element's text as the event title
                    stick: true // maintain when user navigates (see docs on the renderEvent method)
                });
                // make the event draggable using jQuery UI
                $(this).draggable({
                    zIndex: 999,
                    revert: true, // will cause the event to go back to its
                    revertDuration: 0 //  original position after the drag
                });
            });
        }
        $(".save-event").on('click', function() {
            var categoryName = $('#addNewEvent form').find("input[name='category-name']").val();
            var categoryColor = $('#addNewEvent form').find("select[name='category-color']").val();
            if (categoryName !== null && categoryName.length != 0) {
                $('#event-list').append('<div class="fc-event bg-' + categoryColor + '" data-class="bg-' + categoryColor + '">' + categoryName + '</div>');
                $('#addNewEvent form').find("input[name='category-name']").val("");
                $('#addNewEvent form').find("select[name='category-color']").val("");
                enableDrag();
            }
        });
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var yyyy = today.getFullYear();
        if (dd < 10) {
            dd = '0' + dd
        }
        if (mm < 10) {
            mm = '0' + mm
        }
        var current = yyyy + '-' + mm + '-';
        var calendar = $('#calendar');
        // Add direct event to calendar
        var newEvent = function(start) {
            $('#addDirectEvent input[name="event-name"]').val("");
            $('#addDirectEvent select[name="event-bg"]').val("");
            $('#addDirectEvent').modal('show');
            $('#addDirectEvent .save-btn').unbind();
            $('#addDirectEvent .save-btn').on('click', function() {
                var title = $('#addDirectEvent input[name="event-name"]').val();
                var classes = 'bg-' + $('#addDirectEvent select[name="event-bg"]').val();
                if (title) {
                    var eventData = {
                        title: title,
                        start: start,
                        className: classes
                    };
                    calendar.fullCalendar('renderEvent', eventData, true);
                    $('#addDirectEvent').modal('hide');
                } else {
                    alert("Title can't be blank. Please try again.")
                }
            });
        }
        var event = [${events}];
        var events =[]
        for(var i = 0; i< event[0].length;i++){
            var evenData ={
                title: event[0][i].name,
                start: event[0][i].date,
                className: "bg-"+event[0][i].btn
            };
            events.push(evenData);
           //  calendar.fullCalendar('renderEvent', evenData, true);
           // $('#addDirectEvent').modal('hide');
        }
        // initialize the calendar
        calendar.fullCalendar({
            header: {
                left: 'title',
                center: '',
                right: 'month, agendaWeek, agendaDay, prev, next'
            },
            editable: true,
            droppable: true,
            eventLimit: true, // allow "more" link when too many events
            selectable: true,
            events: events ,
            drop: function(date, jsEvent) {
                // var originalEventObject = $(this).data('eventObject');
                // var $categoryClass = $(this).attr('data-class');
                // var copiedEventObject = $.extend({}, originalEventObject);
                // //console.log(originalEventObject + '--' + $categoryClass + '---' + copiedEventObject);
                // copiedEventObject.start = date;
                // if ($categoryClass)
                //   copiedEventObject['className'] = [$categoryClass];
                // calendar.fullCalendar('renderEvent', copiedEventObject, true);
                // is the "remove after drop" checkbox checked?
                if ($('#drop-remove').is(':checked')) {
                    // if so, remove the element from the "Draggable Events" list
                    $(this).remove();
                }
            },
            select: function(start, end, allDay) {
                newEvent(start);
            },
            eventClick: function(calEvent, jsEvent, view) {
                //var title = prompt('Event Title:', calEvent.title, { buttons: { Ok: true, Cancel: false} });
                var eventModal = $('#eventEditModal');
                eventModal.modal('show');
                eventModal.find('input[name="event-name"]').val(calEvent.title);
                eventModal.find('.save-btn').click(function() {
                    calEvent.title = eventModal.find("input[name='event-name']").val();
                    calendar.fullCalendar('updateEvent', calEvent);
                    eventModal.modal('hide');
                });
                // if (title){
                //     calEvent.title = title;
                //     calendar.fullCalendar('updateEvent',calEvent);
                // }
            }
        });
    });
</script>
</body>

</html>

<%--[{--%>
<%--title: 'Birthday Party',--%>
<%--start: current + '01',--%>
<%--className: 'bg-info'--%>
<%--},{--%>
<%--title: 'Conference',--%>
<%--start: current + '05',--%>
<%--end: '2019-09-06',--%>
<%--className: 'bg-warning'--%>
<%--},{--%>
<%--title: 'Meeting',--%>
<%--start: current + '09T12:30:00',--%>
<%--allDay: false, // will make the time show--%>
<%--className: 'bg-success',--%>
<%--},{--%>
<%--title: 'Meeting',--%>
<%--start: current + '09T18:30:00',--%>
<%--allDay: false, // will make the time show--%>
<%--className: 'bg-info',--%>
<%--},{--%>
<%--title: 'BOD Event',--%>
<%--start: '2019-09-16',--%>
<%--end: '2019-09-16',--%>
<%--className: 'bg-indigo'--%>
<%--},{--%>
<%--title: 'June Challenge',--%>
<%--start: '2019-09-10',--%>
<%--end: '2019-09-12',--%>
<%--className: 'bg-gray'--%>
<%--},{--%>
<%--title: 'Earthcon Exhibition',--%>
<%--start: '2019-09-18',--%>
<%--end: '2019-09-22',--%>
<%--className: 'bg-red'--%>
<%--},{--%>
<%--title: 'Toastmasters Meeting #3',--%>
<%--start: '2019-09-26',--%>
<%--end: '2019-09-26',--%>
<%--className: 'bg-orange'--%>
<%--},{--%>
<%--title: 'Salary',--%>
<%--start: '2019-09-07',--%>
<%--end: '2019-09-07',--%>
<%--className: 'bg-pink'--%>
<%--}--%>

<%--]--%>