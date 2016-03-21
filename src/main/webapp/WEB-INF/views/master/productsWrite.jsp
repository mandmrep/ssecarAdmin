<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section id="main-content">
	<section class="wrapper">
		
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>MASTER메뉴
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>상품등록</li>
				</ol>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="pull-left">작성 폼</div>
							<div class="clearfix"></div>
						</div>
						<div class="panel-body">
							<div class="padd">
								<div class="form quick-post">
									<form class="form-horizontal" action="/master/productswriteAction" method="post">

										<div class="form-group">
											<label class="control-label col-lg-2" for="title">상품번호</label>
											<div class="col-lg-10">
												<input type="text" id="code" name="code" class="form-control" maxlength="50">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2">상품명</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" id="name" name="name" maxlength="50" required="required">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">구분</label>
											<div class="col-lg-10">
												<select id="division" name="division" class="form-control" required="required">
													<option value="">선택하세요</option>
													<option value="서비스">서비스</option>
													<option value="제품">제품</option>
												</select>  
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">가격</label>
											<div class="col-lg-10">
												<input type="text" id="price" name="price" class="form-control" pattern='[0-9]{1,20}' required="required">
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">색상</label>
											<div class="col-lg-10">
												<select id="color" name="color" required="required" class="form-control">
													<option value="">선택하세요</option>
													<option value="red">빨강</option>
													<option value="orange">주황</option>
													<option value="yellow">노랑</option>
													<option value="green">초록</option>
													<option value="blue">파랑</option>
													<option value="navy">남색</option>
													<option value="purple">보라</option>
												</select>
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-lg-2" for="tags">비고</label>
											<div class="col-lg-10">
												<input type="text" id="memo" name="memo" class="form-control" maxlength="100">
											</div>
										</div>
										
										<!-- Buttons -->
										<div class="form-group">
											<div class="col-lg-offset-2 col-lg-9">
												<button type="submit" class="btn btn-primary">등록</button>
												<button type="button" class="btn btn-danger" onclick="javascript:history.back();">취소</button>
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
		
	</section>
</section>