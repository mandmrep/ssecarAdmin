<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.search_qna{
	height: 30px; 
	margin: 10px 10px 10px; 
	border: 1px solid #dddddd; 
	border-radius: 5px;
	width: 100px;
}
#search_div{
	float: right;
}
.search_btn{
	height: 30px; 
	margin: 10px 10px 10px; 
	border: 1px solid #dddddd; 
	border-radius: 5px;
}
</style>
<section id="main-content">
	<section class="wrapper">

		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>관리시스템
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>매출관리(월매출)</li>
				</ol>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				
				<section class="panel">
					
					<form>
						<div id="search_div" >
							<select id="year" name="year" class="search_qna" required="required">
								<option value="">년도선택</option>
								<c:forEach var="year" items="${years}">
									<option value="${year.year}">${year.year}년</option>
								</c:forEach>
							</select>
							<select id="division" name="division" class="search_qna" required="required">
								<option value="">매출구분</option>
								<option value="서비스">서비스</option>
								<option value="제품 ">제품</option>
								<option value="all">전체매출</option>
							</select>
							<button type="button" class="search_btn" onclick="search()">검색</button>
						</div>
					</form>
					
					<div class="panel-body">
						<table id="yearTable" class="table table-striped table-advance table-hover">
							<tbody>
								<tr>
									<th><i class="icon_calendar"></i> 일자</th>
									<th><i class="icon_calendar"></i> 월별NO</th>
									<th><i class="icon_calendar"></i> 카드</th>
									<th><i class="icon_calendar"></i> 현금</th>
									<th><i class="icon_mail_alt"></i> 기타(소셜/쿠폰)</th>
									<th><i class="icon_mail_alt"></i> 합계</th>
								</tr>

								<c:forEach var="year" items="${yearSales}">
									<tr>
										<td>${year.year}</td>
										<td>${year.cnt}</td>
										<td>${year.card}</td>
										<td>${year.cash}</td>
										<td>${year.etc}</td>
										<td>${year.total}</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>

					</div>
				</section>
			</div>
		</div>
	</section>
</section>
<script>
	function search(){
		var year = $('#year').val();
		var division = $('#division').val();
		
		if(year.length <= 0){
			alert('월을 선택해주세요.');
			return false;
		}
		
		if(division.length <= 0){
			alert('매출구분을 선택해주세요.');
			return false;
		}
		
		$('#yearTable > tbody > tr').not(':eq(0)').remove();
		
		var html = '';
		$.ajax({
			url:'/management/month',
			data:{ 
				'year' : year,
				'division' : division
			},
			type: 'post',
			dataType :'json',
			success:function(data){
				for(var i = 0;i<data.length;i++){
					html += '<tr>'+
								'<td>'+data[i].year+'</td>'+
								'<td>'+data[i].cnt+'</td>'+
						    	'<td>'+data[i].card+'</td>'+
						    	'<td>'+data[i].cash+'</td>'+
						    	'<td>'+data[i].etc +'</td>'+
						    	'<td>'+data[i].total+'</td>'+
						    '</tr>';
				}
				$('#yearTable').append(html);
			},error:function(){
				
			}
		});
	}
</script>