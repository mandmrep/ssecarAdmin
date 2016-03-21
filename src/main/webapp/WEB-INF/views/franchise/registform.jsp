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
					<li><i class="fa fa-home"></i>�������</li>
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
							<label class="col-sm-2 control-label">����</label>
							<div class="col-sm-10">
								<select class="form-control" name="area" required="required">
									<option value="">�����ϼ���</option>
									<option value="����">����</option>
									<option value="��õ">��õ</option>
									<option value="���">���</option>
									<option value="����">����</option>
									<option value="�뱸">�뱸</option>
									<option value="����">����</option>
									<option value="�λ�">�λ�</option>
									<option value="����">����</option>
									<option value="����">����</option>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">����</label>
							<div class="col-sm-10">
								<select class="form-control" name="division" required="required">
									<option value="">�����ϼ���</option>
									<option value="s">��īS</option>
									<option value="m">M8</option>
									<option value="r">��ī����</option>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">������</label>
							<div class="col-sm-10">
								<input type="text" name="name" class="form-control" required="required">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">������(����)</label>
							<div class="col-sm-10">
								<input type="text" name="name_en" class="form-control" required="required">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">�ּ�</label>
							<div class="col-sm-10">
								<input type="text" name="address" class="form-control" required="required">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">��ȭ��ȣ</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="tel" id="tel" pattern='[0-9]{9,11}' title='��ȭ��ȣ�� ��Ȯ�ϰ� �Է��ϼ���.' required="required">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">���½ð�</label>
							<div class="col-sm-10">
								<select class="form-control" name="opentime" required="required">
									<option value="">�����ϼ���</option>
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
							<label class="col-sm-2 control-label">�����ð�</label>
							<div class="col-sm-10">
								<select class="form-control" name="closetime" required="required">
									<option value="">�����ϼ���</option>
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
							<label class="col-sm-2 control-label">����</label>
							<div class="col-sm-10">
								<input type="text" name="holyday" class="form-control" maxlength="20" required="required">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">�����۾���</label>
							<div class="col-sm-10">
								<select class="form-control" name="capacity">
									<option value="">�����ϼ���</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10�� �̻�">10�� �̻�</option>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-lg-2 control-label">�������ɴ��</label>
							<div class="col-lg-10">
								<select class="form-control" name="parking">
									<option value="">�����ϼ���</option>
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
							<label class="col-lg-2 control-label">�� ����</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" name="map" placeholder="iframe��ũ�� �������ּ���." required="required">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">���� ����</label>
							<div class="col-sm-10">
								<label><input type="checkbox" name="service" value="1"> ���Ͼ�Ʈ</label>
								<label><input type="checkbox" name="service" value="2"> ��������</label>
								<label><input type="checkbox" name="service" value="3"> �̺�Ʈ</label>
								<label><input type="checkbox" name="service" value="4"> Ű��ī��</label>
								<label><input type="checkbox" name="service" value="5"> Ŀ�Ǽ�</label>
								<label><input type="checkbox" name="service" value="6"> ��쳪</label>
								<label><input type="checkbox" name="service" value="7"> �ڵ�������</label>
								<label><input type="checkbox" name="service" value="8"> ��Ų�ɾ�</label>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">�̹��� ���</label>
							<div class="col-sm-10">
								<input type="file" name="imga"><br>
								<input type="file" name="imgb" ><br>
								<input type="file" name="imgc" ><br>
								<input type="file" name="imgd" >
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-lg-12">
								<input type="submit" class="btn btn-lg btn-primary" value="���">
								<button type="button" class="btn btn-lg btn-danger" onclick="javascript:history.back();">���</button>
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
