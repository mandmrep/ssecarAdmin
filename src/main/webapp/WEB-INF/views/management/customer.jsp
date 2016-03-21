<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section id="main-content">
	<section class="wrapper">


		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<div class="panel-body">
					
						<div id="search_div" style="margin-bottom: 10px;">
							<a href="/management/reservation" class="btn btn-default">예약 게시판으로 이동</a>
						</div>
						
						<table id="customerTable" class="table table-striped table-advance table-hover">
							<tbody>
								<tr>
									<th>#</th>
									<th><i class="icon_calendar"></i> 예약일시</th>
									<th><i class="icon_profile"></i> 고객명</th>
									<th><i class="icon_mobile"></i> 전화번호</th>
									<th><i class="icon_pin_alt"></i> 차종</th>
									<th><i class="icon_pin_alt"></i>서비스명</th>
									<th><i class="icon_pin_alt"></i> 비고</th>
									<th><i class="icon_cogs"></i> 삭제</th>
								</tr>

								<c:forEach var="customer" items="${customerlist}">
									<tr>
										<td>${customer.num}</td>
										<td>${customer.date}</td>
										<td>${customer.name}</td>
										<td>${customer.tel}</td>
										<td>${customer.vehicle}</td>
										<td>${customer.service}</td>
										<td><a href="#" data-toggle="tooltip" title="${customer.memo}">비고</a></td>
										
										<td>
											<div class="btn-group">
												<a class="btn btn-danger" href="javascript:del(${customer.num});"><i class="icon_close_alt2"></i></a>
											</div>
										</td>
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


function del(idx){
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
</script>