 <%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i>FRANCHISE
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i>지점등록</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<div class="panel-body">
					<form role="form" class="form-horizontal" method="post" action="/franchise/regist" onsubmit="setServiceTotal()" enctype="multipart/form-data">
						<input type="hidden" id="serviceTotal" name="serviceTotal">
					
						<div class="form-group">
							<label class="col-sm-2 control-label">지역</label>
							<div class="col-sm-10">
								<select class="form-control" name="area" required="required">
									<option value="">선택하세요</option>
									<option value="서울">서울</option>
									<option value="인천">인천</option>
									<option value="경기">경기</option>
									<option value="강원">강원</option>
									<option value="대구">대구</option>
									<option value="대전">대전</option>
									<option value="부산">부산</option>
									<option value="광주">광주</option>
									<option value="제주">제주</option>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">구분</label>
							<div class="col-sm-10">
								<select class="form-control" name="division" required="required">
									<option value="">선택하세요</option>
									<option value="s">쌔카S</option>
									<option value="m">M8</option>
									<option value="r">쌔카직영</option>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">지점명</label>
							<div class="col-sm-10">
								<input type="text" name="name" class="form-control" required="required">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">지점명(영문)</label>
							<div class="col-sm-10">
								<input type="text" name="name_en" class="form-control" required="required">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">주소</label>
							<div class="col-sm-10">
								<input type="text" name="address" class="form-control" required="required">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">전화번호</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="tel" id="tel" pattern='[0-9]{9,11}' title='전화번호를 정확하게 입력하세요.' required="required">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">오픈시간</label>
							<div class="col-sm-10">
								<select class="form-control" name="opentime" required="required">
									<option value="">선택하세요</option>
									<option value="8:00">8:00</option>
									<option value="9:00">9:00</option>
									<option value="10:00">10:00</option>
									<option value="11:00">11:00</option>
									<option value="12:00">12:00</option>
									<option value="13:00">13:00</option>
									<option value="14:00">14:00</option>
									<option value="15:00">15:00</option>
									<option value="16:00">16:00</option>
								</select> 
								
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">마감시간</label>
							<div class="col-sm-10">
								<select class="form-control" name="closetime" required="required">
									<option value="">선택하세요</option>
									<option value="16:00">16:00</option>
									<option value="17:00">17:00</option>
									<option value="18:00">18:00</option>
									<option value="19:00">19:00</option>
									<option value="20:00">20:00</option>
									<option value="21:00">21:00</option>
									<option value="22:00">22:00</option>
									<option value="23:00">23:00</option>
									<option value="24:00">24:00</option>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">연휴</label>
							<div class="col-sm-10">
								<input type="text" name="holyday" class="form-control" maxlength="20" required="required">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">동시작업수</label>
							<div class="col-sm-10">
								<select class="form-control" name="capacity">
									<option value="">선택하세요</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10대 이상">10대 이상</option>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-lg-2 control-label">주차가능대수</label>
							<div class="col-lg-10">
								<select class="form-control" name="parking">
									<option value="">선택하세요</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-lg-2 control-label">맵 설정</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" name="map" placeholder="iframe링크를 복사해주세요." required="required">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">서비스 선택</label>
							<div class="col-sm-10">
								<label><input type="checkbox" name="service" value="1"> 네일아트</label>
								<label><input type="checkbox" name="service" value="2"> 주차가능</label>
								<label><input type="checkbox" name="service" value="3"> 이벤트</label>
								<label><input type="checkbox" name="service" value="4"> 키즈카페</label>
								<label><input type="checkbox" name="service" value="5"> 커피숍</label>
								<label><input type="checkbox" name="service" value="6"> 사우나</label>
								<label><input type="checkbox" name="service" value="7"> 자동차수리</label>
								<label><input type="checkbox" name="service" value="8"> 스킨케어</label>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">이미지 등록</label>
							<div class="col-sm-10">
								<input type="file" name="imga"><br>
								<input type="file" name="imgb" ><br>
								<input type="file" name="imgc" ><br>
								<input type="file" name="imgd" >
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-lg-12">
								<input type="submit" class="btn btn-lg btn-primary" value="등록">
								<button type="button" class="btn btn-lg btn-danger" onclick="javascript:history.back();">취소</button>
							</div>
						</div>

					</form>
					</div>

				</section>
			</div>
		</div>
		<!-- page end-->
	</section>
</section>
<!--main content end-->
	
<script type="text/javascript">
	function setServiceTotal(){
		$('#serviceTotal').val( $('input:checkbox[name=service]').length );
	}
</script>
