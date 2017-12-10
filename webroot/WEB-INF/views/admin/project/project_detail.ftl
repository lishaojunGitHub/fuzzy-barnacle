<div class="modal-block modal-block-md " style="text-align:center">
	<section class="panel">
		<header class="panel-heading">
			<div>
				<h2 class="panel-title">${bean.name}</h2>
			</div>
		</header>
		<div class="panel-body">
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">项目名称：</label>
				<div class="col-md-8" style="text-align:left;">${bean.name}</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">客户名称：</label>
				<div class="col-md-8" style="text-align:left;">${bean.customerName}</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">项目CODE：</label>
				<div class="col-md-8" style="text-align:left;">${bean.code}</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">征信代码：</label>
				<div class="col-md-8" style="text-align:left;">${bean.creditCode}</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">名称：</label>
				<div class="col-md-8" style="text-align:left;">${bean.S_INFO_NAME}</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">评级费用（万）：</label>
				<div class="col-md-8" style="text-align:left;">${bean.ratingCost}</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">跟踪费用（万）：</label>
				<div class="col-md-8" style="text-align:left;">${bean.tailRatingCost}</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">债券类型1：</label>
				<div class="col-md-8" style="text-align:left;">${bean.bondType1}</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">债券类型2：</label>
				<div class="col-md-8" style="text-align:left;">${bean.bondType2}</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">合同签订日期：</label>
				<div class="col-md-8" style="text-align:left;">${bean.contractTime}</div>
			</div>
			
			
			
		</div>
		<footer class="panel-footer">
			<div class="row">
				<div class="col-md-12 text-right">
					<button class="btn btn-default modal-dismiss">关闭</button>
				</div>
			</div>
		</footer>
	</section>
</div>
<script type="text/javascript">
	$(document).on('click', '.modal-dismiss', function (e) {
		e.preventDefault();
		$.magnificPopup.close();
	});
</script>        
