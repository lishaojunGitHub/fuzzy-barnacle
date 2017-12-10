<@layout.index menu="project" menuid=1>
<div class="row">
	<div class="col-lg-12">
		<section class="panel">
			<header class="panel-heading">
				<h2 class="panel-title"><#if action=="add">添加债券市场信息<#else>编辑债券市场信息</#if></h2>
			</header>
			<div class="panel-body">
				<form class="form-horizontal form-bordered" method="POST" action="/admin/bond/bond/save">
					<input type="hidden" name="bond.S_INFO_WINDCODE" value="${bean.S_INFO_WINDCODE}"/>
					<div class="form-group">
						<label class="col-md-3 control-label" for="inputDefault">债券全称</label>
						<div class="col-md-6">
							<input type="text" value="${bean.B_INFO_FULLNAME}" name="bond.B_INFO_FULLNAME" class="form-control" id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label" for="inputDefault">发行者</label>
						<div class="col-md-6">
							<input type="text" value="${bean.B_INFO_ISSUER}" name="bond.B_INFO_ISSUER" class="form-control" id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label" for="inputDefault">票面利率</label>
						<div class="col-md-6">
							<input type="text" value="${bean.B_INFO_COUPONRATE}" name="bond.B_INFO_COUPONRATE" class="form-control" id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label" for="inputDefault">名称</label>
						<div class="col-md-6">
							<input type="text" value="${bean.S_INFO_NAME}" name="bond.S_INFO_NAME" class="form-control" id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label" for="inputDefault">类型</label>
						<div class="col-md-6">
							<input type="text" value="${bean.S_INFO_WIND_INDUSTRYNAME}" name="bond.S_INFO_WIND_INDUSTRYNAME" class="form-control" id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label"></label>
						<div class="col-md-6 col-xs-11">
							<button style="float:right;" class="btn btn-primary">提 交</button>
						</div>
					</div>
				</form>
			</div>
		</section>
	</div>
</div>
<script type="text/javascript">
    $(".form_datetime").datepicker({format: 'yyyy-mm-dd HH:mm:SS'});
</script>        
</@layout.index>