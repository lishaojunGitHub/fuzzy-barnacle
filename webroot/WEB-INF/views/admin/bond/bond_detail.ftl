<div class="modal-block modal-block-md " style="text-align:center">
	<section class="panel">
		<header class="panel-heading">
			<div>
				<h2 class="panel-title">${bean.B_INFO_FULLNAME}</h2>
			</div>
		</header>
		<div class="panel-body">
			<div class="form-group">
				<label class="col-md-6 control-label" style="text-align:right;">债券简码：</label>
				<div class="col-md-4" style="text-align:left;">${bean.S_INFO_WINDCODE}</div>
			</div>
			<div class="form-group">
				<label class="col-md-6 control-label" style="text-align:right;">债券简称：</label>
				<div class="col-md-4" style="text-align:left;">${bean.B_INFO_FULLNAME}</div>
			</div>
			<div class="form-group">
				<label class="col-md-6 control-label" style="text-align:right;">发行者：</label>
				<div class="col-md-4" style="text-align:left;">${bean.B_INFO_ISSUER}</div>
			</div>
			<div class="form-group">
				<label class="col-md-6 control-label" style="text-align:right;">票面利率：</label>
				<div class="col-md-4" style="text-align:left;">${bean.B_INFO_COUPONRATE}</div>
			</div>
			<div class="form-group">
				<label class="col-md-6 control-label" style="text-align:right;">名称：</label>
				<div class="col-md-4" style="text-align:left;">${bean.S_INFO_NAME}</div>
			</div>
			<div class="form-group">
				<label class="col-md-6 control-label" style="text-align:right;">类型：</label>
				<div class="col-md-4" style="text-align:left;">${bean.S_INFO_WIND_INDUSTRYNAME}</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-6 control-label" style="text-align:right;">债券全称：</label>
				<div class="col-md-4" style="text-align:left;">${bean.B_INFO_FULLNAME}</div>
			</div>
			<div class="form-group">
				<label class="col-md-6 control-label" style="text-align:right;">实际发行总额(亿元)：</label>
				<div class="col-md-4" style="text-align:left;">${bean.B_ISSUE_AMOUNTACT}</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-6 control-label" style="text-align:right;">利率类型：</label>
				<div class="col-md-4" style="text-align:left;">${bean.B_INFO_INTERESTTYPE}</div>
			</div>
			<div class="form-group">
				<label class="col-md-6 control-label" style="text-align:right;">实际发行总额(亿元)：</label>
				<div class="col-md-4" style="text-align:left;">${bean.B_ISSUE_AMOUNTACT}</div>
			</div>
			<div class="form-group">
				<label class="col-md-6 control-label" style="text-align:right;">债券期限（天）：</label>
				<div class="col-md-4" style="text-align:left;">${bean.B_INFO_TERM_DAY_}</div>
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
