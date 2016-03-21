<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section id="main-content">
	<section class="wrapper">

		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>master 메뉴
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>통계조회</li>
				</ol>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<div class="panel-body">
						<table id="statisticsTable" class="table table-striped table-advance">
							<tbody>
								<tr style="background-color: red;">
									<th><i class="icon_calendar"></i> /</th>
									<th><i class="icon_calendar"></i> 합계</th>
								</tr>
								<c:forEach var="info" items="${result}" varStatus="status">
									<c:choose>
										<c:when test="${!status.last}">
											<tr>
												<td>${info.motivation}</td>
												<td>${info.cnt}</td>
											</tr>	
										</c:when>
										<c:otherwise>
											<tr>
												<td>합계</td>
												<td>${info.cnt}</td>
											</tr>
										</c:otherwise>
									</c:choose>
									
								</c:forEach>
								
							</tbody>
						</table>
					</div>
				</section>	
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<div class="pull-right">
					<button type="button" class="btn btn-lg btn-primary" onclick="javascript:history.back();">확인</button>
				</div>
			</div>
		</div>
		
	</section>
</section>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<script>

//datepicker
$('#startDate,#endDate').daterangepicker({
	singleDatePicker: true,
       showDropdowns: true,
	locale : {
		format : 'YYYY-MM-DD'
	}
},
function(start, end, label) {
	$('#start').val('');
});
   
function getFrachiseList() {
	var name = $('#name').val();
	
	if(name ==null || name ==''){
		alert('계정명을 입력해 주세요.');
		return false;
	}
	
	$('#statisticsTable > tbody > tr').not(':eq(0)').remove();
	
	var html = '';
	$.ajax({
		url:'/master/statistics',
		data:{
			'name' : name
		},
		type: 'post',
		dataType :'json',
		success:function(data){
			for(var i = 0;i<data.length;i++){
				html += '<tr onclick="check('+data[i].fno+')">'+
							'<td>'+data[i].name+'</td>'+
					    	'<td>'+ data[i].address +'</td>'+
					    '</tr>';
			}
			$('#statisticsTable > tbody').append(html);
		},error:function(){
			
		}
	});
}

function check(idx){
	$('#fno').val(idx);
}

function submitcheck(){
	var fno = $('#fno').val();
	if(fno ==null || fno ==''){
		alert('계정명을 선택해주세요');
		return false;
	}
	return true;
}
</script>