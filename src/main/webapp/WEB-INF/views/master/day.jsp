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
					<li><i class="fa fa-home"></i>월매출관리</li>
				</ol>
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
									<form class="form-horizontal" action="/master/day" method="post">

										<div class="form-group">
											<div class="col-lg-11">
												<input type="text" id="name" name="name" class="form-control" placeholder="계정명을 입력해주세요." required="required"> 
											</div>
											<div class="col-lg-1">
												<button type="submit" class="btn btn-default">검색</button>
											</div>
										</div>						
									</form>
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
						<table id="accountTable" class="table table-striped table-advance table-hover">
							<tbody>
								<tr>
									<th><i class="icon_calendar"></i> 계정명</th>
									<th><i class="icon_calendar"></i> 주소</th>
								</tr>
								
								<c:forEach var="franchise" items="${franchiseList}">
									<tr onclick="detail('${franchise.fno}')">
										<td>${franchise.name}</td>
										<td>${franchise.address}</td>
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
	function detail(idx){
		var $form = $('<form></form>');
		$form.attr('action', '/master/dayDetail');
	    $form.attr('method', 'post');
	    $form.appendTo('body');
	    
	    var idx = $('<input type="hidden" name="fno" value="'+idx+'">');
	    $form.append(idx);
	    $form.submit();
	}
</script>