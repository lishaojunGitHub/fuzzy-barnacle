<@layout.index menu="rating_stockholder" menuid=1>
<style>
.table{font-size:14px!important}
.LightSkyBlue{background-color:#87CEFA;}
</style>
<section class="panel">
	<header class="panel-heading">
		<form action="/admin/rating/stockholder" method="POST">
			<div class="form-group">
				<div class="col-md-2 col-xs-11"><input type="text" class="form-control" name="customer" value="${customer}" placeholder="公司名称"></div>
				<div class="col-md-3 col-xs-11">
					<button class="btn  btn-sm btn-primary">查询</button>
				</div>
			</div>
		</form>
	</header>
	<div class="panel-body">
		<table class="table table-bordered mb-none">
			<tbody>
				<thead>
					<tr>
						<th class="LightSkyBlue">股东名称</th>
						<th class="LightSkyBlue">持股比例(%)</th>
						<th class="LightSkyBlue">企业性质</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>001</td>
						<td>三级</td>
						<td>国有企业 </td>
					</tr>
					<tr>
						<td>001</td>
						<td>三级</td>
						<td>国有企业 </td>
					</tr>
					<tr>
						<td>001</td>
						<td>三级</td>
						<td>国有企业 </td>
					</tr>
				</tbody>
			</tbody>
		</table>
	</div>
</section>
<script>
(function($) {
	'use strict';
	var datatableInit = function() {
		$('#datatable-default').dataTable({"pageLength": 50});
	};
	$(function() {
		datatableInit();
	});
}).apply(this,[jQuery]);
</script>
</@layout.index>