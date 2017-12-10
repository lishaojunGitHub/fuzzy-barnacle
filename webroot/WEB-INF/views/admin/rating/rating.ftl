<@layout.index menu="rating_rating" menuid=1 style="padding-left:6px!important;padding-right:2px!important;">
<style>
.table{font-size:13px!important}
</style>
<section class="panel">
	<header class="panel-heading">
		<form action="/admin/rating/rating" method="POST">
			<div class="form-group alert alert-primary">
				<div class="col-md-2 col-xs-11"><input type="text" class="form-control input-sm mb-md" name="customer" value="${customer}" placeholder="公司名称"></div>
				<div class="col-md-2">
					<div class="col-md-12">
						<select name="reportPeriod" class="form-control input-sm mb-md">
							<option <#if reportPeriod==1>selected="selected"</#if> value="1">最新报告</option>
							<option <#if reportPeriod==2>selected="selected"</#if> value="2">3月内报告</option>
							<option <#if reportPeriod==3>selected="selected"</#if> value="3">更久报告</option>
						</select>
					</div>
				</div>
				<div class="col-md-2">
					<div class="col-md-12">
						<select name="statementType" class="form-control input-sm mb-md">
							<option <#if statementType==408001000>selected="selected"</#if> value="408001000">合并报表</option>
							<option <#if statementType==408002000>selected="selected"</#if> value="408002000">合并报表(单季度)</option>
							<option <#if statementType==408003000>selected="selected"</#if> value="408003000">合并报表(单季度调整)</option>
							<option <#if statementType==408004000>selected="selected"</#if> value="408004000">合并报表(调整)</option>
							<option <#if statementType==408005000>selected="selected"</#if> value="408005000">合并报表(更正前)</option>
							<option <#if statementType==408006000>selected="selected"</#if> value="408006000">母公司报表</option>
							<option <#if statementType==408007000>selected="selected"</#if> value="408007000">母公司报表(单季度)</option>
							<option <#if statementType==408008000>selected="selected"</#if> value="408008000">母公司报表(单季度调整)</option>
							<option <#if statementType==408009000>selected="selected"</#if> value="408009000">母公司报表(调整)</option>
							<option <#if statementType==408010000>selected="selected"</#if> value="408010000">母公司报表(更正前)</option>
						</select>
					</div>
				</div>
				<div class="col-md-1">
					<select name="account" class="form-control input-sm mb-md">
						<option value="万元">万元</option>
					</select>
				</div>
				<div class="col-md-1">
					<select name="account" class="form-control input-sm mb-md">
						<option value="人民币">人民币</option>
						
					</select>
				</div>
				<div class="col-md-1 col-xs-11">
					<button class="btn  btn-sm btn-success">搜索</button>
				</div>
			</div>
		</form>
	</header>
	<div class="panel-body table-responsive">
		<#if (customer!="" && bean!=null) || 1==1>
		<table class="table table-bordered table-striped mb-none dataTable no-footer" id="datatable-default" role="grid" aria-describedby="datatable-default_info">
			<thead>
				<tr role="row">
					<th colspan=2 style="text-align:center">因素</th>
					<th colspan=3 style="text-align:center">阈值</th>
					<th colspan=2 style="text-align:center">结果</th>
				</tr>
			</thead>
			<tbody>
				<tr class="gradeX" role="row">
					<td>一级指标</td>
					<td>二级指标</td>
					<td>优秀</td>
					<td>一般</td>
					<td>较差</td>
					<td>数值</td>
					<td>分数</td>
				</tr>
				<#list list1 as rm>
				<tr class="gradeX" role="row">
					<#if rm_index==0>
					<td rowspan=${list1?size}>经营效率</td>
					</#if>
					<td>${rm.getName()}</td>
					<td>${rm.getMax()}</td>
					<td>${rm.getMiddle()}</td>
					<td>${rm.getMin()}</td>
					<td>${rm.getValue()}</td>
					<td>#{rm.getScore();m2M2}</td>
				</tr>
				</#list>
				<#list list2 as rm>
				<tr class="gradeX" role="row">
					<#if rm_index==0>
					<td rowspan=${list2?size}>盈利能力</td>
					</#if>
					<td>${rm.getName()}</td>
					<td>${rm.getMax()}</td>
					<td>${rm.getMiddle()}</td>
					<td>${rm.getMin()}</td>
					<td>${rm.getValue()}</td>
					<td>#{rm.getScore();m2M2}</td>
				</tr>
				</#list>
				<#list list3 as rm>
				<tr class="gradeX" role="row">
					<#if rm_index==0>
					<td rowspan=${list3?size}>财务能力 </td>
					</#if>
					<td>${rm.getName()}</td>
					<td>${rm.getMax()}</td>
					<td>${rm.getMiddle()}</td>
					<td>${rm.getMin()}</td>
					<td>${rm.getValue()}</td>
					<td>#{rm.getScore();m2M2}</td>
				</tr>
				</#list>
			</tbody>
		</table>
		<#elseif customer=="">
			<div class="alert alert-danger">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				<strong>请输入查询公司名称！</strong>
			</div>
		<#elseif bean==null>
			<div class="alert alert-danger">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				<strong>无法获取公司信息，请确认！</strong>
			</div>
		</#if>
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