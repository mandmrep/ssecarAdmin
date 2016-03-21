<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
        
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-laptop"></i>Nano-Quartz Serial Register</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i>���� ���� ���</li>
					</ol>
				</div>
			</div>

            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        
                        <div class="panel-body">
                            <form class="form-horizontal" method="post" action="/nano/regist">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">�ø���ѹ�</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="serialnumber" pattern=".{10,10}" required title="10�ڸ��� �Է����ּ���">
                                    </div>
                                </div>

						  <div class="form-group">
                                    <label class="col-sm-2 control-label">�ð���</label>
                                    <div class="col-sm-10">
                                         <input type="text" class="form-control" id="date" name="date" readonly="readonly">
                                    </div>
                                </div>

						  <div class="form-group">
                                    <label class="col-sm-2 control-label">�ð���</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="store" value="${registForm.name}" readonly="readonly">
                                    </div>
                                </div>

						  <div class="form-group">
                                    <label class="col-sm-2 control-label">����</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="customer" maxlength="10" required>
                                    </div>
                                </div>

						  <div class="form-group">
                                    <label class="col-sm-2 control-label">������ó</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="tel" pattern='[0-9]{9,11}' placeholder="������ ���� ���ڸ� �Է��� �ּ���." required>
                                    </div>
                                </div>

						  <div class="form-group">
                                    <label class="col-sm-2 control-label">����(�𵨸�)</label>
                                    <div class="col-sm-10">
                                        <input type="hidden" id="manufacturer" name="manufacturer">
										<input type="hidden" id="vehicle" name="vehicle" required="required" readonly="readonly" >
										<input type="text" id="car" name="car" required="required" readonly="readonly" class="form-control" data-toggle="modal" data-target="#myModal">
                                    </div>
                                </div>

						  <div class="form-group">
                                    <label class="col-sm-2 control-label">����</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="color" maxlength="10">
                                    </div>
                                </div>

						  <div class="form-group">
                                    <label class="col-sm-2 control-label">������ȣ</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="number" maxlength="13" required>
                                    </div>
                                </div>

						  <div class="form-group">
                                    <label class="col-sm-2 control-label">���</label>
                                    <div class="col-sm-10">
                                         <input type="text" class="form-control" name="memo" maxlength="50" placeholder="50�� �̳��� �����ּ���">
                                    </div>
                                </div>
                                
						   <!-- Buttons -->
                                <div class="form-group">
									  <div class="col-lg-offset-2 col-lg-9">
										  <button type="submit" class="btn btn-primary">���</button>
										  <button type="button" class="btn btn-danger" onclick="javascript:history.back()">���</button>
									  </div>
                                 </div>

                            </form>
                        </div>
                    </section>
                   </div>
		</div>
	</section>
</section>

<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">�������</h4>
      </div>
      <div class="modal-body">
      <form id="vehicleForm" class="form-horizontal">
      
      	<div class="form-group">
			<label class="control-label col-lg-2" for="tags">������</label>
			<div class="col-lg-10">
				<select id="menu_1" class="form-control" onchange="getautomobile(this.value)">
		      		<option value="">�����ϼ���</option>
		        	<c:forEach var="brand" items="${manufacturer}">
						<option value="${brand.num}">${brand.brand}</option>
					</c:forEach>
        		</select>
			</div>
		</div>
      	
      	<div class="form-group">
			<label class="control-label col-lg-2" for="tags">����</label>
			<div class="col-lg-10">
				<select id="menu_2" class="form-control"></select>
			</div>
		</div>
        
      </form>
        
      </div>
      <div class="modal-footer">
      	<button type="button" onclick="vehicle()" class="btn btn-default">���</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<!--main content end-->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<script>
	//datepicker
	$('#date').daterangepicker(singleoption);
	
	function getautomobile(manufacturer){
		$('#menu_2').html('');
		$.ajax({
			url:'/management/getautomobile',
			data:{ 'manufacturer' : manufacturer },
			type: "post",
			dataType :'json',
			success:function(data){
				$.each(data, function( index, value ) {
					$('#menu_2').append($('<option/>', { value: value.num , text : value.name }) );
				});
			},error:function(){
				
			}	
		});
	}
	
	function vehicle(){
		var manu = $('#menu_1').val();
		var carvalue = $('#menu_2').val();
		var carname = $('#menu_2 option:selected').text();
		$('#manufacturer').val(manu);
		$('#vehicle').val(carvalue);
		$('#car').val(carname);
		$('#myModal').modal('hide');
	}
	
	function check(){
		if($('#temp').val()==null || $('#temp').val()==''){
			alert('������ �������ּ���.');
			return false;
		}
		return true;
	}
</script>
