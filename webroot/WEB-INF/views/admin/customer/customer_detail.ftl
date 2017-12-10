<div class="modal-block modal-block-md " style="text-align:center">
	<section class="panel">
		<header class="panel-heading">
			<div>
				<h2 class="panel-title">${bean.name}</h2>
			</div>
		</header>
		<div class="panel-body">
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">编号：</label>
				<div class="col-md-6" style="text-align:left;">${bean.id}</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">公司名称：</label>
				<div class="col-md-6" style="text-align:left;">${bean.name}</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">公司code：</label>
				<div class="col-md-6" style="text-align:left;">${bean.code}</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">省：</label>
				<div class="col-md-6" style="text-align:left;">${bean.province}</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">市：</label>
				<div class="col-md-6" style="text-align:left;">${bean.city}</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">行业：</label>
				<div class="col-md-6" style="text-align:left;">${bean.industry_name3}</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">公司性质：</label>
				<div class="col-md-6" style="text-align:left;">${bean.property}</div>
			</div>
			
			
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">办公地：</label>
				<div class="col-md-6" style="text-align:left;">${bean.office}</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">邮编：</label>
				<div class="col-md-6" style="text-align:left;">${bean.zipCode}</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">电话：</label>
				<div class="col-md-6" style="text-align:left;">${bean.phone}</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" style="text-align:right;">公司网址：</label>
				<div class="col-md-6" style="text-align:left;">${bean.webSite}</div>
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
