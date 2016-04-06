<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section id="main-content">
	<section class="wrapper">

		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>관리시스템
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>예약관리(캘린더)</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div id="search_div" style="margin-bottom: 10px;">
					<a href="/management/customer" class="btn btn-default">예약 게시판으로 이동</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 portlets">
            <div class="panel panel-default">
				<div class="panel-heading">
                  <h2><strong>Calendar</strong></h2>
				<div class="panel-actions">
                    <a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
                    <a href="#" class="wclose"><i class="fa fa-times"></i></a>
                </div>  
                 
                </div><br><br><br>
                <div class="panel-body">
                	<div id="calendar"></div>
                </div>
              </div> 
               
            </div>
		</div>
	</section>
</section>
<div id="myModal" class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">예약정보</h4>
      </div>
      <div class="modal-body">
      	<div class="row">
      		<div class="col-lg-2">
      			고객명
      		</div>
      		<div id="customer" class="col-lg-10">
      			
      		</div>
      	</div>
      	<div class="row">
      		<div class="col-lg-2">
      			전화번호
      		</div>
      		<div id="tel" class="col-lg-10">
      			
      		</div>
      	</div>
      	<div class="row">
      		<div class="col-lg-2">
      			서비스명
      		</div>
      		<div id="service" class="col-lg-10">
      			
      		</div>
      	</div>
      	<div class="row">
      		<div class="col-lg-2">
      			메모
      		</div>
      		<div id="memo" class="col-lg-10">
      			
      		</div>
      	</div>
      </div>
      <div class="modal-footer">
      	<!-- <button type="button" class="btn btn-success" onclick="updateColor('green')">완료</button>
	    <button type="button" class="btn btn-warning" onclick="updateColor('yellow')">취소</button> -->
      	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<script>
$('#calendar').fullCalendar({
	header: {
		left: 'prev,next today',
		center: 'title',
		right: 'month,agendaWeek,agendaDay'
	},
	events: '/management/calendarAjax',
	allDayDefault:false,
	defaultTimedEventDuration:'01:00:00',
	eventClick: function(calEvent, jsEvent, view) {

		$('#customer').text(calEvent.name);
		$('#tel').text(calEvent.tel);
		$('#service').text(calEvent.title);
		$('#memo').text(calEvent.memo);
        
        $('#myModal').modal('show');
    }/* , dayClick: function(date, jsEvent, view) {

        alert('Clicked on: ' + date);

        alert('Coordinates: ' + jsEvent);

        alert('Current view: ' + view.name);

        // change the day's background color just for fun
        $(this).css('background-color', 'red');

    } */
});

function updateColor(color){
	alert(color);
	$('#myModal').modal('hide');
}
</script>