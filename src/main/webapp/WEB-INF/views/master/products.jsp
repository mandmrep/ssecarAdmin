<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<i class="fa fa-laptop"></i>master 메뉴
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>상품관리</li>
				</ol>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				
				<section class="panel">
					<form action="/master/products" method="post">
						<div id="search_div" >
							<select id="division" name="division" class="search_qna" required="required">
								<option value="">검색구분</option>
								<option value="name">상품명</option>
							</select>
							<input type="text" id="search" name="search" class="search_qna" style="width:200px;">
							<button type="submit" class="search_btn">검색</button>
						</div>
					</form>
					<div class="panel-body">
						<table id="salesTable" class="table table-striped table-advance table-hover">
							<tbody>
								<tr>
									<th>#</th>
									<th><i class="icon_calendar"></i> 상품번호</th>
									<th><i class="icon_calendar"></i> 상품명</th>
									<th><i class="icon_calendar"></i> 구분</th>
									<th><i class="icon_mail_alt"></i> 가격</th>
									<th><i class="icon_mail_alt"></i> 비고</th>
									<th><i class="icon_cogs"></i>삭제</th>
								</tr>

								<c:forEach var="product" items="${productsList}">
									<tr>
										<td>${product.num}</td>
										<td>${product.code}</td>
										<td>${product.name}</td>
										<td>${product.division}</td>
										<td>${product.price}</td>
										<td><a href="#" data-toggle="tooltip" title="${product.memo}">비고</a></td>
										<td>
											<div class="btn-group">												
												<a class="btn btn-danger" href="javascript:del(${product.num});"><i class="icon_close_alt2"></i></a>
											</div>
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>


					</div>
				</section>
				
				<div>
					<a class="btn btn-danger btn-lg" href="/master/productsWrite" style="float: right; margin-top: -15px;">등록</a>
					<nav>
						<ul class="pagination">

							<li>
								<c:if test="${paramInfo.PaginationNum ne  '1'}">
									<a href="javascript:pagination(${paramInfo.PaginationNum-1});" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
								</c:if>
							</li>

							<c:forEach var="idx" begin="${paramInfo.startPage}" end="${paramInfo.endPage}">
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

							<li>
								<c:if test="${paramInfo.PaginationNum ne  paramInfo.paginationTotal}">
									<a href="javascript:pagination(${paramInfo.PaginationNum+1});" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>
								</c:if>
							</li>

						</ul>
					</nav>
				</div> 
			</div>
		</div>
	</section>
</section>
<script>

$("#salesTable > tr > td:eq(7)").tooltip();

function del(idx){
	var letitgo = confirm('삭제하시겠습니까?');
	if(letitgo){
		window.location = '/master/productsDelete/'+idx;	
	}
}

function pagination(idx) {
	var $form = $('<form></form>');
	$form.attr('action', '/master/products');
    $form.attr('method', 'post');
    $form.appendTo('body');
    
    var division = $('<input type="hidden" name="division" value="${paramInfo.division}">');
    var search = $('<input type="hidden" name="search" value="${paramInfo.search}">');
    var PaginationNum = $('<input type="hidden" name="PaginationNum" value="'+idx+'">');
    $form.append(PaginationNum).append(division).append(search);
    $form.submit();
}
</script>