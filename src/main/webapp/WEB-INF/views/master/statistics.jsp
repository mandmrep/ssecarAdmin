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
		
		<form class="form-horizontal" action="/master/statisticsDetail" method="post">
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="pull-left">조회기간</div>
							<div class="clearfix"></div>
						</div>
						<div class="panel-body">
							<label class="control-label col-lg-2">기간조회</label>
							<div class="col-lg-5">
								<input type="text" id="startDate" name="startDate" class="form-control" readonly="readonly">
							</div>
							<div class="col-lg-5">
								<input type="text" id="endDate" name="endDate" class="form-control" readonly="readonly">
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				
				<section class="panel">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="pull-left">지점명검색</div>
							<div class="clearfix"></div>
						</div>
						<div class="panel-body">
							<div class="padd">
								<div class="form quick-post">
								
									<div class="form-group">
										<label class="control-label col-lg-2">조회조건</label>
										<div class="col-lg-10">
											<select id="path" name="path" class="form-control" required="required">
												<option value="">선택하세요</option>
												<option value="customer">회원가입경로</option>
												<option value="reservation">예약경로</option>
											</select>
										</div>											
									</div>	
									
									<div class="form-group">
										<label class="control-label col-lg-2">지점명</label>
										<div class="col-lg-9">
											<input type="text" id="name" name="name" class="form-control" placeholder="지점명을 입력해주세요.">
										</div>
										<div class="col-lg-1">
											<button type="button" class="btn btn-default" onclick="getFrachiseList()">검색</button>
										</div>
									</div>				
									
									<div class="form-group">
										<label class="control-label col-lg-2">검색값</label>
										<div class="col-lg-10">
											<input type="hidden" id="fno" name="fno" class="form-control">
											<input type="text" id="justlook" name="justlook" class="form-control" readonly="readonly">
										</div>
									</div>
									
									<div class="form-group">
										<div class="col-lg-12">
											<div class="pull-right">
												<button type="submit" class="btn btn-primary form-control">조회</button>
											</div>
										</div>	
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<div class="panel-body">
						<table id="statisticsTable" class="table table-striped table-advance">
							<tbody>
								<tr style="background-color: red;">
									<th><i class="icon_calendar"></i> 계정명</th>
									<th><i class="icon_calendar"></i> 주소</th>
								</tr>
								<c:forEach var="f" items="${franchiseList }">
									<tr onclick="check('${f.name}','${f.fno}')" style="cursor:pointer;">
										<td><a>${f.name}</a></td>
										<td>${f.address}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</section>	
			</div>
		</div>
		
		
		
		</form>
		
	</section>
</section>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<script>

	
	
//datepicker
$('#startDate,#endDate').daterangepicker(singleoption);
   
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
				html += '<tr onclick="check(\'' + $.trim(data[i].name) +'\',\'' + data[i].fno +'\')">'+
							'<td><a>'+data[i].name+'</a></td>'+
					    	'<td>'+ data[i].address +'</td>'+
					    '</tr>';
			}/* "insertMyparking(\''+positions.PK_ID+'\',\''+addr+'\')" */
			$('#statisticsTable > tbody').append(html);
		},error:function(){
			
		}
	});
}

function check(name,fno){
	$('#fno').val(fno);
	$('#justlook').val(name);
}

$('#name').on('keydown',function(e){
	if(e.keyCode=='13'){
		getFrachiseList();
		e.preventDefault();
		return false;
	}
});

</script>