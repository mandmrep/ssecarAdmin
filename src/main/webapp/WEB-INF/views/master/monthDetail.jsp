<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.search_qna{
	height: 30px; 
	margin: 10px 10px 10px; 
	border: 1px solid #dddddd; 
	border-radius: 5px; 	
}
#search_div{
	float: right;
}
</style>
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> master메뉴
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>연매출관리</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<form action="/master/monthDetail" method="post">
						<input type="hidden" name="fno" value="${ paramInfo.fno }">
						<div class="btn-group" role="group" aria-label="..." style="margin: 10px 10px 10px; ">
							  <button type="button" class="btn btn-default" onclick="location.href='/master/sales';">일매출</button>
							  <button type="button" class="btn btn-default" onclick="location.href='/master/day';">월매출</button>
							  <button type="button" class="btn btn-default active">연매출</button>
						</div>
						<div id="search_div" >
							<select name="year" class="search_qna" style="width: 100px;" required="required">
								<option value="">선택하세요</option>
								<option value="2015">2015</option>
								<option value="2016">2016</option>
								<option value="2017">2017</option>
								<option value="2018">2018</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
								
							</select>
							<select name="division" class="search_qna" style="width: 100px;">
								<option value="">선택하세요</option>
								<option value="서비스">서비스</option>
								<option value="제품">제품</option>
							</select>
							<button type="submit" class="search_qna">검색</button>
						</div>
					</form>
					
					<table class="table table-striped table-advance table-hover">
						<tbody>
							<tr>
								<th><i class="icon_calendar"></i> 일자</th>
								<th><i class="icon_calendar"></i> 카드</th>
								<th><i class="icon_calendar"></i> 현금</th>
								<th><i class="icon_calendar"></i> 온라인</th>
								<th><i class="icon_calendar"></i> 소셜</th>
								<th><i class="icon_mail_alt"></i>월 합계</th>
							</tr>

							<c:forEach var="month" items="${monthList}">
								<tr>
									<td>${month.year}</td>
									<td>${month.card}</td>
									<td>${month.cash}</td>
									<td>${month.online}</td>
									<td>${month.social}</td>
									<td>${month.total}</td>
								</tr>
							</c:forEach>
							<tr>
								<td>합계</td>
								<td>${monthTotal.card}</td>
								<td>${monthTotal.cash}</td>
								<td>${monthTotal.online}</td>
								<td>${monthTotal.social}</td>
								<td>${monthTotal.total}</td>
							</tr>
						</tbody>
					</table>
				</section>

			</div>
		</div>
		<hr>
	</section>
</section>
<script>
$("#customerTable > tr > td:eq(7)").tooltip();

function pagination(idx) {
	var $form = $('<form></form>');
	$form.attr('action', '/master/salesDetail');
    $form.attr('method', 'post');
    $form.appendTo('body');
    
    var fno = $('<input type="hidden" name="fno" value="${paramInfo.fno}">');
    var qnalist = $('<input type="hidden" name="qnalist" value="${paramInfo.qnalist}">');
    var search = $('<input type="hidden" name="search" value="${paramInfo.search}">');
    var PaginationNum = $('<input type="hidden" name="PaginationNum" value="'+idx+'">');
    $form.append(PaginationNum).append(qnalist).append(search).append(fno);
    $form.submit();
}
</script>