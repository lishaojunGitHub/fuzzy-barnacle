<@layout.index menu="customer" menuid=1>
<div class="row">
	<div class="col-lg-12">
		<section class="panel">
			<header class="panel-heading">
				<h2 class="panel-title"><#if action=="add">添加发行人<#else>编辑发行人</#if></h2>
			</header>
			<div class="panel-body">
				<form class="form-horizontal form-bordered" method="POST" action="/admin/customer/customer/save">
					<input type="hidden" name="customer.id" value="${bean.id}"/>
					<#assign md=3 />
					<div class="form-group">
						<label class="col-md-${md} control-label" for="inputDefault">公司名称</label>
						<div class="col-md-6">
							<input type="text" value="${bean.name}" name="customer.name" class="form-control" id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-${md} control-label" for="inputDefault">公司code</label>
						<div class="col-md-6">
							<input type="text" value="${bean.code}" name="customer.code" class="form-control" id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-${md} control-label" for="inputDefault">省</label>
						<div class="col-md-6">
							<input type="text" value="${bean.province}" name="customer.province" class="form-control" id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-${md} control-label" for="inputDefault">市</label>
						<div class="col-md-6">
							<input type="text" value="${bean.city}" name="customer.city" class="form-control" id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-${md} control-label" for="inputDefault">行业</label>
						<div class="col-md-6">
							<input type="text" value="${bean.industry_name2}" name="customer.industry_name2" class="form-control" id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-${md} control-label" for="inputDefault">公司性质</label>
						<div class="col-md-6">
							<input type="text" value="${bean.property}" name="customer.property" class="form-control" id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-${md} control-label"></label>
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