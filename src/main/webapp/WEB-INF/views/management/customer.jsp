<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<section id="main-content">
	<section class="wrapper">

		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>게시판관리
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>예약게시판</li>
				</ol>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<div class="panel-body">
						
						<table id="customerTable" class="table table-striped table-advance table-hover">
							<tbody>
								<tr>
									<th>No</th>
									<th><i class="icon_calendar"></i> 예약일시</th>
									<th><i class="icon_profile"></i> 고객명</th>
									<th><i class="icon_mobile"></i> 전화번호</th>
									<th><i class="icon_pin_alt"></i> 차종</th>
									<th><i class="icon_pin_alt"></i>서비스명</th>
									<th><i class="icon_pin_alt"></i>내용보기</th>
									<th><i class="icon_cogs"></i> 예약/삭제/확인</th>
								</tr>

								<c:forEach var="customer" items="${customerlist}">
									<tr <c:if test="${customer.readyn eq 'y'}">style="background-color:#e5f6ff;"</c:if>>
										<td>${customer.num}</td>
										<td>${customer.date}</td>
										<td>${customer.name}</td>
										<td>${customer.tel}</td>
										<td>${customer.vehicle}</td>
										<td>${customer.service}</td>
										<td id="title_${customer.num}"><a href="">내용보기</a></td>
										<td>
											<div class="btn-group">
												<a class="btn btn-primary" href="/management/reserveform2?cno=${customer.num}"><i class="icon_plus_alt2"></i></a>
												<a class="btn btn-danger" href="javascript:del2('${customer.num}');"><i class="icon_close_alt2" ></i></a>
												<a class="btn btn-success" href="javascript:confirm2(${customer.num});"><i class="icon_plus_alt2"></i></a>
											</div>
										</td>
									</tr>
									<tr id="content_${customer.num}" style="display: none;">
									<%
									     //치환 변수 선언합니다.
									      pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
									      pageContext.setAttribute("br", "<br/>"); //br 태그
									%> 
										<td colspan="7">${fn:replace(customer.memo ,crcn, br)}</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</section>
				
				<div>
					<nav>
						<ul class="pagination">

							<li><c:if test="${paramInfo.PaginationNum ne  '1'}">
									<a href="javascript:pagination(${paramInfo.PaginationNum-1});"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a>
								</c:if></li>

							<c:forEach var="idx" begin="${paramInfo.startPage}"
								end="${paramInfo.endPage}">
								<c:choose>
									<c:when test="${idx == paramInfo.PaginationNum}">
										<li class="active"><a
											href='javascript:pagination(${idx});'>${idx}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href='javascript:pagination(${idx});'>${idx}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<li><c:if test="${paramInfo.PaginationNum ne  paramInfo.paginationTotal}">
									<a href="javascript:pagination(${paramInfo.PaginationNum+1});" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>
								</c:if></li>

						</ul>
					</nav>
				</div>
				
			</div>
		</div>
	</section>
</section>
<script>
$("#customerTable > tr > td:eq(7)").tooltip();


function del2(idx){
	var letitgo = confirm('삭제하시겠습니까?')
	if(letitgo){
		var $form = $('<form></form>');
		$form.attr('action', '/management/customerDelete');
	    $form.attr('method', 'post');
	    $form.appendTo('body');
	    
	    var idx = $('<input type="hidden" name="idx" value="'+idx+'">');
	    $form.append(idx);
	    $form.submit();
	
	}
}


function pagination(idx) {
	var $form = $('<form></form>');
	$form.attr('action', '/management/customer');
    $form.attr('method', 'post');
    $form.appendTo('body');
    
    var qna = $('<input type="hidden" name="qnalist" value="${paramInfo.qnalist}">');
    var sch = $('<input type="hidden" name="search" value="${paramInfo.search}">');
    var PaginationNum = $('<input type="hidden" name="PaginationNum" value="'+idx+'">');
    $form.append(qna).append(sch).append(PaginationNum);
    $form.submit();
}

$('[id^=title]').on('click',function(e){
	var idx = this.id.replace('title_','');
	$('#content_'+idx).slideToggle('fast');
	e.preventDefault();
});

function confirm2(idx){
	$.ajax({
		url:'/management/confirmRequest',
		data:{ 
			'idx' : idx
		},
		type: "post",
		dataType :'text',
		success:function(){
			alert('확인되었습니다.');
		},error:function(){
			
		}
			
	});
}
</script>