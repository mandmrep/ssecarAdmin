<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
strong{
	padding-right: 30px;
}
</style>
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!--overview start-->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>���� �ý���
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>�� �󼼳���</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<div class="panel-heading" style="text-align: right;">�ۼ���:${clientDetail.regdate}</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-3">
								<p><strong>����ȣ</strong>${clientDetail.num}</p>
							</div>
							<div class="col-lg-3">
								<p><strong>����</strong>${clientDetail.name}</p>
							</div>
							<div class="col-lg-3">
								<p><strong>����</strong>${clientDetail.vehicle}</p>
							</div>
							<div class="col-lg-3">
								<p><strong>������ȣ</strong>${clientDetail.carnumber}</p>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-3">
								<p><strong>�����</strong>${clientDetail.birthday}</p>
							</div>
							<div class="col-lg-3">
								<p><strong>����ó</strong>${clientDetail.tel}</p>
							</div>
							<div class="col-lg-3">
								<p><strong>����</strong>${clientDetail.color}</p>
							</div>
							<div class="col-lg-3">
								<p><strong>�湮����</strong>${clientDetail.motivation}</p>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-12">
								<p><strong>�������</strong><br>${clientDetail.store}</p>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-12">
								<p><strong>�����ڸ޸�</strong><br>${clientDetail.memo}</p>
							</div>
						</div>
						
						

					</div>
					<div class="panel-footer" style="text-align: right;">
						<form id="reform" action="/master/reserveform" method="post">
							<input type="hidden" name="num" value="${clientDetail.num}"/>
							<input type="hidden" name="name" value="${clientDetail.name}"/>
							<input type="hidden" name="fno" value="${clientDetail.fno}"/>
							<input type="hidden" name="tel" value="${clientDetail.tel}"/>
						</form>
						<a class="btn btn-lg btn-danger" href="javascript:goReserve();">����</a>
						<a class="btn btn-lg btn-primary" href="javascript:history.back();">���</a>
					</div>
				</section>

			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<div class="panel-body">
						<table id="clientTable" class="table table-striped table-advance table-hover">
							<tbody>
								<tr>
									<th>����No</th>
									<th><i class="icon_calendar"></i> �湮����</th>
									<th><i class="icon_calendar"></i> ����/��ǰ��</th>
									<th><i class="icon_calendar"></i> �湮����</th>
									<th><i class="icon_profile"></i> ī��</th>
									<th><i class="icon_mobile"></i> ����</th>
									<th><i class="icon_mobile"></i>�¶���</th>
									<th><i class="icon_mobile"></i>�Ҽ�</th>
									<th><i class="icon_mobile"></i>����</th>
									<th><i class="icon_pin_alt"></i>�հ�</th>
									<th><i class="icon_pin_alt"></i>���</th>
								</tr>

								<c:forEach var="clientSale" items="${clientSales}">
									<tr>
										<td>${clientSale.num}</td>
										<td>${clientSale.date}</td>
										<td>${clientSale.name}</td>
										<td>${clientSale.fname}</td>
										<td>${clientSale.card}</td>
										<td>${clientSale.cash}</td>
										<td>${clientSale.online}</td>
										<td>${clientSale.social}</td>
										<td>${clientSale.coupon}</td>
										<td>${clientSale.total}</td>
										<td><a href="#" data-toggle="tooltip" title="${clientSale.memo}">���</a></td>
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
$("#clientTable > tr > td:eq(8)").tooltip();

function pagination(idx) {
	var $form = $('<form></form>');
	$form.attr('action', '/management/client/${clientDetail.num}');
    $form.attr('method', 'post');
    $form.appendTo('body');
    
    var PaginationNum = $('<input type="hidden" name="PaginationNum" value="'+idx+'">');
    $form.append(PaginationNum);
    $form.submit();
}

function goReserve(){
	$('#reform').submit();
	//GET��� �ѱ� �Ķ���� �ѱ�� ���ڵ�	/master/reserveform?name='+encodeURI(name, 'UTF-8')
}
</script>